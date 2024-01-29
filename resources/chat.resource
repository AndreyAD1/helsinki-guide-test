*** Settings ***
Library    String
Library    ../libraries/telegram_chats.py    AS    ChatLib
Resource    page_objects/chat.resource
*** Variables ***
${expected start response} =    Hello! I'm a bot that provides information about Helsinki buildings.
...
...  If you send me a message, I will provide all addresses I know that are similar to your message.
...  If you click the button "Share my location and get the nearest buildings", I will provide all known addresses that are close to your location.
...
...  Available commands:
...  /start - I will send a greeting message.
...  /addresses - I will return all addresses I know.
...  /settings - I will return a menu so that you can manage your preferences.
...  /help - I will show this message.
...  separator=\n
${expected help response} =    If you send me a message, I will provide all addresses I know that are similar to your message.
...  If you click the button "Share my location and get the nearest buildings", I will provide all known addresses that are close to your location.
...
...  Available commands:
...  /start - I will send a greeting message.
...  /addresses - I will return all addresses I know.
...  /settings - I will return a menu so that you can manage your preferences.
...  /help - I will show this message.
...  separator=\n
${expected addresses response template} =    Search address: {}
...  Available building addresses and names:
...  separator=\n

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
    Verify Returned Addresses    ${message text}

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
    [Arguments]    ${sent text}
    ${expected response} =    String.Format String    ${expected addresses response template}  ${sent text}
    Verify A Response Text    ${expected response}
    Verify Address Buttons