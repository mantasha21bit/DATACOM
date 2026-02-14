*** Settings ***
Library     SeleniumLibrary
Library    OperatingSystem
Library    Collections

*** Variables ***
${browser}      chrome

*** Test Cases ***
Launch browser
        Open Browser    https://the-internet.herokuapp.com/download      ${browser}
        Maximize Browser Window
        Wait Until Element Is Visible    xpath://a[normalize-space()='random_data.txt']
        Click Element       xpath://a[normalize-space()='random_data.txt']
        ${files}=       List Files In Directory     C:/Users/91790/Downloads
        List Should Contain Value       ${files}        random_data.txt
        Sleep    2s
        Close Browser

