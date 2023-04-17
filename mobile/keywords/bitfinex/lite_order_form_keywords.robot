*** Settings ***
Resource    ../../resources/locators/android/bitfinex/lite_order_form_locators.robot

*** Keywords ***
Tap Infor Button
    Tap Element By Accessibility Id    lite_order_support

Select Lite Order Type
    [Arguments]    ${order_type}
    Run Keyword If    "${order_type}"=="BUY"    Tap Element By Accessibility Id    order_form_lite_buy
    ...    ELSE    Tap Element By Accessibility Id    order_form_lite_sell

Enter Lite Order Amount
    [Arguments]    ${amount}    ${delay}=${None}
    Run Keyword If    "${amount}"=="25 PERCENT"    Tap Element By Accessibility Id    percentage_25    delay=${delay}
    ...    ELSE IF    "${amount}"=="50 PERCENT"    Tap Element By Accessibility Id    percentage_50    delay=${delay}
    ...    ELSE IF    "${amount}"=="100 PERCENT"    Tap Element By Accessibility Id    percentage_100    delay=${delay}
    ...    ELSE    Input Text To Textbox    ${amount}

Enter Lite Order Price
    [Arguments]    ${price}
    Run Keyword If    "${price}"=="BEST BID"    Tap Element By Accessibility Id    top_bid_btn
    ...    ELSE IF    "${price}"=="BEST ASK"    Tap Element By Accessibility Id    top_ask_btn
    ...    ELSE    Input Text To Textbox    ${price}

Tap Base Quote Swap Button
    Tap Element By Accessibility Id    fastpay_receive_swap_button

Switch Lite Order Type
    [Arguments]    ${order_type}
    Tap Element By Accessibility Id    order_form_type_picker    delay=3s
    Tap Element By Label    ${order_type}    repeat=2    

Tap Review Buy Sell Button
    Tap Element By Accessibility Id    order_form_lite_preview_buy
    
Tap Set Limit Price Button
    Tap Element By Accessibility Id    order_form_lite_preview_buy

Verify Amount Text
    [Arguments]    ${expected_text}
    Verify Element Text    ${txt_amount_order_form}    contains    ${expected_text}