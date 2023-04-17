*** Settings ***
Resource    ../../resources/locators/android/bitfinex/swap_locators.robot
Resource    common_keywords.robot
*** Keywords ***
Select From Currency
    [Arguments]    ${currency}
    Click Visible Element    ${drd_from_currency}
    Input Text To Textbox    ${currency}
    Tap Element By Label    ${currency}
    
Select To Currency
    [Arguments]    ${currency}
    Click Visible Element    ${drd_to_currency}
    Input Text To Textbox    ${currency}
    Tap Element By Label    ${currency}

Tap Swap Reverse Button
    Click Visible Element    ${btn_swap_reverse}

Input From Amount
    [Arguments]    ${amount}=MAX
    Run Keyword If    "${amount}"=="MAX"    Tap Element By Label    ${amount}
    ...    ELSE    Input Text Into Element    ${txt_from_amount}    ${amount}

Tap Swap Button
    Click Visible Element    ${btn_swap}

Get To Amount Textbox
    [Arguments]    ${return_variable}
    ${to_value}    Get Element Text    ${txt_to_amount}
    Set Test Variable    ${${return_variable}}    ${to_value}

# ORDER HISTORY
Tap FOK First Row
    Sleep    3s
    Click Visible Element    ${tbl_fok_first_row}
    
Verify From Textbox Is Populated
    [Arguments]    ${verify_type}    ${expected_value}=${None}
    Verify Element Text    ${txt_from_amount}    ${verify_type}    ${expected_value}
    
Verify To Textbox Is Populated
    [Arguments]    ${verify_type}    ${expected_value}=${None}
    Verify Element Text    ${txt_to_amount}    ${verify_type}    ${expected_value}
    
Verify Usd Equivalent Populated On From Textbox
    Verify Element Text    ${lbl_usd_equivalent_on_from}    not empty
    
Verify Rate Displays
    [Arguments]    ${from_currency}    ${to_currency}
    ${rate_text}    Get Element Text By Field    Rate
    Should Contain    ${rate_text}    ${from_currency}
    Should Contain    ${rate_text}    ${to_currency}
    
Verify From Dropdown Value
    [Arguments]    ${expected_value}
    Verify Element Text Should Be    ${drd_from_currency}    ${expected_value}
    
Verify To Dropdown Value
    [Arguments]    ${expected_value}
    Verify Element Text Should Be    ${drd_to_currency}    ${expected_value}