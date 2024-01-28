"""A library for processing Telegram chat messages."""
from robot.api.deco import keyword
from selenium.webdriver.remote.webelement import WebElement, By

ROBOT_LIBRARY_VERSION = '0.1'
ROBOT_AUTO_KEYWORDS = False

EXPECTED_BUTTON_NUMBER = 11
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
def verify_addresses_response(response_message: WebElement):
    buttons = response_message.find_elements(
        by=By.CSS_SELECTOR,
        value=".InlineButtons .row .Button",
    )
    assert len(buttons) == EXPECTED_BUTTON_NUMBER, f"Unexpected button number: {buttons}"
    last_button = buttons[-1]
    err_template = f"Unexpected last button text: {last_button.text}. Expect: {EXPECTED_NEXT_BUTTON_TEXT}"
    assert last_button.text == EXPECTED_NEXT_BUTTON_TEXT, err_template
