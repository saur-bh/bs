*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot
Resource    ../../../../mobile/keywords/bitfinex/account_keywords.robot

Suite Setup    Open Apps    Bitfinex

*** Test Cases ***
check Price Alerts no display
    Tap On Navigation Tab By Name    Account
    Tap On Account Menu Item    Settings
    Verify Label Not Display    Price Alerts