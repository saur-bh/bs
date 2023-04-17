*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/deposit_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/payment_card_deposit_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/simplex_keywords.robot
Resource    ../../../../mobile/resources/testdata/staging/bitfinex_data.robot
Resource    ../../../../mobile/keywords/bitfinex/appearance_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/buy_crypto_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/lite_order_form_keywords.robot
Suite Setup   Run Keywords   Open Apps    Bitfinex 
...    AND    Login And Set Up Pin    ${TEST_DATA_BASIC_VERIFIED_API_KEY}    ${TEST_DATA_BASIC_VERIFIED_API_SECRET}    Staging  dismiss_verification=${True}
Suite Teardown    Close Test Application

*** Test Cases ***
ownr_wallet_unavailable_basic_verfied
    Tap On Navigation Tab By Name    Wallets
    Tap On Balances Button    Buy Crypto
    Tap Unavailable icon 
    Verify Required KYC Screen shows 
    Logout Bitfinex
search_wallet_USDt
    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}   ${TEST_DATA_FULL_VERIFIED_API_SECRET}  Staging
    Tap On Navigation Tab By Name    Wallets
    Tap On Balances Button    Buy Crypto
    Tap Element Contains Label  Mercuryo
    Select Asset To Buy  USDt
    Tap Element Contains Label   USDt (ETH)
    Verify Amount Placeholder     Max

    

   
      

   