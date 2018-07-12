*** Settings ***
Documentation    Suite description

Library  Selenium2Library
Resource    ../Resources/Keywords/BillingInformationKeywords.robot
Resource  ../Resources/Keywords/AccountDetailsKeywords.robot
Library 	Screenshot
Library   robot.libraries.String

Suite Setup     open browser  http://startech:St@rT3ch!@startech-qa.ecentricarts.com/ca/register-en?returnurl=/Register  chrome
Suite Teardown  Close browser

*** Test Cases ***

Verify EndUser-Home[BillingInformation] navigation to registration page

    Change customer type    EndUser-Home
    Click Continue button
    page should contain element Account details Text

EndUser-Home - Enter valid data and verify the navigation

    Enter First Name  TestFirstName
    Enter Last Name  TestLastName
    Enter Email ID  test@email.com
    Enter Password  123qwe!@#
    Enter confirm Password  123qwe!@#
    Click Continue button
    verify Billing information page Navgition

EndUser-Home - Verify and Validate Form validation Error Message - Header

   page should contain element billing details Text

EndUser-Home - Verify and Validate Form validation Error Message - ALL

    Click Continue button
    BillingInformation - Verify form validation - ALL
    BillingInformatio - Verify form validation - Address Require
    BillingInformatio - Verify form validation - city Require
    BillingInformatio - Verify form validation - postalCode Require
    BillingInformatio - Verify form validation - phone Require
    BillingInformatio - Verify form validation - terms&Condition Require

EndUser-Home - Enter address and Verify error message for address shouldn't be appear , rest should be

    Enter - Address require
    Click Continue button
    verify address error message should not appeared
    AccountDetailsKeywords.Verify global error message should get vanish by enter correct value    5
    BillingInformatio - Verify form validation - city Require
    BillingInformatio - Verify form validation - postalCode Require
    BillingInformatio - Verify form validation - phone Require
    BillingInformatio - Verify form validation - terms&Condition Require

EndUser-Home - Enter address,city and Verify error message for postalCode, Phone, Terms shouldn't be appear , rest should be

    Enter - Address require
    Enter - city require
    Click Continue button
    verify address error message should not appeared
    verify city error message should not appeared
    AccountDetailsKeywords.Verify global error message should get vanish by enter correct value    4
    BillingInformatio - Verify form validation - postalCode Require
    BillingInformatio - Verify form validation - phone Require
    BillingInformatio - Verify form validation - terms&Condition Require



EndUser-Home - Enter address,City, postal and Verify error message.

    Enter - Address require
    Enter - city require
    Enter - postal require
    Click Continue button
    verify address error message should not appeared
    verify city error message should not appeared
    verify postalcode error message should not appeared
    AccountDetailsKeywords.Verify global error message should get vanish by enter correct value    3
    BillingInformatio - Verify form validation - phone Require
    BillingInformatio - Verify form validation - terms&Condition Require


EndUser-Home - Enter all data except terms&conditions and Verify error message

    Enter - Address require
    Enter - city require
    Enter - postal require
    Enter - phone number require
    Click Continue button
    verify address error message should not appeared
    verify city error message should not appeared
    verify postalcode error message should not appeared
    Verify phone error message should not appeared
    AccountDetailsKeywords.Verify global error message should get vanish by enter correct value    2
    BillingInformatio - Verify form validation - terms&Condition Require

EndUser-Home - Enter valid data and verify the navigation

    Enter - Address require
    Enter - city require
    Enter - postal require
    Enter - phone number require
    click terms & conditions
     Click Continue button



