*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/derivatives_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/derivatives_pair_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/funding_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/funding_pair_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application
*** Variables ***
${expected_chart_loading_time}    10s

*** Test Cases ***
trading_exchange
    Tap On Navigation Tab By Name    Trading
    Search Ticker    BTCUSD
    Access Trading Pair    BTCUSD
    Select Order Type    Limit
    Select Order Form Tab    Exchange
    Create Limit Order    60000    0.01    sell
    Tap Element By Label    Deposit
    Verify Label Displays    Deposit Funds
    Tap On Back Button

trading_margin
    Skip
    Select Order Form Tab    Margin
    Create Limit Order    60000    0.01    sell
    Verify Element Contains Text    Invalid order
    Tap On Back Button
    Clear Ticker Search
    
derivatives
    Skip
    Tap Element By Label    Derivatives
    Search Ticker On Derivatives    BTC-PERP
    Access Trading Pair On Derivatives    BTCF0:USTF0
    Scroll To Panel On Derivative Pair    ORDER BOOK    0.17    DOWN
    Select Order Type On Derivatives    Limit
    Create Limit Order Derivatives    60000    0.01    sell
    Verify Element Contains Text    Invalid order
    Tap On Back Button
    Clear Ticker Search On Derivatives

funding
    Skip
    Tap On Navigation Tab By Name    Funding    
    Search Ticker On Funding    USD
    Access Trading Pair On Funding    USD
    Create Funding    0.3    150    120    offer    confirm=${False}
    Verify Label Displays    Not enough USD balance in funding wallet
    Tap On Back Button
    Clear Ticker Search On Funding