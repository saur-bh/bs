*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/common_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/collateral_haircuts_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/calculator_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application
*** Test Cases ***
limit
    Access Trading Pair    BTCUSD
    Swipe To Panel    ORDER BOOK    0.1    DOWN
    Select Order Type    Limit
    Tap Highest Bid Button
    Tap Max Buy Button
    Verify Max Buy Populated    2s
    Put App In Background    10
    Tap Max Sell Button
    Verify Max Sell Populated    2s
    Select Order Form Tab    Margin
    Tap Lowest Ask Button
    Tap Max Buy Button
    Verify Max Buy Populated    2s
    Put App In Background    10
    Tap Max Sell Button
    Verify Max Sell Populated    2s
    Select Order Form Tab    Exchange

market
    Select Order Type    Market
    Tap Max Buy Button
    Verify Max Buy Populated    2s
    Put App In Background    10
    Tap Max Sell Button
    Verify Max Sell Populated    2s
    Select Order Form Tab    Margin
    Tap Max Buy Button
    Verify Max Buy Populated    2s
    Put App In Background    10
    Tap Max Sell Button
    Verify Max Sell Populated    2s
    Select Order Form Tab    Exchange
    
stop
    Select Order Type    Stop
    Tap Highest Bid Button
    Tap Max Buy Button
    Verify Max Buy Populated    2s
    Put App In Background    10
    Tap Max Sell Button
    Verify Max Sell Populated    2s
    Select Order Form Tab    Margin
    Tap Lowest Ask Button
    Tap Max Buy Button
    Verify Max Buy Populated    2s
    Put App In Background    10
    Tap Max Sell Button
    Verify Max Sell Populated    2s
    Select Order Form Tab    Exchange

stop_limit
    Select Order Type    Stop Limit
    Input Limit Price    
    Tap Lowest Ask Button
    Tap Max Buy Button
    Verify Max Buy Populated    2s
    Put App In Background    10
    Tap Max Sell Button
    Verify Max Sell Populated    2s
    Select Order Form Tab    Margin
    Input Limit Price
    Tap Highest Bid Button
    Verify Max Buy Populated    2s
    Put App In Background    10
    Tap Max Sell Button
    Verify Max Sell Populated    2s
    Select Order Form Tab    Exchange
    
fill_or_kill
    Select Order Type    Fill or Kill
    Tap Highest Bid Button
    Tap Max Buy Button
    Verify Max Buy Populated    2s
    Put App In Background    10
    Tap Max Sell Button
    Verify Max Sell Populated    2s
    Select Order Form Tab    Margin
    Tap Highest Bid Button
    Tap Max Buy Button
    Verify Max Buy Populated    2s
    Put App In Background    10
    Tap Max Sell Button
    Verify Max Sell Populated    2s
    Select Order Form Tab    Exchange

intermediate_or_cancel
    Select Order Type    Immediate or Cancel
    Tap Highest Bid Button
    Tap Max Buy Button
    Verify Max Buy Populated    2s
    Put App In Background    10
    Tap Max Sell Button
    Verify Max Sell Populated    2s
    Select Order Form Tab    Margin
    Tap Lowest Ask Button
    Tap Max Buy Button
    Verify Max Buy Populated    2s
    Put App In Background    10
    Tap Max Sell Button
    Verify Max Sell Populated    2s
    Select Order Form Tab    Exchange