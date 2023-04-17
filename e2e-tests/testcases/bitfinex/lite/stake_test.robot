*** Settings ***
Documentation    https://app.asana.com/0/1200376791229614/1202488938514112/f - Lite-Earn tab (Staking)

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/stake_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/cryptocurrency_deposit_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production    lite_mode=${True}
Suite Teardown    Close Test Application

*** Test Cases ***
labels
    Tap On Navigation Tab By Name    Earn
    Verify Element Contains Text    $1
    # Verify Label Displays    Earn weekly staking reward by simply holding specific digital tokens in your wallet.
    
what_is_staking
    Tap Stake Support Faq Button
    Verify Label Displays    WHAT IS STAKING?
    Verify Label Displays    Staking Rewards on Bitfinex
    Tap Close Icon
    
calculate_your_potential_rewards_labels
    Tap Element By Label    Calculate your potential rewards
    Verify Label Displays    Staking supported tokens in your wallet automatically earn weekly rewards.
    Tap Element By Label    * This is the estimated annual staking reward for staked tokens. Actual annualized staking rewards may differ. Learn more
    Verify Label Displays    STAKE DISCLAIMER
    Tap Close Icon
    
calculate_your_potential_rewards
    Tap I Want To Stake Dropdown
    Select I Want To Stake Dropdown    Polkadot (DOT)
    Input Stake Amount    3000000000
    Verify Estimation Rewards In Usd    0.06 DOT (≈0.45 USD)    0.40 DOT (≈3.02 USD)    1.75 DOT (≈13.19 USD)    21.00 DOT (≈158.34 USD)
    Tap Close Icon
    
staking_earnings
    Tap Element By Label    Earn weekly staking reward by simply holding specific digital tokens in your wallet.    
    Verify Label Displays    STAKING EARNINGS
    Verify Label Displays    No staking earnings found
    Tap On Back Button
    Verify Label Displays    * This is the estimated annual staking reward for staked tokens. Actual annualized staking rewards may differ. Learn more    swipe=DOWN

slide_in_menu_deposit
    Tap Stake Button Of Currency    DOT
    Tap Element By Label    Deposit
    Verify Cryptocurrency Deposit Screen Displays
    Tap On Back Button
    
slide_in_menu_eth2
    Tap Stake Button Of Currency    ETH2
    Tap Element By Label    How do I stake Ethereum (ETH2)?
    Verify Label Displays    STAKE SUPPORT
    Verify Label Displays    How do I stake Ethereum (ETH2)?
    Tap Close Icon
    Tap Element By Label    Deposit
    Verify Cryptocurrency Deposit Screen Displays