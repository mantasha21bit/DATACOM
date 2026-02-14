*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}      chrome

*** Test Cases ***
Launch browser
        Open Browser    https://rahulshettyacademy.com/AutomationPractice/      ${browser}
        Maximize Browser Window
        Wait Until Element Is Visible    id:checkBoxOption3
        Click Element    id:checkBoxOption3
        Close Browser

