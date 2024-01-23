*** Settings ***
Name    Smoke tests
Documentation    This test suite checks the basic functionality.
Resource    ../resources/common.resource
Resource    ../resources/chat.resource
Suite Setup    Start the Bot    ${WEB_TELEGRAM_URL}  ${BROWSER}  ${BOT_NAME}
Suite Teardown    Teardown

*** Variables ***
${WEB_TELEGRAM_URL} =    https://web.telegram.org/a/
${BROWSER} =    firefox
${BOT_NAME}

*** Test Cases ***
Start Message
    chat.Send A '/start' Command
    chat.Verify A '/start' Response
