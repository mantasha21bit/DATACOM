*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}      chrome

*** Test Cases ***
Launch browser
        Open Browser    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login      ${browser}
        Maximize Browser Window
        Wait Until Element Is Visible    xpath://input[@name='username']
        Input Text    xpath://input[@name='username']    Admin
        Wait Until Element Is Visible    xpath://input[@name='password']
        Input Password    xpath://input[@name='password']    admin123
        Wait Until Element Is Visible    xpath://button[@type='submit']
        Click Element    xpath://button[@type='submit']
        Wait Until Element Is Visible    xpath://h6[normalize-space()='Dashboard']
        Element Should Be Visible    xpath://h6[normalize-space()='Dashboard']
        Close Browser

