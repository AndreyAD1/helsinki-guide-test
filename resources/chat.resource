*** Settings ***
Resource    page_objects/chat.resource
*** Variables ***
${expected start response} =    Hello! I'm a bot that provides information about Helsinki buildings.<br><br>If you send me a message, I will provide all addresses I know that are similar to your message.<br>If you click the button "Share my location and get the nearest buildings", I will provide all known addresses that are close to your location.<br><br>Available commands: <br><a class="text-entity-link" dir="auto" data-entity-type="MessageEntityBotCommand">/start</a>&nbsp;- I will send a greeting message.<br><a class="text-entity-link" dir="auto" data-entity-type="MessageEntityBotCommand">/addresses</a>&nbsp;- I will return all addresses I know.<br><a class="text-entity-link" dir="auto" data-entity-type="MessageEntityBotCommand">/settings</a>&nbsp;- I will return a menu so that you can manage your preferences.<br><a class="text-entity-link" dir="auto" data-entity-type="MessageEntityBotCommand">/help</a>&nbsp;- I will show this message.
*** Keywords ***
Send A '/start' Command
    chat.Hover Over Command Button
    chat.Click The Command    start

Verify A '/start' Response
    Wait Until Page Contains    ${message locator}
    ${message} =    Get Text    ${message locator}
    ${message text} =    Fetch From Left    ${message}  <span
    Should Be Equal    ${message text}  ${expected start response}
    Log    start
