*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot
Resource    ../../../../mobile/keywords/bitfinex/term_of_service_keywords.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login With Email    ${TEST_DATA_BASIC_VERIFIED_NOT_ACCEPT_TOS_USERNAME}    ${TEST_DATA_BASIC_VERIFIED_NOT_ACCEPT_TOS_PASSWORD}    ${TEST_DATA_BASIC_VERIFIED_NOT_ACCEPT_TOS_OTP_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
scroll_to_bottom
    Tap TOS Scroll To Bottom Button
    Verify Element Contains Text    Google is a third party beneficiary to these Terms of Service and may enforce these Terms of Service against you.