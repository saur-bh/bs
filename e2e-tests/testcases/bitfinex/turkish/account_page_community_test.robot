*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot
Resource    ../../../../mobile/keywords/bitfinex/account_keywords.robot

Suite Setup    Run Keywords    Open Apps    BitfinexTurkish
...    AND    Login With Account Turkish App    ${TEST_DATA_BASIC_VERIFIED_USERNAME}    ${TEST_DATA_BASIC_VERIFIED_PASSWORD}    ${TEST_DATA_BASIC_VERIFIED_OTP_SECRET}
Suite Teardown    Close Test Application

*** Test Cases ***
others_community_telegram
    Tap On Navigation Tab By Name    Account
    Tap On Account Menu Item    Others
    Tap On Account Menu Item    Community
    Tap On Account Menu Item    Telegram
    Verify Page Opens In Browser    The official Bitfinex telegram channel.
    Tap Device Back Button

others_community_twitter    
    Tap On Account Menu Item    Twitter
    Verify Page Opens In Browser    Bitfinex is the world's leading digital asset trading platform.
    Tap Device Back Button

others_community_reddit
    Tap On Account Menu Item    Reddit
    Verify Page Opens In Browser    Community Details
    Tap Device Back Button
    
others_community_medium_removed
    Verify Label Not Display    Medium