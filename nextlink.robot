*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}    Chrome
${url}        https://the-internet.herokuapp.com/
${link_text}  A/B Testing

*** Test Cases ***
Verify link is working
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

    Element Should Be Visible    link:${link_text}
    Click Link    ${link_text}

    Wait Until Page Contains    A/B Test Control
    Location Should Contain    /abtest

    Close Browser
