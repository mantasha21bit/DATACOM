*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}      chrome
${path}     C:/Good vibes only.png

*** Test Cases ***
Launch browser
        Open Browser    https://the-internet.herokuapp.com/upload      ${browser}
        Maximize Browser Window
        Choose File    xpath://input[@id='file-upload']    ${path}
        Click Element    xpath://input[@id='file-submit']
        Wait Until Element Is Visible    xpath://h3[normalize-space()='File Uploaded!']
        Element Should Be Visible    xpath://h3[normalize-space()='File Uploaded!']
        Sleep    2s
        Close Browser

