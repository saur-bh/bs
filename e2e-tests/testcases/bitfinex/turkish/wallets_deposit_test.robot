*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/deposit_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    BitfinexTurkish
...    AND    Login And Set Up Pin Turkish App    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
payment_card_not_display
    Tap On Navigation Tab By Name    Wallets
    Tap On Balances Button    Deposit
    Tap Payment Type Dropdown
    Verify Label Not Display    Payment Card
    Verify Label Displays    On-ramp Services    
    Verify Label Displays    Bank wire    
    Verify Label Displays    Tether    
    Verify Label Displays    Cryptocurrencies    