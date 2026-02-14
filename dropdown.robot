*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}      chrome

*** Test Cases ***
Launch browser
        Open Browser    https://rahulshettyacademy.com/AutomationPractice/      ${browser}
        Maximize Browser Window
        ${lables}=      Get Selected List Labels        id:dropdown-class-example
        Log     ${lables}
        #select by value
        Select From List By Value       id:dropdown-class-example       option1
        Sleep       2s
        #select by index
        Select From List By Index       id:dropdown-class-example       2
        Sleep       2s
        #select by visible text
        Select From List By Label       id:dropdown-class-example       Option3
        Sleep       2s
        Close Browser