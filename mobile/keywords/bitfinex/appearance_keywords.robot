*** Settings ***
Resource    ../../resources/locators/android/bitfinex/appearance_locators.robot

*** Keywords ***
Tap Appearance Switch By Label
    [Arguments]    ${tab}    ${label}
    ${switch_radio}    Generate Element From Dynamic Locator    ${rdo_appearance_by_label}    ${tab}    ${label}
    Click Visible Element    ${switch_radio}    swipe=DOWN

Verify Apperance Screen Displays
    Wait Element Is Visible    ${lbl_trading_pair_tab_appearance}
    Wait Element Is Visible    ${lbl_derivatives_pair_tab_appearance}
    Swipe Down To Element    ${lbl_funding_symbol_pair_tab_appearance}
    Wait Element Is Visible    ${lbl_funding_symbol_pair_tab_appearance}
    Swipe Down To Element    ${lbl_wallets_tab_appearance}
    Wait Element Is Visible    ${lbl_wallets_tab_appearance}
    ${wallets_tab_element}    Generate Element From Dynamic Locator    ${lbl_session_appearance}    WALLETS TAB
    Swipe Down To Element    ${wallets_tab_element}
    Wait Element Is Visible    ${wallets_tab_element}