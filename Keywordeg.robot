*** Settings ***
Library    SeleniumLibrary
Library    Telnet

*** Variables ***
${name}     john


*** Test Cases ***
Verify login function
        [Documentation]     just checking
        login
Verify product display
        Login
        Log    user adds the product

*** Keywords ***
Login
    Log    user loged in
    Log    some more message
    Log    some more just to understand