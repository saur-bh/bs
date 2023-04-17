*** Settings ***
Resource    ../../resources/locators/android/bitfinex/price_alerts_locators.robot

*** Keywords ***
Create Price Alert
    [Arguments]    ${pair}=${None}    ${pair_name}=${None}    ${currency_filter}=${None}    ${price}=default    ${time}=${None}
    Run Keyword If    '${currency_filter}'!='${None}'    Select Currency Filter Dropdown Item    ${currency_filter}
    Run Keyword If    '${pair}'!='${None}'    Select Pair On Dropdown Item    ${pair}    ${pair_name}
    Run Keyword If    '${price}'!='default'    Input Text Into Element    ${txt_alert_price}    ${price}    clear_text=${True}
    Run Keyword If    '${time}'!='${None}'    Select Do Not Repeat In Dropdown    ${time}
    Click Visible Element    ${btn_place_price_alert}

Select Do Not Repeat In Dropdown
    [Arguments]    ${time}
    Click Visible Element    ${drd_do_not_repeat_in}
    Tap Element By Label    ${time}
    
Select Pair On Dropdown Item
    [Arguments]    ${pair}    ${pair_name}
    Click Visible Element    ${drd_alert_pair}
    Input Text Into Element    ${txt_search_price_dropdown}    ${pair}    clear_text=${True}
    Tap Element By Label    ${pair_name}
    
Select Currency Filter Dropdown Item
    [Arguments]    ${currency}
    Click Visible Element    ${drd_alert_symbol}
    ${symbol_item_element}    Generate Element From Dynamic Locator    ${drd_alert_symbol_item_price_alert}    ${currency}
    Click Visible Element    ${symbol_item_element}
    
Close Price Alert
    [Arguments]    ${pair}
    ${close_element}    Generate Element From Dynamic Locator    ${btn_x_close_price_alert_by_pair}    ${pair}
    Click Visible Element    ${close_element}
    Sleep    2s
    
Verify All Price Alerts Fields Are Disabled
    Verify Element Property    ${drd_alert_pair}    long-clickable    false
    Verify Element Property    ${drd_alert_symbol}    long-clickable    false
    Verify Element Is Disabled    ${txt_alert_price}
    Verify Element Property    ${btn_place_price_alert}    long-clickable    false
    Verify Element Property    ${drd_do_not_repeat_in}    long-clickable    false