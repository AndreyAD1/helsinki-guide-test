*** Settings ***
Library    Dialogs
Library    SeleniumLibrary
Library    String

*** Variables ***
${command_menu_locator} =    css:.Button.bot-commands
${command_locator_template} =    xpath://div[contains(concat(' ',normalize-space(@class),' '),' BotCommand ')]//span[.='/{}']
*** Keywords ***
Hover Over Command Button
    Mouse Over    ${command_menu_locator}

Click The Command
    [Arguments]    ${command_name}
    ${command_locator} =    Format String    ${command_locator_template}  ${command_name}
    Wait Until Page Contains Element    ${command_locator}
    Click Element    ${command_locator}
