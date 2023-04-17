*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/account_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/borrow_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/available_balances_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/cryptocurrency_deposit_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/login_keywords.robot
Resource    ../../../../mobile/resources/testdata/staging/bitfinex_data.robot
Resource    ../../../../mobile/keywords/bitfinex/verification_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/position_detail_keywords.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Staging
Suite Teardown    Close Test Application

*** Test Cases ***
borrow_wallet_icon
    Tap On Navigation Tab By Name    Account
    Tap On Account Menu Item    Borrow
    Tap Continue To Borrow Button
    Tap On Wallet Icon
    Verify Available Balances

borrow_fields_validation
    Tap On Back Button
    Input Borrow Amount    174
    Verify Label Displays    Minimum Amount 175.00 USD
    Input Borrow Amount    999999999
    Verify Element Contains Text    Maximum Amount 10.000 BTC
    Verify Label Displays    Not enough funding available
    
borrow_add_funds
    Select Borrow Currency    USD
    Select Collateral Currency    ETH
    Input Borrow Amount    1755
    Tap Add Funds Link
    Verify Cryptocurrency Deposit Screen Displays
    Tap On Back Button
    
borrow_you_have_link
    Input Borrow Amount    175
    Verify You Have Link    ETH

borrow_use_available_fund
    Tap You Can Use Link
    Verify Collateral Amount Textbox Value    1.1

borrow_borrow_amount_populated    
    Select Borrow Currency    USD
    Select Collateral Currency    BTC
    Verify Borrow Amount Textbox Value    175

borrow_period_days_field
    Verify Period Days Value    30
    Input Period Days    1
    Verify Period Days Field Limitation Error
    Input Period Days    121
    Verify Period Days Field Limitation Error
    Input Period Days    2

borrow_how_it_works    
    Tap How It Works
    Close How It Works Popup

borrow_variable_rate    
    Tap Borrow Button
    Verify Label Displays    I have read and agree to the terms.
    Tap Confirm Borrowing On Borrow Confirmation Popup
    Tap Okay On Borrow Completed Popup
    
borrow_fix_rate    
    Scroll To Borrow Dropdown
    Select Borrow Currency    USD
    Tap Fix Rate Checkbox    
    Tap Borrow Button
    Tap Confirm Borrowing On Borrow Confirmation Popup    ${True}
    Tap Okay On Borrow Completed Popup
    Tap On Back Button
    Tap On Navigation Tab By Name    Wallets
    Swipe To Wallets Panel    ORDERS    0.2    DOWN
    Tap Positions Panel Record By Value On Wallets    BTC
    Close With Market Order