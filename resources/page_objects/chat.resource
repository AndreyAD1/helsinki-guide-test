*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${command_menu_locator} =    css:.BotCommandMenu
${command_button_locator} =    xpath://div[class="BotCommand"]//span[text()="{}"]
*** Keywords ***
Hover Over Command Button
    Mouse Over    ${command_menu_locator}
    
Click The Command
    [Arguments]    ${command_name}
    ${command_locator} =    Format String    ${command_button_locator}  ${command_name}
    Click Element    ${command_locator}
    