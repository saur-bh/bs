*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot
Resource    ../../../../mobile/keywords/bitfinex/account_keywords.robot

Suite Setup    Run Keywords    Open Apps    BitfinexTurkish
...    AND    Logout Bitfinex On Pincode Screen
Suite Teardown    Close Test Application

*** Test Cases ***
affiliate
    Tap On Navigation Tab By Name    Account
    Tap On Account Menu Item    Affiliate
    Tap Element By Label    Log In
    Verify Label Displays    Email or Username
    Tap Close Icon
    
verification
    Tap On Navigation Tab By Name    Account
    Tap On Account Menu Item    Verification
    Tap Element By Label    Sign Up
    Verify Label Displays    Country of residence
    Tap Close Icon
    
reports
    Tap On Navigation Tab By Name    Account
    Tap On Account Menu Item    Reports
    Tap Element By Label    Log In
    Verify Label Displays    Email or Username
    Tap Close Icon