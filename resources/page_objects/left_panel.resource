*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${search_panel_locator} =    id:telegram-search-input
${search_result_locator_template} =     css:div[class='search-section'] div[aria-label={}]
${menu_locator} =    css:button[title='Open menu']
${settings_locator} =    xpath://div[text()='Settings']
${more_actions_locator} =    css:button[title='More actions']
${log_out_button_locator} =    xpath://div[text()='Log Out']

*** Keywords ***
Search Telegram User By Name
    [Arguments]    ${name}
    Input Text     ${search_panel_locator}    ${name}

Open A User From Search Results
    [Arguments]    ${username}
    ${locator} =     String.Format String    ${search_result_locator_template}  ${username}
    Wait Until Page Contains Element    ${locator}
    Click Element    ${locator}

Open Menu
    Click Element    ${menu_locator}

Open Settings
    Click Element    ${settings_locator}

Log Out
    Click Element    ${more_actions_locator}
    Click Element    ${log_out_button_locator}
    Click Button    Log Out

