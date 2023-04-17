*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/funding_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/funding_pair_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Logout And Select Server    Production
Suite Teardown    Close Test Application

*** Test Cases ***
bid
    [Tags]    guest
    Tap On Navigation Tab By Name    Funding
    Access Trading Pair On Funding    USD
    Scroll To Panel On Funding Pair    FUNDING BOOK    0.2    DOWN
    Create Funding    0.013784    0.00000001    120    BID    confirm=${False}
    Tap Element By Label    Log In
    Verify Label Displays    Email or Username
    Tap Close Icon
    
offer
    [Tags]    guest
    Tap On Navigation Tab By Name    Funding
    Access Trading Pair On Funding    USD
    Scroll To Panel On Funding Pair    FUNDING BOOK    0.2    DOWN
    Create Funding    0.013784    0.00000001    120    OFFER    confirm=${False}
    Tap Element By Label    Sign Up
    Verify Label Displays    Country of residence
    Tap Close Icon
    
max_amount
    [Tags]    guest
    Tap On Navigation Tab By Name    Funding
    Access Trading Pair On Funding    USD
    Scroll To Panel On Funding Pair    FUNDING BOOK    0.2    DOWN
    Tap Max Offer On Funding
    Tap Element By Label    Sign Up
    Verify Label Displays    Country of residence