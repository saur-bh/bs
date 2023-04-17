*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/derivatives_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/derivatives_pair_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Logout And Select Server    Production
Suite Teardown    Close Test Application

*** Test Cases ***
sell
    [Tags]    guest
    Tap On Navigation Tab By Name    Derivatives
    Access Trading Pair On Derivatives    BTCF0:USTF0
    Scroll To Panel On Derivative Pair    ORDER BOOK    0.17    DOWN
    Select Order Type On Derivatives    Limit
    Create Limit Order Derivatives    max_bid    0.001    sell    confirm=${False}
    Tap Element By Label    Log In
    Verify Label Displays    Email or Username
    Tap Close Icon
    
buy
    [Tags]    guest
    Tap On Navigation Tab By Name    Derivatives
    Access Trading Pair On Derivatives    BTCF0:USTF0
    Scroll To Panel On Derivative Pair    ORDER BOOK    0.17    DOWN
    Create Limit Order Derivatives    max_bid    0.001    buy    confirm=${False}
    Tap Element By Label    Sign Up
    Verify Label Displays    Country of residence
    Tap Close Icon