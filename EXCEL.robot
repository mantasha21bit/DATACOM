*** Settings ***
Library     DataDriver      file=C:/Users/91790/PycharmProjects/WiproRobotFramework/TestData/user.xlsx    sheet_name=user


Test Template       login test

*** Test Cases ***
login with user     ${username} and     ${password}

*** Keywords ***
login test
        [Arguments]     ${username}     ${password}
        Log    username: ${username} , password:${password}


