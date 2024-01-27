"""A library for processing Telegram chat messages."""
from robot.api.deco import keyword
from selenium.webdriver.remote.webelement import WebElement, By

ROBOT_LIBRARY_VERSION = '0.1'
ROBOT_AUTO_KEYWORDS = False


@keyword
def verify_settings_response(response_message: WebElement):
    buttons = response_message.find_elements(
        by=By.CSS_SELECTOR,
        value=".InlineButtons .row .Button",
    )
    expected_button_names = ["Finnish", "English", "Russian"]
    for expected_name, button in zip(expected_button_names, buttons):
        err_message = f"Unexpected button text: {expected_name}. Expect: {button.text}."
        assert expected_name == button.text, err_message
