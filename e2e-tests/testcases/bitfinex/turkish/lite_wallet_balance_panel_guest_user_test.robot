*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    BitfinexTurkish
...    AND    Logout Bitfinex On Pincode Screen
Suite Teardown    Close Test Application

*** Test Cases ***
deposit
    Tap On Navigation Tab By Name    Wallets
    Tap On Balances Button    Deposit
    Tap Element By Label    Log In
    Verify Label Displays    Email or Username
    Tap Close Icon
    
withdraw
    Tap On Navigation Tab By Name    Wallets
    Tap On Balances Button    Withdraw
    Tap Element By Label    Sign Up
    Verify Label Displays    Country of residence
    Tap Close Icon
    
conversion
    Tap On Navigation Tab By Name    Wallets
    Tap On Balances Button    Conversion
    Tap Element By Label    Log In
    Verify Label Displays    Email or Username
    Tap Close Icon
    
swap
    Tap On Navigation Tab By Name    Wallets
    Tap On Balances Button    Swap
    Tap Element By Label    Sign Up
    Verify Label Displays    Country of residence
    Tap Close Icon
    
configure
    Tap On Navigation Tab By Name    Wallets
    Tap Configure Balance
    Tap Element By Label    Log In
    Verify Label Displays    Email or Username
    Tap Close Icon