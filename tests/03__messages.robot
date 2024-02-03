*** Settings ***
Name    Messages
Test Tags    common_messages
Documentation    This test suite verifies common messages.
Resource   ../resources/chat.resource

*** Test Cases ***
Send One Character Message
    Send And Verify An Arbitrary Message    r  11  ${True}

Send Message And Get No Addresses
    [Template]    Send Message And Receive No Addresses
    absent address
    сообщение из нелатинских букв
    1234 56779 123213