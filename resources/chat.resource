*** Settings ***
Library    String
Library    ../libraries/telegram_chats.py    AS    ChatLib
Resource    page_objects/chat.resource
Resource    ../data/expectations.resource

*** Keywords ***
# -----------| High-level wrappers |-----------
Send and Verify A Basic Command
    [Arguments]    ${command name}  ${expected response}
    Send A Command    ${command name}
    Verify A Response Text    ${expected response}

Send And Verify The '/settings' Command
    Send and Verify A Basic Command    settings  Choose a preferable language:
    Verify Setting Buttons

Send And Verify The '/addresses' Command
    ${expected text} =    String.Format String    ${expected addresses response template}  ${EMPTY}
    Send and Verify A Basic Command    addresses  ${expected text}
    Verify Address Buttons

Send And Verify An Arbitrary Message
    [Arguments]    ${message text}
    Send An Arbitrary Message    ${message text}
    ${expected text} =    String.Format String    ${expected addresses response template}  ${message text}
    Verify Returned Addresses    ${expected text}

Get Building
    [Arguments]    ${address}    ${expected response}
    chat.Click Building Button    ${address}
    Verify A Response Text    ${expected response}

# -----------| Test Procedures |-----------
Send A Command
    [Arguments]    ${command name}
    chat.Open a Command Menu
    chat.Click the Command Button    ${command name}

Verify A Response Text
    [Arguments]    ${expected response}
    Wait Until Keyword Succeeds    10 s  1 s  Verify Latest Message  ${expected response}

Verify Latest Message
    [Arguments]    ${expected message}
    ${message text} =    chat.Get Last Message Text
    ${bot text}  ${time} =    Split String From Right    ${message text}  ${\n}  1
    Should Be Equal    ${bot text}  ${expected message}

Verify Setting Buttons
    ${last_message} =    chat.Get Last Message
    ChatLib.Verify Settings Response    ${last_message}

Verify Address Buttons
    ${last_message} =    chat.Get Last Message
    ChatLib.Verify Addresses Response    ${last_message}

Send An Arbitrary Message
    [Arguments]    ${message}
    chat.Input Message    ${message}
    chat.Send Message

Verify Returned Addresses
    [Arguments]    ${expected text}
    Verify A Response Text    ${expected text}
    Verify Address Buttons