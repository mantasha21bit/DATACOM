*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}      chrome

*** Test Cases ***
Launch browser
        Open Browser    https://rahulshettyacademy.com/AutomationPractice/      ${browser}
        Maximize Browser Window
        Wait Until Element Is Visible    xpath://input[@value='radio1']
        Click Element    xpath://input[@value='radio1']
        Close Browser
