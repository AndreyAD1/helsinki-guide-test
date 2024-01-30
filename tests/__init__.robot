*** Settings ***
Name    All Tests
Documentation    This test suite includes all tests and controls a browser.
Resource    ../resources/common.resource
Suite Setup    Start the Bot    ${WEB_TELEGRAM_URL}  ${BROWSER}  ${BOT_NAME}
Suite Teardown    Teardown

*** Variables ***
${WEB_TELEGRAM_URL} =    https://web.telegram.org/a/
${BROWSER} =    firefox
${BOT_NAME}