*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/swap_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/stake_keywords.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production    lite_mode=${True}
Suite Teardown    Close Test Application

*** Test Cases ***
swap
    # Tap On Navigation Tab By Name    Wallets
    # Tap On Balances Button    Swap
    # Select From Currency    Bitcoin (BTC)
    # Select To Currency    Ethereum (ETH)
    # Tap Element By Label    MAX
    # Verify From Textbox Is Populated    not empty
    # Verify To Textbox Is Populated    not empty
    # Verify Usd Equivalent Populated On From Textbox
    # Verify Rate Displays    BTC    ETH
    # Verify Label Displays    0.5%
    
# max_slippage
    # Tap Value By Field Name    Max Slippage
    # Verify Label Displays    Max Slippage 0.5%
    # Verify Label Displays    Market prices are constantly changing. The Swap tool applies a 0.5% Slippage Tolerance to help manage the impact of market price changes. Slippage Tolerance sets a limit on how much price change may occur before the Swap tool will cancel your order. If the number of tokens you would receive from a Swap is less than the estimated number by 0.5%, the Swap will not occur and your order will be cancelled.    
    # Tap Element By Label    Okay
    
# swap_reverse
    # Tap Swap Reverse Button
    # Verify From Dropdown Value    ETH
    # Verify To Dropdown Value    BTC
    # Verify From Textbox Is Populated    empty
    # Verify To Textbox Is Populated    empty
    
# earn_slide_in_swap
    # Tap On Back Button
    Tap On Navigation Tab By Name    Earn
    Tap Stake Button Of Currency    DOT
    Tap Element By Label    Swap
    Verify From Dropdown Value    USD
    Verify To Dropdown Value    DOT