*** Settings ***
Library    Dialogs
Library    SeleniumLibrary

*** Keywords ***
Start the Bot
    [Arguments]    ${url}    ${browser}    ${bot_id}
    Should Not Be Empty    ${bot_id}  Set a variable BOT_ID
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Dialogs.Execute Manual Step    Log in to an application  Error at a manual signing in.
    Click Element    css:a[href='#${bot_id}']

Teardown
    Close All Browsers
