*** Settings ***
Name    Smoke tests
Documentation    This test suite checks the basic functionality.
Resource    ../resources/chat.resource
Resource    ../data/expectations.resource

*** Variables ***
${WEB_TELEGRAM_URL} =    https://web.telegram.org/a/
${BROWSER} =    firefox
${BOT_NAME}

*** Test Cases ***
Basic Commands
    [Template]    Send and Verify A Basic Command
    start    ${expected start response}
    help    ${expected help response}

An Address Command
    Send And Verify the '/addresses' Command

Get Building Info
    Send And Verify The '/settings' Command
    Set Language    English
    Send And Verify An Arbitrary Message    Gyldenintie
    Get Building    Gyldenintie 10 A,B - As Oy Kaislakallio  ${expected building info}
