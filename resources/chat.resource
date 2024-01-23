*** Settings ***
Resource    page_objects/chat.resource

*** Keywords ***
Send A '/start' Command
    chat.Hover Over Command Button
    chat.Click The Command    /start

Verify A '/start' Response
    Log    start
