*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/funding_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/funding_pair_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_PAPER_TRADING_API_KEY}    ${TEST_DATA_PAPER_TRADING_API_SECRET}    Production
Suite Teardown    Close Test Application
*** Test Cases ***
cancel_specific_ticker
    Tap On Navigation Tab By Name    Funding
    Access Trading Pair On Funding    TESTUSD
    Scroll To Panel On Funding Pair    FUNDING BOOK    0.2    DOWN
    Create Funding    0.1    150    120    offer
    Scroll To Panel On Funding Pair    PROVIDED    0.2    DOWN
    Tap Element By Label    Cancel All
    Verify Label Displays    Are you sure to cancel all of your TESTUSD active bids and offers?
    Tap Element By Label    Submit
    Verify Label Not Display    Cancel All