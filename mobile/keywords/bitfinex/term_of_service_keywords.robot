*** Settings ***
Resource    ../../resources/locators/android/bitfinex/term_of_service_locators.robot

*** Keywords ***
Tap TOS Scroll To Bottom Button
    Click Visible Element    ${btn_scroll_to_bottom}    delay=5s