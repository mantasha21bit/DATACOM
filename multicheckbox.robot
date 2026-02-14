*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}      chrome

*** Test Cases ***
Launch browser
        Open Browser    https://rahulshettyacademy.com/AutomationPractice/      ${browser}
        Maximize Browser Window
        ${elements}=        Get WebElements    //input[@type='checkbox']
        FOR    ${element}    IN    @{elements}
            Click Element    ${element}
            Sleep    2s
        END
        Close Browser

