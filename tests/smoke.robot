*** Settings ***
Name    Smoke tests
Documentation    This test suite checks the basic functionality.
Resource    ../resources/common.resource
Suite Setup    Start the Bot

*** Test Cases ***
Start Message
    Log To Console    Dummy
