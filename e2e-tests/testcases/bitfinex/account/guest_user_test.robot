*** Settings ***
Resource    ../../../../mobile/resources/init.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Logout And Select Server    Production
Suite Teardown    Close Test Application

*** Test Cases ***
price_alert_not_display
    Tap On Navigation Tab By Name    Account
    Tap On Account Menu Item    Settings
    Verify Label Not Display    Price Alerts