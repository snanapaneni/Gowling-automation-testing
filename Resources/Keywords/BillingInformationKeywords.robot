*** Settings ***
Documentation    Suite description
Library  Selenium2Library
Resource  ../Xpaths/AccountDetailsXpath.robot
Library	Screenshot
Library   robot.libraries.String
Library  Collections

*** Variables ***

${billingInformationText}   Billing Information
${submitFormError}      Sorry, we could not submit the form. Please review the following fields:
${companyNameRequireError}    Company name is required
${addressRequireError}     Address is required
${postalCodeRequireError}   Zip/Postal Code is required
${termsConditionRequireError}    Please accept the terms and conditions
${cityRequireError}     City is required
${phoneRequireError}    Phone is required
${billingHeaderText}    Billing Information
${websiteRequireError}     Website is required

${CanadaProvinceList1}  Ontario
${CanadaProvinceList2}  Alberta



*** Keywords ***


BillingInformation - Verify form validation - ALL

    page should contain element     ${errorFormPanelXpath}     20s
    ${actualHeaderText}=    get text  ${errorFormPanelHeaderTextXpath}
    should be equal as strings   ${actualHeaderText}    ${submitFormError}



BillingInformatio - Verify form validation - Address Require

    wait until element is visible  //a[@href='#p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_Address_mainControl']      30s
    ${globalValue}=    get text  //a[@href='#p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_Address_mainControl']
   ${LocalValue}=    get text    //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_Address-error']
   should be equal as strings   ${globalValue}  ${addressRequireError}
    should be equal as strings   ${LocalValue}  ${addressRequireError}${addressRequireError}


BillingInformatio - Verify form validation - city Require

    wait until element is visible  //*[@href='#p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_City_mainControl']      30s
    ${globalValue}=    get text    //*[@href='#p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_City_mainControl']
   ${LocalValue}=    get text    //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_City-error']
   should be equal as strings   ${globalValue}  ${cityRequireError}
    should be equal as strings   ${LocalValue}  ${cityRequireError}${cityRequireError}

BillingInformatio - Verify form validation - postalCode Require

    wait until element is visible  //*[@href='#p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_PostalCode_mainControl']      30s
    ${globalValue}=    get text    //*[@href='#p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_PostalCode_mainControl']
   ${LocalValue}=    get text    //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_PostalCode-error']
   should be equal as strings   ${globalValue}  ${postalCodeRequireError}
    should be equal as strings   ${LocalValue}  ${postalCodeRequireError}${postalCodeRequireError}

BillingInformatio - Verify form validation - phone Require

    wait until element is visible  //*[@href='#p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_Phone_mainControl']      30s
    ${globalValue}=    get text    //*[@href='#p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_Phone_mainControl']
   ${LocalValue}=    get text    //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_Phone-error']
   should be equal as strings   ${globalValue}  ${phoneRequireError}
    should be equal as strings   ${LocalValue}  ${phoneRequireError}${phoneRequireError}



BillingInformatio - Verify form validation - terms&Condition Require

    wait until element is visible  //*[@href='#p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_AcceptTerms_mainControl']      30s
    ${globalValue}=    get text    //*[@href='#p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_AcceptTerms_mainControl']
   ${LocalValue}=    get text    //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_AcceptTerms_mainControl-error']
   should be equal as strings   ${globalValue}  ${termsConditionRequireError}
    should be equal as strings   ${LocalValue}  ${termsConditionRequireError}${termsConditionRequireError}


Enter - province optional

    wait until element is visible  ${mainControlConfirmPasswordErrorXpath}      30s
    @{actualProvinceList}=    Get From List   //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_Country_ddlStates']
    log to console  ${actualProvinceList}
    ${expectedProvinceList} =	Create List 	${CanadaProvinceList1}	    ${CanadaProvinceList2}
    Lists Should Be Equal   ${expectedProvinceList}     ${actualProvinceList}

Enter - fax optional

    wait until element is visible  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_Country_ddlStates']      30s
    input text  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_Fax_mainControl']  9876543212

Enter - Address require     [Arguments]     ${dataText}=Toronto

    wait until element is visible  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_Address_mainControl']      30s
    input text  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_Address_mainControl']  ${dataText}

Enter - AddressLine2 optional       [Arguments]     ${dataText}=Toronto

    wait until element is visible  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_Address2_mainControl']      30s
    input text  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_Address2_mainControl']  ${dataText}

Enter - city require   [Arguments]     ${dataText}=Toronto

    wait until element is visible  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_City_mainControl']      30s
    input text  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_City_mainControl']  ${dataText}

Enter - postal require  [Arguments]     ${dataText}=Toronto

    wait until element is visible  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_PostalCode_mainControl']      30s
    input text   //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_PostalCode_mainControl']  ${dataText}


Enter - phone number require  [Arguments]     ${dataText}=6541239843

    wait until element is visible  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_Phone_mainControl']      30s
    input text  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_Phone_mainControl']  ${dataText}


Click Terms & Conditions

    wait until element is visible  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_AcceptTerms_mainControl']/div/label      30s
    click element  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_AcceptTerms_mainControl']/div/label


















Verify address error message should not appeared

    wait until element is visible  ${continueButtonXpath}      30s

    page should not contain element  ${firstNameTextBoxErrorFieldXpath}

Verify address2 error message should not appeared

    wait until element is visible  ${continueButtonXpath}      30s
    page should not contain element  ${lastNameTextBoxErrorFieldXpath}

Verify city error message should not appeared

    wait until element is visible  ${continueButtonXpath}      30s
    page should not contain element  ${emailTextBoxErrorFieldXpath}

Verify postalCode error message should not appeared

    wait until element is visible  ${continueButtonXpath}      30s
    page should not contain element  ${passwordTextBoxErrorFieldXpath}

Verify phone error message should not appeared

    wait until element is visible  ${continueButtonXpath}      30s
    page should not contain element  ${confirmPasswordTextBoxErrorFieldXpath}



Verify global error message should get vanish by enter correct value    [Arguments]  ${ListCount}

    xpath should match x times   ${errorMsgGlobalListXpath}     ${ListCount}


page should contain element billing details Text

    ${getTitle}=    get text  ${accountPageHeaderTitleXpath}
    should be equal as strings  ${getTitle}     ${billingHeaderText}