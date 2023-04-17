*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/deposit_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/tether_deposit_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
deposit_min_amount
    Tap On Navigation Tab By Name    Wallets
    Tap On Balances Button    Deposit
    Select Payment Type On Deposit    Bank wire
    Verify Min Amount By Currency    US Dollar (USD)    9999    Amount must be greater than 10000.
    Verify Min Amount By Currency    Pound Sterling (GBP)    9999    Amount must be greater than 10000.
    Verify Min Amount By Currency    Euro (EUR)    9999    Amount must be greater than 10000.
    Verify Min Amount By Currency    Japanese Yen (JPY)    999999    Amount must be greater than 1000000.
    Verify Min Amount By Currency    CNH (CNH)    74999    Amount must be greater than 75000.
    Verify Min Amount By Currency    Turkish Lira (TRY)    99    Amount must be greater than or equal to 100.

deposit_max_amount
    Verify Max Amount By Currency    US Dollar (USD)    999999999    Amount must be less than or equal to 900,000,000.
    Verify Max Amount By Currency    Pound Sterling (GBP)    999999999    Amount must be less than or equal to 776,074,500.
    Verify Max Amount By Currency    Euro (EUR)    999999999    Amount must be less than or equal to 903,541,500.
    Verify Max Amount By Currency    Japanese Yen (JPY)    999999999999    Amount must be less than or equal to 133,152,754,500.
    Verify Max Amount By Currency    CNH (CNH)    9999999999    Amount must be less than or equal to 6,539,583,600.
    Verify Max Amount By Currency    Turkish Lira (TRY)    99999999999    Amount must be less than or equal to 16,732,529,099.

deposit_usd
    Submit Bank Wire Request    US Dollar (USD)    10000
    Verify Label Displays    Deposit Created
    Verify Label Displays    You have successfully created a wire deposit for 10,000.00 USD. We’ve emailed you instructions on what to do next.
    Tap Element By Label    Done

cancel_bank_wire_deposit
    Tap On Balances Button    Deposit
    Tap Element By Label    Created
    Tap Element By Label    Cancel
    Verify Label Displays    Pending cancellation

basic_verified
    Close Test Application
    Open Apps    Bitfinex
    Login And Set Up Pin    ${TEST_DATA_BASIC_SIGNUP_AFTER_01JAN2022_KEY}    ${TEST_DATA_BASIC_SIGNUP_AFTER_01JAN2022_SECRET}    Production
    Tap On Navigation Tab By Name    Wallets
    Tap On Balances Button    Deposit
    Select Payment Type On Deposit    Bank wire
    Verify Label Displays    I agree that I have read and understand the bank wire deposit terms & conditions and I agree not to make this information public.
    Tap Currency Dropdown
    Verify Label Displays    Choose Currency
    
*** Keywords ***
Verify Min Amount By Currency
    [Arguments]    ${currency}    ${amount}    ${label}
    Select Curency Dropdown Item    ${currency}
    Run Keyword If    "${currency}"=="Euro (EUR)"    Tap Element By Label    Manual Instructions
    Input Bank Wire Deposit Amount    ${amount}
    Verify Label Displays    ${label}
    
Verify Max Amount By Currency
    [Arguments]    ${currency}    ${amount}    ${label}
    Select Curency Dropdown Item    ${currency}
    Run Keyword If    "${currency}"=="Euro (EUR)"    Check Max Amount by Euro    ${amount}    ${label}
    Input Bank Wire Deposit Amount    ${amount}
    Verify Label Displays    ${label}
    