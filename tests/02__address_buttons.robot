*** Settings ***
Name    Address Buttons
Documentation    This test suite verifies address buttons in detail.
Test Tags    addresses
Resource    ../resources/chat.resource

*** Variables ***
${search address} =    kat
${next click number} =    2
${buildings in latest message} =    5

*** Test Cases ***
Get Next Buildings After '/addresses'
    Send And Verify The '/addresses' Command
    Get Next Buildings    ${EMPTY}  11  ${True}

Get All Buildings
    Send And Verify An Arbitrary Message    ${search address}  11  ${True}
    Get All Next Buildings    ${next click number}  ${search address}  ${buildings in latest message}
