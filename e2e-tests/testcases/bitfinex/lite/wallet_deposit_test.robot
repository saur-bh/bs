*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/deposit_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/payment_card_deposit_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/simplex_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/mercuryo_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/ownr_wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/tether_deposit_keywords.robot

Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production    lite_mode=${True}
Suite Teardown    Close Test Application

*** Test Cases ***
payment_card
    Tap On Navigation Tab By Name    Wallets
    Tap On Balances Button    Deposit
    Select Payment Type On Deposit    Payment Card
    Select Payment Method On Payment Card Deposit   Simplex
    Verify To Wallet Dropdown Disappear
    
mercuryo
    Tap On Back Button
    Select Payment Method On Payment Card Deposit   Mercuryo
    Verify To Wallet Dropdown Disappear

ownr
    Tap On Back Button
    Select Payment Method On Payment Card Deposit    Ownr Wallet
    Verify To Wallet Dropdown Disappear

cryptocurrencies
    Tap On Back Button
    Select Payment Type On Deposit    Cryptocurrencies
    Verify To Wallet Dropdown Disappears On Deposit
    
tether
    Select Payment Type On Deposit    Tether
    Verify To Wallet Dropdown Disappears On Deposit
    
tether_gold
    Close Test Application
    Open Apps    Bitfinex
    Login And Set Up Pin    ${TEST_DATA_BASIC_VERIFIED_API_KEY}    ${TEST_DATA_BASIC_VERIFIED_API_SECRET}    Production    lite_mode=${True}
    Tap On Navigation Tab By Name    Wallets
    Tap On Balances Button    Deposit
    Select Payment Type On Deposit    Tether
    Select Choose Tether Dropdown Item    XAU ₮ (XAUt)
    Select Choose Transport Dropdown Item    Tether(XAU) on Ethereum
    Tap Element By Label    Next
    Verify Tether Deposit Screen Displays