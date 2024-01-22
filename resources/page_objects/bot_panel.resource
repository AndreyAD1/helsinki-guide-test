*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${start_button_locator} =     //button[contains(text(),'START')]
${expected_error_template} =    Element '{}' did not appear in 5 seconds.

*** Keywords ***
Click 'Start' Button
    ${expected_error} =     String.Format String    ${expected_error_template}  ${start_button_locator}
    TRY
        Wait Until Page Contains Element    ${start_button_locator}
        Click Element    ${start_button_locator}
    EXCEPT  ${expected_error}
        Log    A bot chat has already been started.
    END