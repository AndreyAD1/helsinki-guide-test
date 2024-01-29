*** Settings ***
Library    Dialogs
Library    SeleniumLibrary
Resource    page_objects/chat.resource
Resource    page_objects/bot_panel.resource
Resource    page_objects/left_panel.resource

*** Keywords ***
Start the Bot
    [Arguments]    ${url}    ${browser}    ${bot_name}
    Should Not Be Empty    ${bot_name}  Set a variable BOT_NAME
    Set Selenium Speed    0.3 second
    Open Browser    ${url}    ${browser}
    Dialogs.Execute Manual Step    Log in to Web Telegram. Continue when Telegram chats become visible.
    ...  Error at a manual signing in.
    left_panel.Search Telegram User By Name    ${bot_name}
    left_panel.Open A User From Search Results    ${bot_name}
    bot_panel.Click 'Start' Button

Teardown
    Delete The Bot Chat
    Log Out
    Close All Browsers

Log Out
    Wait Until Keyword Succeeds    5 s  1 s  left_panel.Open Menu
    left_panel.Open Settings
    left_panel.Log Out
    Sleep    1s
