*** Settings ***
Documentation    Suite description
Library  Selenium2Library
Resource  ../Xpaths/AccountDetailsXpath.robot
Library	Screenshot
Library   robot.libraries.String

*** Variables ***

${AccountDetailsText}   Account Details
${submitFormError}      Sorry, we could not submit the form. Please review the following fields:
${FirstNameRequireError}    First name is required
${LastNameRequireError}     Last name is required
${EmailRequireError}    Email is required
${passwordRequireError}     Please enter a value.
${passwordMismatchError}    Passwords must match
${billingHeaderText}    Billing Information
${jobTitle}     QA
*** Keywords ***

Change customer type    [Arguments]  ${customerType}=Reseller

    run keyword if  '${customerType}'== 'Reseller'  click element  ${resellerRadioButtonXpath}
    run keyword if  '${customerType}'== 'SystemsIntegrator'     click element  ${systemIntegratorRadioButtonXpath}
    run keyword if  '${customerType}'== 'EndUser-Home'  click element   ${endUserHomeRadioButtonXpath}
    run keyword if  '${customerType}'== 'EndUser-Small'  click element   ${endUserSmallRadioButtonXpath}
    run keyword if  '${customerType}'== 'EndUser-Enterprise'  click element   ${endUserEnterpriseRadioBtnXpath}
    run keyword if  '${customerType}'== 'EndUser-Government'  click element   ${endUserGovernmentRadioBtnXpath}


page should contain element Account details Text

    ${getTitle}=    get text  ${accountPageHeaderTitleXpath}
    should be equal as strings  ${getTitle}     ${AccountDetailsText}

Click Continue button

    wait until element is visible  ${continueButtonXpath}     20s
    click element  ${continueButtonXpath}

Verify form validation - ALL

    page should contain element     ${errorFormPanelXpath}     20s
    Textfield Value Should Be   ${errorFormPanelHeaderTextXpath}    ${submitFormError}


Verify form validation - FirstName Require

   wait until element is visible  ${errorFormFirstNameXpath}      30s
   ${globalValue}=    get text    ${errorFormFirstNameXpath}
   ${LocalValue}=    get text    ${firstNameTextBoxErrorFieldXpath}
    should be equal as strings   ${globalValue}  ${FirstNameRequireError}
    should be equal as strings   ${LocalValue}  ${FirstNameRequireError}${FirstNameRequireError}


Verify form validation - LastName Require

    wait until element is visible  ${mainControlLastNameErrorXpath}      30s
    ${globalValue}=    get text   ${mainControlLastNameErrorXpath}
   ${LocalValue}=    get text    ${lastNameTextBoxErrorFieldXpath}
   should be equal as strings   ${globalValue}  ${LastNameRequireError}
    should be equal as strings   ${LocalValue}  ${LastNameRequireError}${LastNameRequireError}


Verify form validation - Email Require

    wait until element is visible  ${mainControlEmailErrorXpath}      30s
     ${globalValue}=    get text    ${mainControlEmailErrorXpath}
   ${LocalValue}=    get text    ${emailTextBoxErrorFieldXpath}
   should be equal as strings   ${globalValue}  ${EmailRequireError}
    should be equal as strings   ${LocalValue}  ${EmailRequireError}${EmailRequireError}

Verify form validation - Password Require

    wait until element is visible  ${mainControlPasswordErrorXpath}      30s
    ${globalValue}=    get text    ${mainControlPasswordErrorXpath}
   ${LocalValue}=    get text    ${passwordTextBoxErrorFieldXpath}
   should be equal as strings   ${globalValue}  ${passwordRequireError}
    should be equal as strings   ${LocalValue}  ${passwordRequireError}${passwordRequireError}


Verify form validation - Confirm Password Require

    wait until element is visible  ${mainControlConfirmPasswordErrorXpath}      30s
     ${globalValue}=    get text    ${mainControlConfirmPasswordErrorXpath}
   ${LocalValue}=    get text    ${confirmPasswordTextBoxErrorFieldXpath}
   should be equal as strings   ${globalValue}  ${passwordRequireError}
    should be equal as strings   ${LocalValue}  ${passwordRequireError}${passwordRequireError}


Enter First Name    [Arguments]     ${inputValue}

    wait until element is visible  ${firstNameTextBoxXpath}     60s
    input text  ${firstNameTextBoxXpath}    ${inputValue}

Enter Last Name    [Arguments]     ${inputValue}

    wait until element is visible  ${lastNameTextBoxXpath}    60s
    input text  ${lastNameTextBoxXpath}     ${inputValue}

Enter Email ID    [Arguments]     ${inputValue}

    wait until element is visible  ${emailTextBoxXpath}    60s
    input text  ${emailTextBoxXpath}        ${inputValue}

Enter Password   [Arguments]     ${inputValue}

    wait until element is visible  ${passwordTextBoxXpath}    60s
    input text  ${passwordTextBoxXpath}      ${inputValue}

Enter confirm Password   [Arguments]     ${inputValue}

    wait until element is visible  ${confirmPasswordTextBoxXpath}    60s
    input text  ${confirmPasswordTextBoxXpath}     ${inputValue}



Verify first name error message should not appeared

    wait until element is visible  ${continueButtonXpath}      30s

    page should not contain element  ${firstNameTextBoxErrorFieldXpath}

Verify last name error message should not appeared

    wait until element is visible  ${continueButtonXpath}      30s
    page should not contain element  ${lastNameTextBoxErrorFieldXpath}

Verify email error message should not appeared

    wait until element is visible  ${continueButtonXpath}      30s
    page should not contain element  ${emailTextBoxErrorFieldXpath}

Verify password error message should not appeared

    wait until element is visible  ${continueButtonXpath}      30s
    page should not contain element  ${passwordTextBoxErrorFieldXpath}

Verify confirm password error message should not appeared

    wait until element is visible  ${continueButtonXpath}      30s
    page should not contain element  ${confirmPasswordTextBoxErrorFieldXpath}

verify Billing information page Navgition

    wait until element is visible   ${billingPageHeadTextXpath}     20s
    ${text}=  get text  ${billingPageHeadTextXpath}
    should be equal as strings  ${text}     ${billingHeaderText}

Verify global error message should get vanish by enter correct value    [Arguments]  ${ListCount}

    xpath should match x times   ${errorMsgGlobalListXpath}     ${ListCount}


Verify Invalid password error message

    ${globalValue}=    get text    ${mainControlConfirmPasswordErrorXpath}
    ${LocalValue}=    get text    ${confirmPasswordTextBoxErrorFieldXpath}
    should be equal as strings   ${globalValue}  ${passwordMismatchError}
    should be equal as strings   ${LocalValue}  ${passwordMismatchError}${passwordMismatchError}


Enter JobTitle

     wait until element is visible  ${jobTitleTextBoxXpath}    60s
    input text  ${jobTitleTextBoxXpath}     ${jobTitle}

page should contain element Account type

    wait until element is visible  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_AccountType_mainControl']    60s
    element should be visible  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_AccountType_mainControl']/div[2]/label
    element should be visible  //*[@id='p_lt_ctl04_pageplaceholder_p_lt_ctl00_ST_Multi_ViewForm_viewBiz_AccountType_mainControl']/div[1]/label