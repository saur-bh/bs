*** Variables ***
#Buy Crypto Screen
${lbl_simplex_payment_card_deposit}    accessibility_id=payment_deposit_simplex_radio
${lbl_mercuryo_payment_card_deposit}    accessibility_id=payment_deposit_mercuryo_radio
${lbl_ownr_wallet_payment_card_deposit}    accessibility_id=payment_deposit_ownr_radio

#Buy via Mercuryo
${item_bitcoin}    xpath=//android.widget.TextView[@text="Bitcoin"]
${txt_item_search}    xpath=//android.widget.EditText[@text="Search"]
${txt_amount}    accessibility_id=withdrawal_crypto_amount