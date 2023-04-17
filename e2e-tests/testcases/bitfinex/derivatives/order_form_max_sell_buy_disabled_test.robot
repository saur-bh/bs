*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/derivatives_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/derivatives_pair_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application
*** Test Cases ***
derivatives_order_form_tabs
    Tap On Navigation Tab By Name    Derivatives
    Access Trading Pair On Derivatives    BTCF0:USTF0
    Scroll To Panel On Derivative Pair    ORDER BOOK    0.17    DOWN
    Verify Max Buy And Sell Buttons Disappear When Invalid Price    Limit
    Verify Max Buy And Sell Buttons Disappear When Invalid Price    Stop
    Verify Max Buy And Sell Buttons Disappear When Invalid Price    Stop Limit
    Verify Max Buy And Sell Buttons Disappear When Invalid Price    Fill or Kill
    Verify Max Buy And Sell Buttons Disappear When Invalid Price    Immediate or Cancel

*** Keywords ***
Verify Max Buy And Sell Buttons Disappear When Invalid Price
    [Arguments]    ${order_type}
    Select Order Type On Derivatives    ${order_type}
    Verify Max Buy And Max Sell Buttons Disappear Derivatives
    Input Order Price Derivatives    1
    Run Keyword If    "${order_type}"=="Stop Limit"    Input Limit Price Derivatives    1
    Tap Max Buy On Derivatives
    Tap Max Sell On Derivatives
    Input Order Price Derivatives    0
    Run Keyword If    "${order_type}"=="Stop Limit"    Input Limit Price Derivatives    0
    Verify Max Buy And Max Sell Buttons Disappear Derivatives