*** Variables ***
${txt_address}                  accessibility_id=withdrawal_address_input
${txt_amount}                   accessibility_id=withdrawal_crypto_amount
${drd_withdraw_from}            xpath=//android.widget.TextView[@text="Withdraw From"]/following-sibling::android.view.ViewGroup/android.widget.TextView[1]
${chk_term_and_condition}       xpath=//android.view.ViewGroup[@content-desc="withdraw_btn"]/android.view.ViewGroup[1]
