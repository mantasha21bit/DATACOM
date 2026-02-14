*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}    Firefox

*** Test Cases ***
Launch browser
    [Documentation]    This testcase verifies the logins scenario with valid credentials
    Open Browser    https://the-internet.herokuapp.com/javascript_alerts    ${browser}
    Maximize Browser Window

    # Page screenshot
    Capture Page Screenshot    C:/Users/91790/Downloads/robot.png

    # Element screenshot
    Capture Element Screenshot    xpath://button[normalize-space()='Click for JS Alert']        C:/Users/91790/Downloads/robot12.png

    Sleep    4s
    Close Browser
