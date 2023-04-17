*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_BASIC_SIGNUP_AFTER_01JAN2022_KEY}    ${TEST_DATA_BASIC_SIGNUP_AFTER_01JAN2022_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
trading
    Tap On Navigation Tab By Name    Trading
    Search Ticker    BTCUSD
    Access Trading Pair    BTCUSD
    Create Limit Order    10000    0.001    BUY