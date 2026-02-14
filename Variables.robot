*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${name}     john
${city}     hyd
${address}      malakpet
@{list1}        green  red  blue
@{list2}        apple  banana  grapes
&{credentials}      username=admin       password=admin123

*** Test Cases ***
Verify to login
        [Documentation]     just checking
        [Tags]      Regression
        Log    ${name}
        Log    ${city}
        Log    ${address}
        FOR    ${element}    IN    @{list1}
            Log    ${element}
        END
        FOR    ${element}    IN    @{list2}
            Log    ${element}
        END
        Log    ${list1}[0]
        Log    ${credentials}[username]
        Log    ${credentials}[password]
        Log    hi

