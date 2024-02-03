"""A library for processing Telegram chat messages."""
from robot.api.deco import keyword
from selenium.webdriver.remote.webelement import WebElement, By

ROBOT_LIBRARY_VERSION = '0.1'
ROBOT_AUTO_KEYWORDS = False

EXPECTED_NEXT_BUTTON_TEXT = "Next 10 buildings"


@keyword
def verify_settings_response(response_message: WebElement):
    buttons = response_message.find_elements(
        by=By.CSS_SELECTOR,
        value=".InlineButtons .row .Button",
    )
    expected_button_names = ["Finnish", "English", "Russian"]
    assert len(buttons) == len(expected_button_names), f"Unexpected button number: {buttons}"
    for expected_name, button in zip(expected_button_names, buttons):
        err_message = f"Unexpected button text: {expected_name}. Expect: {button.text}."
        assert expected_name == button.text, err_message


@keyword
def check_address_buttons(
        response_message: WebElement,
        expected_button_number: int,
        next_button_is_expected: bool = True,
):
    buttons = response_message.find_elements(
        by=By.CSS_SELECTOR,
        value=".InlineButtons .row .Button",
    )
    error_msg = f"Unexpected button number: {len(buttons)}. Expect: {expected_button_number}"
    assert len(buttons) == expected_button_number, error_msg
    if expected_button_number == 0:
        return
    last_button = buttons[-1]
    if next_button_is_expected:
        error_msg = "Unexpected last button text: {}. Expect: {}".format(
            last_button.text,
            EXPECTED_NEXT_BUTTON_TEXT,
        )
        assert last_button.text == EXPECTED_NEXT_BUTTON_TEXT, error_msg
    else:
        assert last_button.text != EXPECTED_NEXT_BUTTON_TEXT, "Unexpected next button"



