*** Settings ***
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
*** Keywords ***
Send A '/start' Command
    chat.Hover Over Command Button
    chat.Click The Command    start

Verify A '/start' Response
    ${message text} =    chat.Get Last Message Text
    ${bot text}  ${time} =    Split String From Right    ${message text}  ${\n}  1
    Should Be Equal    ${bot text}  ${expected start response}
