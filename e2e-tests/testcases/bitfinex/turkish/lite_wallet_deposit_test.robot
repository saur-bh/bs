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

Suite Setup    Run Keywords    Open Apps    BitfinexTurkish
...    AND    Login With Account Turkish App    ${TEST_DATA_BASIC_VERIFIED_USERNAME}    ${TEST_DATA_BASIC_VERIFIED_PASSWORD}    ${TEST_DATA_BASIC_VERIFIED_OTP_SECRET}    lite_mode=${True}
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
    Tap Close Icon   

cryptocurrencies
    Select Payment Type On Deposit    Cryptocurrencies
    Verify To Wallet Dropdown Disappears On Deposit
    
tether
    Select Payment Type On Deposit    Tether
    Verify To Wallet Dropdown Disappears On Deposit
    
tether_gold
    Select Choose Tether Dropdown Item    XAU ₮ (XAUt)
    Select Choose Transport Dropdown Item    Tether(XAU) on Ethereum
    Tap Element By Label    Next
    Verify Tether Deposit Screen Displays