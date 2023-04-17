*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Logout And Select Server    Production    lite_mode=${True}
Suite Teardown    Close Test Application

*** Test Cases ***
buy
    [Tags]    guest
    Access Trading Pair    BTCUSD
    Tap Element By Label    Buy
    Input Text To Textbox    0.001
    Tap Element By Label    Review Buy
    Tap Element By Label    Log In
    Verify Label Displays    Email or Username
    Tap Close Icon
    
sell
    [Tags]    guest
    Access Trading Pair    BTCUSD
    Tap Element By Label    Sell
    Input Text To Textbox    0.001
    Tap Element By Label    Review Sell
    Tap Element By Label    Sign Up
    Verify Label Displays    Country of residence
    Tap Close Icon