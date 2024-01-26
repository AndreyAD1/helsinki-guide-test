*** Settings ***
Library    Dialogs
Library    SeleniumLibrary
Library    String

*** Variables ***
${command_menu_locator} =    css:.Button.bot-commands
${command_locator_template} =    xpath://div[contains(concat(' ',normalize-space(@class),' '),' BotCommand ')]//span[.='/{}']
${more actions button locator} =    css:.Button[title='More actions']
${delete chat button locator} =    xpath://*[.='Delete chat']
${last message locator} =    css:.Message.last-in-list .text-content
*** Keywords ***
Open a Command Menu
    Click Element    ${command_menu_locator}

Click the Command Button
    [Arguments]    ${command_name}
    ${command_locator} =    Format String    ${command_locator_template}  ${command_name}
    Wait Until Element Is Visible    ${command_locator}
    Click Element    ${command_locator}

Delete The Bot Chat
    Click Element    ${more actions button locator}
    Click Element    ${delete chat button locator}
    Click Button    Delete

Get Last Message Text
    ${message text} =    Get Text    ${last_message locator}
    RETURN    ${message text}