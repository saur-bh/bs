*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/fast_pay_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/tether_deposit_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_BASIC_VERIFIED_API_KEY}    ${TEST_DATA_BASIC_VERIFIED_API_SECRET}    Production    lite_mode=${True}
Suite Teardown    Close Test Application

*** Test Cases ***
ln_btc
    Tap On Navigation Tab By Name    Pay
    Tap Receive Button
    Input Amount To Receive    1
    Tap Generate Invoice
    Get Invoice Code    ln-btc    LN_LN_BTC_INVOICE_CODE
    Tap On Back Button
    Tap Scan Button
    Tap Enter Address Link
    Submit Invoice    ${LN_LN_BTC_INVOICE_CODE}    submit=${False}
    Verify Element Contains Text    $1.03 minimum balance is needed to complete this payment. Your current balance is $0. Please make a deposit in wallet to proceed.
    Tap Element Contains Label    Go to deposit screen
    Verify Label Displays    Generate Invoice