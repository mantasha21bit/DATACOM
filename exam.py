import random
import time 

class NetworkkDevice:
    def __init__(self , device_id, device_type , management_ip , admin_state, interface_count):
        self.device_id = device_id
        self.device_type = device_type
        self.management_ip=management_ip
        self.admin_state = admin_state
        self.interface_count= interface_count
        self.running_config = {}
        self.candidate_config ={}
    def get_config(self):
        return self.running_config
    def edit_config(self , config_data):
        self.candidate_config.update(config_data)
    def commit(self):
        self.running_config.update(self.candidate_config)
        self.candidate_config={}
    def delete_config(self , key):
        if key in self.running_config:
            del self.running_config[key]

class NETCONFSessionManager:
    def __init__(self):
        self.active_sessions ={}
    def open_session(self , device):
        self.active_sessions[device.device_id] = device
        print(f"NETCONF Session opened with {device.device_id}")
    def close_session(self , device):
        if device.device_id in self.active_sessions:
            del self.active_sessions[device.device_id]
            print(f"NETCONF Session closed with {device.device_id}")
    def get(self , device):
        print("GET CONFIG:" , device.get_config())
    def edit_config(self , device , config_data):
        device.edit_config(config_data)
        print("EDIT-CONFIG done")
    def commit(self , device):
        device.commit()
        print("COMMIT Successful")
    def delete_config(self , device , key):
        device.delete_config(key)
        print("DELETE-CONFIG done")

class RESTCONFSimulator:
    def get(self , device):
        print("RESTCONF GET:" ,  device.get_config())
    def post(self , device , config_data):
        device.edit_config(config_data)
        device.commit()
        print("RESTCONF POST applied")
    def put(self , device , config_data):
        device.edit_config(config_data)
        device.commit()
        print("RESTCONF PUT applied")
    def delete(self , device , key):
        device.delete_config(key)
        print("RESTCONF DELETE done")

class AlarmManager:
    def __init__(self):
        self.alarms ={}
    def raise_alarm(self , alarm_id , device_id , severity , cause):
        if alarm_id not in self.alarms:
            self.alarms[alarm_id] = {
                "device": device_id,
                "severity": severity,
                "cause": cause, 
                "state": "ACTIVE"
            }
            print("ALARM RAISED :", self.alarms[alarm_id])
    def clear_alarm(self , alarm_id):
        if alarm_id in self.alarms:
            self.alarms[alarm_id]["state"] = "CLEARED"
            print("ALARM CLEARED :", self.alarms[alarm_id])

    def correlate(self):
        cause ={}
        for alarm_id , alarm in self.alarms.items() :
            if alarm["state"] == "ACTIVE":
                cause= alarm["cause"]
                cause.setdefault(cause , [] ).append(alarm_id)
        for cause , alarm_list in cause.items():
            if len(alarm_list) > 1:
                print("CORRELATED ROOT CAUSE: " , cause , "ALARM:" , alarm_list)

class TelementrySimulator:
    def __init__(self, alarm_manager):
        self.alarm_manager = alarm_manager

    def collect(self, device ):
        cpu = random.randint(10 , 100)
        print(f"Telementry CPU = {cpu}% from {device.device_id}")
        if cpu >80:
            self.alarm_manager.raise_alarm( alarm_id = f"CPU-{device.device_id}",
                                           device_id = device.device_id, 
                                           severity="CRITICAL",
                                           cause = "HIGH_CPU"
                                           )    
        else:
            self.alarm_manager.clear_alarm(f"CPU-{device.device_id}")
def main():
    device1= NetworkkDevice("RTR1", "Router", "10.0.0.1" , "UP" , 8)
    device2= NetworkkDevice("SW1", "Switch", "10.0.0.2" , "UP" , 8)

    netconf =NETCONFSessionManager()
    restconf = RESTCONFSimulator()
    alarms = AlarmManager()
    telementry= TelementrySimulator()

    netconf.open_session(device1)
    netconf.edit_config(device1 , {"hostname": "Router-1"})
    netconf.commit(device1)
    netconf.close_session(device1)

    restconf.post(device2 , {"hostname": "Switch-1"})
    restconf.get(device2)

    for _ in range(5):
        telementry.collect(device1)
        telementry.collect(device2)
        alarms.correlate()
        time.sleep(1)

    print("Final Alarm Table:" , alarms.alarms)

if __name__ == "__main__":
    main()