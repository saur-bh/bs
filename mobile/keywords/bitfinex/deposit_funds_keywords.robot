*** Settings ***
Resource    ../../resources/locators/android/bitfinex/deposit_funds_locators.robot
Resource    common_keywords.robot

*** Keywords ***
Clear Search Text Box
    Click Visible Element    ${btn_x_clear_search}

# LN-BTC Deposit
Input LN-BTC Amount On LN-BTC Deposit
    [Arguments]    ${amount}
    Input Text Into Element    ${txt_lnbtc_textbox}    ${amount}    clear_text=${True}

Input USD Amount On LN-BTC Deposit
    [Arguments]    ${amount}
    Input Text Into Element    ${txt_usd_textbox}    ${amount}    clear_text=${True}