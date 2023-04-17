*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Logout And Select Server    Production
Suite Teardown    Close Test Application

*** Test Cases ***
exchange
    [Tags]    guest
    Access Trading Pair    BTCUSD
    Swipe To Panel    ORDER BOOK    0.1    DOWN
    Select Order Type    Limit
    Create Limit Order    max_bid    0.001    buy    confirm=${False}
    Tap Element By Label    Log In
    Verify Label Displays    Email or Username
    Tap Close Icon
    
margin
    [Tags]    guest
    Access Trading Pair    BTCUSD
    Swipe To Panel    ORDER BOOK    0.1    DOWN
    Select Order Type    Limit
    Select Order Form Tab    Margin
    Input Order Price    max_bid
    Input Order Amount    max_buy
    Tap Element By Label    Sign Up
    Verify Label Displays    Country of residence
    Tap Close Icon