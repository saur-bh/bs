*** Settings ***
Resource    ../../resources/locators/android/bitfinex/buy_crypto_locator.robot
Resource    common_keywords.robot

*** Variables ***

*** Keywords ***
Select Asset To Buy 
    [Arguments]    ${asset_name}
    Click Visible Element    ${item_bitcoin}
    Input Text Into Element  ${txt_item_search}  ${asset_name}   clear_text=${True}
Verify Amount Placeholder
    [Arguments]    ${expected_text}
    Verify Element Text    ${txt_amount}     contains    ${expected_text}

