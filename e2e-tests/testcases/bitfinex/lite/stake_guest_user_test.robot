*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/stake_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Logout And Select Server    Production    lite_mode=${True}
Suite Teardown    Close Test Application

*** Test Cases ***
stake
    [Tags]    guest
    Tap On Navigation Tab By Name    Earn
    Tap Stake Button Of Currency    DOT
    Tap Element By Label    Log In
    Verify Label Displays    Email or Username
    Tap Close Icon