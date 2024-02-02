*** Settings ***
Name    Smoke tests
Documentation    This test suite checks the basic functionality.
Test Tags    smoke
Resource    ../resources/chat.resource
Resource    ../data/expectations.resource

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
    Send And Verify An Arbitrary Message    Gyldenintie  expected button number=11  expect next button=${True}
    Get Building    Gyldenintie 10 A,B - As Oy Kaislakallio  ${expected building info}
