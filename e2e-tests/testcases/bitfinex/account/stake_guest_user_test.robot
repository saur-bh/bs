*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/stake_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/cryptocurrency_deposit_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Logout And Select Server    Production
Suite Teardown    Close Test Application

*** Test Cases ***
stake
    [Tags]    guest
    Tap On Navigation Tab By Name    Account
    Tap On Account Menu Item    Stake
    Tap Stake Button Of Currency    DOT
    Tap Element By Label    Sign Up
    Verify Label Displays    Country of residence
    Tap Close Icon