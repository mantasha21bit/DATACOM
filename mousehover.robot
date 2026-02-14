*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}    Firefox

*** Test Cases ***
Launch browser
    [Documentation]    This testcase verifies the logins scenario with valid credentials
    Open Browser    https://the-internet.herokuapp.com/hovers    ${browser}
    Maximize Browser Window
    Mouse Over    xpath://div[@class='example']//div[1]//img[1]
    Sleep    2s
    Element Should Be Visible    xpath://h5[normalize-space()='name: user1']
    Close Browser
