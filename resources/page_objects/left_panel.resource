*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${search_panel_locator} =    id:telegram-search-input
${search_result_locator_template} =     css:div[class='search-section'] div[aria-label={}]

*** Keywords ***
Search Telegram User By Name
    [Arguments]    ${name}
    Input Text     ${search_panel_locator}    ${name}

Open A User From Search Results
    [Arguments]    ${username}
    ${locator} =     String.Format String    ${search_result_locator_template}  ${username}
    Wait Until Page Contains Element    ${locator}
    Click Element    ${locator}

