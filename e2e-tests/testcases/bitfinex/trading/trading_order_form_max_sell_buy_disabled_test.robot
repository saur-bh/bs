*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application
*** Test Cases ***
max_buy_sell_disabled
    Search Ticker    DOTUSD
    Access Trading Pair    DOTUSD
    Swipe To Panel    ORDER BOOK    0.1    DOWN
    Verify Max Buy And Sell Buttons Disappear When Invalid Price    Limit
    Verify Max Buy And Sell Buttons Disappear When Invalid Price    Stop
    Verify Max Buy And Sell Buttons Disappear When Invalid Price    Stop Limit
    Verify Max Buy And Sell Buttons Disappear When Invalid Price    Fill or Kill
    Verify Max Buy And Sell Buttons Disappear When Invalid Price    Immediate or Cancel

*** Keywords ***
Verify Max Buy And Sell Buttons Disappear When Invalid Price
    [Arguments]    ${order_type}
    Select Order Type    ${order_type}
    Verify Max Buy And Max Sell Buttons Disappear
    Input Order Price    1
    Run Keyword If    "${order_type}"=="Stop Limit"    Input Limit Price    1
    Tap Max Buy Button
    Tap Max Sell Button
    Input Order Price    0
    Run Keyword If    "${order_type}"=="Stop Limit"    Input Limit Price    0
    Verify Max Buy And Max Sell Buttons Disappear
    Select Order Form Tab    Margin
    Input Order Price    1
    Run Keyword If    "${order_type}"=="Stop Limit"    Input Limit Price    1
    Tap Max Buy Button
    Tap Max Sell Button
    Input Order Price    -1
    Run Keyword If    "${order_type}"=="Stop Limit"    Input Limit Price    -1
    Verify Max Buy And Max Sell Buttons Disappear
    Select Order Form Tab    Exchange