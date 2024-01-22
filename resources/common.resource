*** Settings ***
Library    Dialogs
Library    SeleniumLibrary

*** Keywords ***
Start the Bot
    [Arguments]    ${url}    ${browser}    ${bot_name}
    Should Not Be Empty    ${bot_name}  Set a variable BOT_NAME
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Dialogs.Execute Manual Step    Log in to Web Telegram. Contine when Telegram chats become visible.  Error at a manual signing in.
    Input Text     css:input[class='input-search-input']    ${bot_name}
    # The other id is also possible
    # Input Text     id:telegram-search-input    ${bot_name}
    Wait Until Page Contains Element    css:div[class='search-section'] div[aria-label=${bot_name}]
    Click Element    css:div[class='search-section'] div[aria-label=${bot_name}]
    Wait Until Page Contains Element    //button[contains(text(),'START')]
    Click Element    //button[contains(text(),'START')]
    Sleep    3

Teardown
    Close All Browsers
