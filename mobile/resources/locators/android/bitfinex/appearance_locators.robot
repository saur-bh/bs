*** Variables ***
${lbl_trading_pair_tab_appearance}    xpath=//android.widget.TextView[@text='TRADING PAIR TAB']
${lbl_derivatives_pair_tab_appearance}    xpath=//android.widget.TextView[@text='DERIVATIVES PAIR TAB']
${lbl_funding_symbol_pair_tab_appearance}    xpath=//android.widget.TextView[@text='FUNDING SYMBOL TAB']
${lbl_wallets_tab_appearance}    xpath=//android.widget.TextView[@text='WALLETS TAB']

# DYNAMIC
${lbl_session_appearance}    xpath=//android.widget.TextView[@text='_DYNAMIC_0']
${rdo_appearance_by_label}    xpath=(//android.widget.TextView[@text="_DYNAMIC_0"]/../../following-sibling::android.view.ViewGroup//android.widget.TextView[@text="_DYNAMIC_1"])[1]/..//android.widget.Switch