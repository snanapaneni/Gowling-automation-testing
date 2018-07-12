*** Settings ***
Documentation    Suite description
Library  Selenium2Library
Resource  ../Xpaths/AccountDetailsXpath.robot
Library	Screenshot
Library   robot.libraries.String
Library  Collections

*** Variables ***
${TaxBillingText}   Tax Verification
${submitFormError}  Sorry, we could not submit the form. Please review the following fields:
${checkboxRequireError}     Checkbox must be checked
${taxIDRequireError}        Please enter a valid Tax ID

*** Keywords ***
page should contain element Account details Text

    ${getTitle}=    get text  ${accountPageHeaderTitleXpath}
    should be equal as strings  ${getTitle}     ${TaxBillingText}

TaxVerification - Verify form validation - ALL

    page should contain element     ${errorFormPanelXpath}     20s
    ${actualHeaderText}=    get text  ${errorFormPanelHeaderTextXpath}
    should be equal as strings   ${actualHeaderText}    ${submitFormError}


TaxVerification - Verify form validation - checkbox required

    wait until element is visible  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_TaxAcknowledgement_mainControl-error']      30s
    ${globalValue}=    get text  //a[@href='#p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_TaxAcknowledgement_mainControl']
   ${LocalValue}=    get text    //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_TaxAcknowledgement_mainControl-error']
   should be equal as strings   ${globalValue}  ${checkboxRequireError}
    should be equal as strings   ${LocalValue}  ${checkboxRequireError}${checkboxRequireError}


TaxVerification - Verify form validation - Tax ID required

    wait until element is visible  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_TaxID-error']      30s
    ${globalValue}=    get text    //a[@href='#p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_TaxID_mainControl']
   ${LocalValue}=    get text    //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_TaxID-error']
   should be equal as strings   ${globalValue}  ${taxIDRequireError}
    should be equal as strings   ${LocalValue}  ${taxIDRequireError}${taxIDRequireError}



Verify checkbox error message should not appeared

    wait until element is visible  ${continueButtonXpath}      30s

    page should not contain element  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_TaxAcknowledgement_mainControl-error']


Verify TaxID error message should not appeared

    wait until element is visible  ${continueButtonXpath}      30s

    page should not contain element  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_TaxID-error']

Enter TaxID

    wait until element is visible  ${continueButtonXpath}      30s
    input text  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_TaxID_mainControl']    taxID123

change country  [Arguments]  ${countryName}=Canada

    run keyword if  '${countryName}'== 'Canada'  click element  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_CountryOfOrigin_mainControl']/div[2]/label
    run keyword if  '${countryName}'== 'US'     click element   //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_CountryOfOrigin_mainControl']/div[1]/label
    run keyword if  '${countryName}'== 'UK'  click element   //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_CountryOfOrigin_mainControl']/div[3]/label
    run keyword if  '${countryName}'== 'Europe'  click element   //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_CountryOfOrigin_mainControl']/div[4]/label
    run keyword if  '${countryName}'== 'International'  click element   //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_CountryOfOrigin_mainControl']/div[5]/label
