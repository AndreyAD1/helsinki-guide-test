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
    Verify Address Buttons    11  ${True}

Set Language
    [Arguments]    ${language}
    chat.Click Last Message Button    ${language}
    ${expected language response} =    Format String    ${language response template}  ${language}
    Verify A Response Text    ${expected language response}

Send And Verify An Arbitrary Message
    [Arguments]    ${message text}  ${expected button number}  ${expect next button}
    Send An Arbitrary Message    ${message text}
    ${expected text} =    String.Format String    ${expected addresses response template}  ${message text}
    Verify Returned Addresses    ${expected text}  ${expected button number}  ${expect next button}

Get Building
    [Arguments]    ${address}    ${expected response}
    chat.Click Last Message Button    ${address}
    Verify A Response Text    ${expected response}

Get Next Buildings    
    [Arguments]    ${search address}  ${expected button number}  ${expect next button}
    ${latest message id} =    chat.Get Latest Message ID
    ${expected id} =    Get Expected ID    ${latest message id}
    chat.Click Last Message Button    Next 10 buildings
    ${expected text} =    String.Format String    ${expected addresses response template}  ${search address}
    Verify Returned Addresses    ${expected text}  ${expected button number}  ${expect next button}  expected id=${expected id}
    Verify That Clicked Button Disappeared    ${latest message id}  10

# -----------| Test Procedures |-----------
Send A Command
    [Arguments]    ${command name}
    chat.Open a Command Menu
    chat.Click the Command Button    ${command name}

Verify A Response Text
    [Arguments]    ${expected response}    ${expected id}=${None}
    IF    $expected_id != $None
        Wait Until Keyword Succeeds    10 s  1 s  Verify New Latest Message Exists  ${expected id}
    END
    Wait Until Keyword Succeeds    10 s  1 s  Verify Latest Message Text  ${expected response}

Verify Latest Message Text
    [Arguments]    ${expected message}
    ${message text} =    chat.Get Last Message Text
    ${bot text}  ${time} =    Split String From Right    ${message text}  ${\n}  1
    Should Be Equal    ${bot text}  ${expected message}

Verify Setting Buttons
    ${last_message} =    chat.Get Last Message
    ChatLib.Verify Settings Response    ${last_message}

Verify Address Buttons
    [Arguments]    ${expected button number}  ${expect next button}
    ${last_message} =    chat.Get Last Message
    ChatLib.Check Address Buttons    ${last_message}  ${expected button number}  ${expect next button}

Send An Arbitrary Message
    [Arguments]    ${message}
    chat.Input Message    ${message}
    chat.Send Message

Verify Returned Addresses
    [Arguments]    ${expected text}  ${expected button number}  ${expect next button}  ${expected id}=${None}
    Verify A Response Text    ${expected text}  expected id=${expected_id}
    Verify Address Buttons    ${expected button number}  ${expect next button}
    
Get Expected ID
    [Arguments]    ${latest message id}
    ${only id} =    Fetch From Right    ${latest message id}  message
    ${expected id number} =    Evaluate    int(${only id}) + 1
    ${expected id} =    Format String    message{}  ${expected id number}
    RETURN    ${expected id}

Verify That Clicked Button Disappeared    
    [Arguments]    ${message id}  ${expected button number}
    ${last_message} =    chat.Get Message By ID    ${message id}
    ChatLib.Check Address Buttons    ${last_message}  ${expected button number}  ${False}