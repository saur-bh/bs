*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/market_watch_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
market_watch
    Tap On Navigation Tab By Name    Trading
    Tap Market Watch
    Add Ticker    ETH/USD
    Verify Label Displays    ETH/USD
    Add Ticker    ETH/USD
    Verify Label Not Display    ETH/USD
    Tap Market Watch
    Verify Label Displays    Trading