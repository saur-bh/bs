*** Settings ***
Resource    ../../resources/locators/android/bitfinex/market_watch_locators.robot

*** Keywords ***
Tap Add Ticker
    Click Visible Element    ${btn_add_ticker}
    
Add Ticker
    [Arguments]    ${ticker}
    Tap Add Ticker
    Input Text To Textbox    ${ticker}
    Tap Element By Label    ${ticker}