*** Settings ***
Resource    ../../resources/locators/android/bitfinex/fast_pay_swapix_locators.robot

*** Keywords ***
Input PIX Key
    [Arguments]    ${pix_key}
    Input Text Into Element    ${txt_enter_pix}    ${pix_key}
    Verify Loading Progress Icon Displays
    
Input Amount
    [Arguments]    ${amount}
    Input Text Into Element    ${txt_amount}    ${amount}
    
Tap Pay Button
    Click Visible Element    ${btn_pay}    delay=3s