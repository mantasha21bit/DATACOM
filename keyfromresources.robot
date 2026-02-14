*** Settings ***
Resource    ./../Resources/resource.robot

*** Test Cases ***
new example
        Login
        launch browser
        close browser