*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}      Chrome

*** Test Cases ***
Launch browser
        Open Browser    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login      ${browser}

