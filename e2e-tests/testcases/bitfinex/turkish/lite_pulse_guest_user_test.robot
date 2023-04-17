*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/bitfinex_pulse_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    BitfinexTurkish
...    AND    Logout Bitfinex On Pincode Screen
Suite Teardown    Close Test Application

*** Test Cases ***
your_feed
    Access Bitfinex Pulse
    Tap Element By Label    Your Feed
    Tap Element By Label    Log In
    Verify Label Displays    Email or Username
    Tap Close Icon
    
your_profile
    Access Bitfinex Pulse
    Tap Element By Label    Your Profile
    Tap Element By Label    Sign Up
    Verify Label Displays    Country of residence
    Tap Close Icon
    
notifications
    Access Bitfinex Pulse
    Tap Element By Label    Notifications
    Tap Element By Label    Log In
    Verify Label Displays    Email or Username
    Tap Close Icon