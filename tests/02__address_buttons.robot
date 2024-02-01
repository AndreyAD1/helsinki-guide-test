*** Settings ***
Name    Address Buttons
Documentation    This test suite verifies address buttons in detail.
Resource    ../resources/chat.resource

*** Test Cases ***
Get Next Buildings After '/addresses'
    Send And Verify The '/addresses' Command
    Get Next Buildings    ${EMPTY}  11  ${True}

#Get All Next Buildings
#    Send And Verify An Arbitrary Message