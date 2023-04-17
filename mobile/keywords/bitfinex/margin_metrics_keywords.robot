*** Settings ***
Resource    ../../resources/locators/android/bitfinex/margin_metrics_locators.robot
Resource    common_keywords.robot

*** Keywords ***
Config Margin Metrics
    [Arguments]    ${granularity}
    Run Keyword If    "${granularity}"=="1 MINUTE"    Click Visible Element    ${rdo_granilarity_1_minute}
    ...    ELSE    Click Visible Element    ${rdo_granilarity_30_minute}
    Click Visible Element    ${btn_apply}