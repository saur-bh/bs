*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot

Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production    lite_mode=${True}
Suite Teardown    Close Test Application


*** Test Cases ***
limit
    Tap On Navigation Tab By Name    Trading
    Access Trading Pair    BTCUSD
    Swipe To Panel    ORDERS    0.1    DOWN
    Create Limit Order In Lite Mode    15000    0.00000001    BUY    confirm=${False}
    Verify Element Contains Text    Please confirm the following order: Exchange Limit Buy for 0.00000001 BTC at
    Tap Element By Label    Cancel