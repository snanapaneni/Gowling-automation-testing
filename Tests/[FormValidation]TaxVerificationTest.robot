*** Settings ***
Documentation    Suite description

Library  Selenium2Library
Resource    ../Resources/Keywords/BillingInformationKeywords.robot
Resource  ../Resources/Keywords/AccountDetailsKeywords.robot
Resource  ../Resources/Keywords/TaxVerificationKeywords.robot
Library 	Screenshot
Library   robot.libraries.String

Suite Setup     open browser  http://startech:St@rT3ch!@startech-qa.ecentricarts.com/ca/register-en?returnurl=/Register  chrome
Suite Teardown  Close browser

*** Test Cases ***

[Canada] Verify Reseller navigation to registration page

    Change customer type    Reseller
    Click Continue button
    TaxVerificationKeywords.page should contain element Account details Text

[Canada] Reseller- Verify and Validate Form validation Error Message - ALL

    Click Continue button
    TaxVerification - Verify form validation - ALL
    TaxVerification - Verify form validation - checkbox required
    TaxVerification - Verify form validation - Tax ID required


[Canada] Reseller - Click checkbox and Verify error message for checkbox shouldn't be appear , rest should be

   click element  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_TaxAcknowledgement_mainControl']/div/label
   Click Continue button
   verify checkbox error message should not appeared
   AccountDetailsKeywords.Verify global error message should get vanish by enter correct value    1
   TaxVerification - Verify form validation - Tax ID required


[Canada] Reseller - Click checkbox, enter tax id and Verify error message for checkbox shouldn't be appear , rest should be

   Enter TaxID
   Click Continue button
   verify checkbox error message should not appeared
   verify taxid error message should not appeared
   AccountDetailsKeywords.page should contain element Account details Text
   page should contain element Account type


[US] Verify Reseller navigation to registration page
    close browser
    open browser  http://startech:St@rT3ch!@startech-qa.ecentricarts.com/ca/register-en?returnurl=/Register  chrome
    change country  US
    Change customer type    Reseller
    Click Continue button
    TaxVerificationKeywords.page should contain element Account details Text

[US] Reseller- Verify and Validate Form validation Error Message - ALL

    Click Continue button
    TaxVerification - Verify form validation - ALL
    TaxVerification - Verify form validation - checkbox required
    TaxVerification - Verify form validation - Tax ID required


[US] Reseller - Click checkbox and Verify error message for checkbox shouldn't be appear , rest should be

   click element  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_TaxAcknowledgement_mainControl']/div/label
   Click Continue button
   verify checkbox error message should not appeared
   AccountDetailsKeywords.Verify global error message should get vanish by enter correct value    1
   TaxVerification - Verify form validation - Tax ID required


[US] Reseller - Click checkbox, enter tax id and Verify error message for checkbox shouldn't be appear , rest should be

   Enter TaxID
   Click Continue button
   verify checkbox error message should not appeared
   verify taxid error message should not appeared
    AccountDetailsKeywords.page should contain element Account details Text
    page should contain element Account type



[Europe] Verify Reseller navigation to registration page
    close browser
    open browser  http://startech:St@rT3ch!@startech-qa.ecentricarts.com/ca/register-en?returnurl=/Register  chrome
    change country  Europe
    Change customer type    Reseller
    Click Continue button
    TaxVerificationKeywords.page should contain element Account details Text

[Europe] Reseller- Verify and Validate Form validation Error Message - ALL

    Click Continue button
    TaxVerification - Verify form validation - ALL
    TaxVerification - Verify form validation - checkbox required
    TaxVerification - Verify form validation - Tax ID required


[Europe] Reseller - Click checkbox and Verify error message for checkbox shouldn't be appear , rest should be

   click element  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_TaxAcknowledgement_mainControl']/div/label
   Click Continue button
   verify checkbox error message should not appeared
   AccountDetailsKeywords.Verify global error message should get vanish by enter correct value    1
   TaxVerification - Verify form validation - Tax ID required


[Europe] Reseller - Click checkbox, enter tax id and Verify error message for checkbox shouldn't be appear , rest should be

   Enter TaxID
   Click Continue button
   verify checkbox error message should not appeared
   verify taxid error message should not appeared
   AccountDetailsKeywords.page should contain element Account details Text
    page should contain element Account type