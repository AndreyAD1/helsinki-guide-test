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
#Basic Commands
#    [Template]    Send and Verify A Basic Command
#    start    ${expected start response}
#    help    ${expected help response}
#
#A Setting Command
#    Send And Verify The '/settings' Command
#
#An Address Command
#    Send And Verify the '/addresses' Command
    
An Arbitrary Address
    Send An Arbitrary Message    Gyldenintie
    Verify Returned Addresses   Gyldenintie

*** Keywords ***
Verify Returned Addresses
    [Arguments]    ${sent text}
    ${expected response} =    String.Format String    ${expected addresses response template}  ${sent text}
    Verify A Response Text    ${expected response}
    Verify Addresses Buttons