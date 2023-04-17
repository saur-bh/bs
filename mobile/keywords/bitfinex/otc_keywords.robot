*** Settings ***
Resource    ../../resources/locators/android/bitfinex/otc_locators.robot

*** Keywords ***
Set OTC Nickname
    [Arguments]    ${nickname}
    Input Text To Textbox    ${nickname}
    Tap Element By Label    Save