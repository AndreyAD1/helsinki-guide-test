*** Settings ***
Library    Dialogs
Library    SeleniumLibrary

*** Keywords ***
Start the Bot
    [Arguments]    ${url}    ${browser}    ${bot_name}
    Should Not Be Empty    ${bot_name}  Set a variable BOT_NAME
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Dialogs.Execute Manual Step    Log in to Web Telegram. Continue when Telegram chats become visible.  
    ...  Error at a manual signing in.
    Page Should Contain Element    id:telegram-search-input  message=locator_error  limit=1
    Input Text     id:telegram-search-input    ${bot_name}
    Wait Until Page Contains Element    css:div[class='search-section'] div[aria-label=${bot_name}]
    Click Element    css:div[class='search-section'] div[aria-label=${bot_name}]
    TRY
        Wait Until Page Contains Element    //button[contains(text(),'START')]
        Click Element    //button[contains(text(),'START')]
    EXCEPT  Element '//button[contains(text(),'START')]' did not appear in 5 seconds.
        Log    A bot chat has already been started.
    END

Teardown
    Close All Browsers
