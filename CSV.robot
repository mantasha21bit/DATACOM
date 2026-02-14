*** Settings ***
Library     DataDriver      file=C:/Users/91790/PycharmProjects/WiproRobotFramework/TestData/users.csv      sheet_name=users.csv


Test Template       login test

*** Test Cases ***
login with user     ${username} and     ${password}

*** Keywords ***
login test
        [Arguments]     ${username}     ${password}
        Log    username: ${username} , password:${password}


