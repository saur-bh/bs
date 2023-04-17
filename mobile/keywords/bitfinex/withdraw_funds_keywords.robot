*** Settings ***
Resource    ../../resources/locators/android/bitfinex/withdraw_funds_locators.robot
Resource    common_keywords.robot


*** Keywords ***
Withdraw Crypto
    [Arguments]    ${address}    ${amount}    ${from}
    Input Text Into Element    ${txt_address}    ${address}
    Click Visible Element    ${drd_withdraw_from}
    Tap Element By Label    ${from}
    Tap Element By Label    Confirm
    IF    "${amount}"=="MAX"
        Tap Element By Label    Max
    ELSE
        Input Text Into Element    ${txt_amount}    ${amount}
    END
    Click Visible Element    ${chk_term_and_condition}
    Tap Element By Label    Continue
