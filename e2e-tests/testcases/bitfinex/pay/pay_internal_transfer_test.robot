*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/fast_pay_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
ln_btc
    Tap On Navigation Tab By Name    Wallets
    Tap On Balances Button    Pay
    Tap Receive Button
    Input Amount To Receive    5
    Tap Generate Invoice
    Get Invoice Code    ln-btc    LN_BTC_INVOICE_CODE
    Tap On Back Button
    Tap Scan Button
    Tap Enter Address Link
    Submit Invoice    ${LN_BTC_INVOICE_CODE}
    Verify Label Not Display    Bitfinex account address
    Verify Label Displays    Send to

tether_on_tron
    Tap On Back Button
    Swipe To Next Payment Transport
    Tap Receive Button
    Input Amount To Receive    5
    Tap Generate Invoice
    Get Invoice Code    usdt_trc20    TETHER_ON_TRON
    Tap On Back Button
    Tap Scan Button
    Tap Enter Address Link
    Submit Invoice    ${TETHER_ON_TRON}    enter_method=paste_icon
    Tap Element By Label    Bitfinex account address
    Verify Label Displays    HOW TO TRANSFER FUNDS INTERNALLY
    Verify Label Displays    Internal transfer within Bitfinex
    Tap Close Icon
    
tether_on_solana
    Tap On Back Button
    Swipe To Next Payment Transport
    Tap Receive Button
    Input Amount To Receive    5
    Tap Generate Invoice
    Get Invoice Code    usdt_sol    TETHER_ON_SOLANA
    Tap On Back Button
    Tap Scan Button
    Tap Enter Address Link
    Submit Invoice    ${TETHER_ON_SOLANA}
    Tap Element By Label    Bitfinex account address
    Verify Label Displays    HOW TO TRANSFER FUNDS INTERNALLY
    Verify Label Displays    Internal transfer within Bitfinex
    Tap Close Icon
    
tether_on_liquid
    Tap On Back Button
    Swipe To Next Payment Transport
    Tap Receive Button
    Input Amount To Receive    5
    Tap Generate Invoice
    Get Invoice Code    usdt_liquid    TETHER_ON_LIQUID
    Tap On Back Button
    Tap Scan Button
    Tap Enter Address Link
    Submit Invoice    ${TETHER_ON_LIQUID}    enter_method=paste_icon
    Tap Element By Label    Bitfinex account address
    Verify Label Displays    HOW TO TRANSFER FUNDS INTERNALLY
    Verify Label Displays    Internal transfer within Bitfinex
    Tap Close Icon