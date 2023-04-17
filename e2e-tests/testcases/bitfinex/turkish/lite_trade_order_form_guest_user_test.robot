*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    BitfinexTurkish
...    AND    Logout Bitfinex On Pincode Screen
Suite Teardown    Close Test Application

*** Test Cases ***
buy
    Access Trading Pair    BTCUSD
    Verify Label Displays    Preview Buy    swipe=DOWN
    Create Limit Order In Lite Mode    max_bid    0.001    BUY    confirm=${False}
    Tap Element By Label    Log In
    Verify Label Displays    Email or Username
    Tap Close Icon
    
sell
    Access Trading Pair    BTCUSD
    Verify Label Displays    Preview Buy    swipe=DOWN
    Create Limit Order In Lite Mode    max_bid    0.001    SELL    confirm=${False}
    Tap Element By Label    Sign Up
    Verify Label Displays    Country of residence
    Tap Close Icon