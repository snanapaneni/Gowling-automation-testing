*** Settings ***
Documentation    Suite description

Library  Selenium2Library
Resource  ../Resources/Keywords/AccountDetailsKeywords.robot
Library	Screenshot
Library   robot.libraries.String

Suite Setup     open browser  http://startech:St@rT3ch!@startech-qa.ecentricarts.com/ca/register-en?returnurl=/Register  chrome
Suite Teardown     Close browser
*** Test Cases ***

Verify EndUser-Home navigation to registration page

    Change customer type    EndUser-Home
    Click Continue button
    page should contain element Account details Text

EndUser-Home - Verify and Validate Form validation Error Message - Header

   page should contain element Account details Text

EndUser-Home - Verify and Validate Form validation Error Message - ALL

    Click Continue button
    verify form validation - firstname require
    verify form validation - lastname require
    verify form validation - email require
    verify form validation - password require
    verify form validation - confirm password require

EndUser-Home - Enter UserName and Verify error message for Username shouldn't be appear , rest should be

    Enter First Name  Test
    Click Continue button
    verify first name error message should not appeared
    Verify global error message should get vanish by enter correct value    4
    verify form validation - lastname require
    verify form validation - email require
    verify form validation - password require
    verify form validation - confirm password require

EndUser-Home - Enter FN,LN and Verify error message for FN,LN shouldn't be appear , rest should be

    Enter First Name  Test
    Enter Last Name  Test
    Click Continue button
    verify first name error message should not appeared
    verify last name error message should not appeared
    Verify global error message should get vanish by enter correct value    3
    verify form validation - email require
    verify form validation - password require
    verify form validation - confirm password require

EndUser-Home - Enter FN,LN,EM and Verify error message for FN,LN shouldn't be appear , rest should be

    Enter First Name  Test
    Enter Last Name  Test
    Enter Email ID  test@gm.com
    Click Continue button
    verify first name error message should not appeared
    verify last name error message should not appeared
    verify email error message should not appeared
    Verify global error message should get vanish by enter correct value    2
    verify form validation - password require
    verify form validation - confirm password require

EndUser-Home - Enter FN,LN,EM,PWD and Verify error message for FN,LN shouldn't be appear , rest should be

    Enter First Name  Test
    Enter Last Name  Test
    Enter Email ID  test@gm.com
    Enter Password  123qwe!@#
    Click Continue button
    verify first name error message should not appeared
    verify last name error message should not appeared
    verify email error message should not appeared
    verify password error message should not appeared
    Verify global error message should get vanish by enter correct value    1
    verify form validation - confirm password require

EndUser-Home - Enter DIFFERENT PWD,CPWD and Verify error message

    Enter First Name  Test
    Enter Last Name  Test
    Enter Email ID  test@gm.com
    Enter Password  123qwe!@#
    Enter confirm Password  123qwesad
    Click Continue button
    Verify Invalid password error message

EndUser-Home - Enter valid data and verify the navigation

    Enter First Name  Test
    Enter Last Name  Test
    Enter Email ID  test@gm.com
    Enter Password  123qwe!@#
    Enter confirm Password  123qwe!@#
    Click Continue button
    verify Billing information page Navgition
    verify first name error message should not appeared
    verify last name error message should not appeared
    verify email error message should not appeared
    verify password error message should not appeared
    verify confirm password error message should not appeared




Verify EndUser-SM navigation to registration page

    Close browser
    open browser  http://startech:St@rT3ch!@startech-qa.ecentricarts.com/ca/register-en?returnurl=/Register  chrome
    Change customer type    EndUser-Small
    Click Continue button
    page should contain element Account details Text

EndUser-SM - Verify and Validate Form validation Error Message - Header

   page should contain element Account details Text

EndUser-SM - Verify and Validate Form validation Error Message - ALL

    Click Continue button
    verify form validation - firstname require
    verify form validation - lastname require
    verify form validation - email require
    verify form validation - password require
    verify form validation - confirm password require

EndUser-SM - Enter UserName and Verify error message for Username shouldn't be appear , rest should be

    Enter First Name  Test
    Click Continue button
    verify first name error message should not appeared
    Verify global error message should get vanish by enter correct value    4
    verify form validation - lastname require
    verify form validation - email require
    verify form validation - password require
    verify form validation - confirm password require

EndUser-SM - Enter FN,LN and Verify error message for FN,LN shouldn't be appear , rest should be

    Enter First Name  Test
    Enter Last Name  Test
    Click Continue button
    verify first name error message should not appeared
    verify last name error message should not appeared
    Verify global error message should get vanish by enter correct value    3
    verify form validation - email require
    verify form validation - password require
    verify form validation - confirm password require

EndUser-SM - Enter FN,LN,EM and Verify error message for FN,LN shouldn't be appear , rest should be

    Enter First Name  Test
    Enter Last Name  Test
    Enter Email ID  test@gm.com
    Click Continue button
    verify first name error message should not appeared
    verify last name error message should not appeared
    verify email error message should not appeared
    Verify global error message should get vanish by enter correct value    2
    verify form validation - password require
    verify form validation - confirm password require

EndUser-SM - Enter FN,LN,EM,PWD and Verify error message for FN,LN shouldn't be appear , rest should be

    Enter First Name  Test
    Enter Last Name  Test
    Enter Email ID  test@gm.com
    Enter Password  123qwe!@#
    Click Continue button
    verify first name error message should not appeared
    verify last name error message should not appeared
    verify email error message should not appeared
    verify password error message should not appeared
    Verify global error message should get vanish by enter correct value    1
    verify form validation - confirm password require

EndUser-SM - Enter DIFFERENT PWD,CPWD and Verify error message

    Enter First Name  Test
    Enter Last Name  Test
    Enter Email ID  test@gm.com
    Enter Password  123qwe!@#
    Enter confirm Password  123qwesad
    Click Continue button
    Verify Invalid password error message

EndUser-SM - Enter valid data and verify the navigation

    Enter First Name  Test
    Enter Last Name  Test
    Enter JobTitle
    Enter Email ID  test@gm.com
    Enter Password  123qwe!@#
    Enter confirm Password  123qwe!@#
    Click Continue button
    verify Billing information page Navgition
    verify first name error message should not appeared
    verify last name error message should not appeared
    verify email error message should not appeared
    verify password error message should not appeared
    verify confirm password error message should not appeared




Verify EndUser-Enterprise navigation to registration page

    Close browser
    open browser  http://startech:St@rT3ch!@startech-qa.ecentricarts.com/ca/register-en?returnurl=/Register  chrome
    Change customer type    EndUser-Enterprise
    Click Continue button
    page should contain element Account details Text

EndUser-Enterprise - Verify and Validate Form validation Error Message - Header

   page should contain element Account details Text

EndUser-Enterprise - Verify and Validate Form validation Error Message - ALL

    Click Continue button
    verify form validation - firstname require
    verify form validation - lastname require
    verify form validation - email require
    verify form validation - password require
    verify form validation - confirm password require

EndUser-Enterprise - Enter UserName and Verify error message for Username shouldn't be appear , rest should be

    Enter First Name  Test
    Click Continue button
    verify first name error message should not appeared
    Verify global error message should get vanish by enter correct value    4
    verify form validation - lastname require
    verify form validation - email require
    verify form validation - password require
    verify form validation - confirm password require

EndUser-Enterprise - Enter FN,LN and Verify error message for FN,LN shouldn't be appear , rest should be

    Enter First Name  Test
    Enter Last Name  Test
    Click Continue button
    verify first name error message should not appeared
    verify last name error message should not appeared
    Verify global error message should get vanish by enter correct value    3
    verify form validation - email require
    verify form validation - password require
    verify form validation - confirm password require

EndUser-Enterprise - Enter FN,LN,EM and Verify error message for FN,LN shouldn't be appear , rest should be

    Enter First Name  Test
    Enter Last Name  Test
    Enter Email ID  test@gm.com
    Click Continue button
    verify first name error message should not appeared
    verify last name error message should not appeared
    verify email error message should not appeared
    Verify global error message should get vanish by enter correct value    2
    verify form validation - password require
    verify form validation - confirm password require

EndUser-Enterprise - Enter FN,LN,EM,PWD and Verify error message for FN,LN shouldn't be appear , rest should be

    Enter First Name  Test
    Enter Last Name  Test
    Enter Email ID  test@gm.com
    Enter Password  123qwe!@#
    Click Continue button
    verify first name error message should not appeared
    verify last name error message should not appeared
    verify email error message should not appeared
    verify password error message should not appeared
    Verify global error message should get vanish by enter correct value    1
    verify form validation - confirm password require

EndUser-Enterprise - Enter DIFFERENT PWD,CPWD and Verify error message

    Enter First Name  Test
    Enter Last Name  Test
    Enter Email ID  test@gm.com
    Enter Password  123qwe!@#
    Enter confirm Password  123qwesad
    Click Continue button
    Verify Invalid password error message

EndUser-Enterprise - Enter valid data and verify the navigation

    Enter First Name  Test
    Enter Last Name  Test
    Enter JobTitle
    Enter Email ID  test@gm.com
    Enter Password  123qwe!@#
    Enter confirm Password  123qwe!@#
    Click Continue button
    verify Billing information page Navgition
    verify first name error message should not appeared
    verify last name error message should not appeared
    verify email error message should not appeared
    verify password error message should not appeared
    verify confirm password error message should not appeared


Verify EndUser-SM navigation to registration page

    Close browser
    open browser  http://startech:St@rT3ch!@startech-qa.ecentricarts.com/ca/register-en?returnurl=/Register  chrome
    Change customer type    EndUser-Small
    Click Continue button
    page should contain element Account details Text

EndUser-SM - Verify and Validate Form validation Error Message - Header

   page should contain element Account details Text

EndUser-SM - Verify and Validate Form validation Error Message - ALL

    Click Continue button
    verify form validation - firstname require
    verify form validation - lastname require
    verify form validation - email require
    verify form validation - password require
    verify form validation - confirm password require

EndUser-SM - Enter UserName and Verify error message for Username shouldn't be appear , rest should be

    Enter First Name  Test
    Click Continue button
    verify first name error message should not appeared
    Verify global error message should get vanish by enter correct value    4
    verify form validation - lastname require
    verify form validation - email require
    verify form validation - password require
    verify form validation - confirm password require

EndUser-SM - Enter FN,LN and Verify error message for FN,LN shouldn't be appear , rest should be

    Enter First Name  Test
    Enter Last Name  Test
    Click Continue button
    verify first name error message should not appeared
    verify last name error message should not appeared
    Verify global error message should get vanish by enter correct value    3
    verify form validation - email require
    verify form validation - password require
    verify form validation - confirm password require

EndUser-SM - Enter FN,LN,EM and Verify error message for FN,LN shouldn't be appear , rest should be

    Enter First Name  Test
    Enter Last Name  Test
    Enter Email ID  test@gm.com
    Click Continue button
    verify first name error message should not appeared
    verify last name error message should not appeared
    verify email error message should not appeared
    Verify global error message should get vanish by enter correct value    2
    verify form validation - password require
    verify form validation - confirm password require

EndUser-SM - Enter FN,LN,EM,PWD and Verify error message for FN,LN shouldn't be appear , rest should be

    Enter First Name  Test
    Enter Last Name  Test
    Enter Email ID  test@gm.com
    Enter Password  123qwe!@#
    Click Continue button
    verify first name error message should not appeared
    verify last name error message should not appeared
    verify email error message should not appeared
    verify password error message should not appeared
    Verify global error message should get vanish by enter correct value    1
    verify form validation - confirm password require

EndUser-SM - Enter DIFFERENT PWD,CPWD and Verify error message

    Enter First Name  Test
    Enter Last Name  Test
    Enter Email ID  test@gm.com
    Enter Password  123qwe!@#
    Enter confirm Password  123qwesad
    Click Continue button
    Verify Invalid password error message

EndUser-SM - Enter valid data and verify the navigation

    Enter First Name  Test
    Enter Last Name  Test
    Enter JobTitle
    Enter Email ID  test@gm.com
    Enter Password  123qwe!@#
    Enter confirm Password  123qwe!@#
    Click Continue button
    verify Billing information page Navgition
    verify first name error message should not appeared
    verify last name error message should not appeared
    verify email error message should not appeared
    verify password error message should not appeared
    verify confirm password error message should not appeared




Verify EndUser-Government navigation to registration page

    Close browser
    open browser  http://startech:St@rT3ch!@startech-qa.ecentricarts.com/ca/register-en?returnurl=/Register  chrome
    Change customer type    EndUser-Enterprise
    Click Continue button
    page should contain element Account details Text

EndUser-Government - Verify and Validate Form validation Error Message - Header

   page should contain element Account details Text

EndUser-Government - Verify and Validate Form validation Error Message - ALL

    Click Continue button
    verify form validation - firstname require
    verify form validation - lastname require
    verify form validation - email require
    verify form validation - password require
    verify form validation - confirm password require

EndUser-Government - Enter UserName and Verify error message for Username shouldn't be appear , rest should be

    Enter First Name  Test
    Click Continue button
    verify first name error message should not appeared
    Verify global error message should get vanish by enter correct value    4
    verify form validation - lastname require
    verify form validation - email require
    verify form validation - password require
    verify form validation - confirm password require

EndUser-Government - Enter FN,LN and Verify error message for FN,LN shouldn't be appear , rest should be

    Enter First Name  Test
    Enter Last Name  Test
    Click Continue button
    verify first name error message should not appeared
    verify last name error message should not appeared
    Verify global error message should get vanish by enter correct value    3
    verify form validation - email require
    verify form validation - password require
    verify form validation - confirm password require

EndUser-Government - Enter FN,LN,EM and Verify error message for FN,LN shouldn't be appear , rest should be

    Enter First Name  Test
    Enter Last Name  Test
    Enter Email ID  test@gm.com
    Click Continue button
    verify first name error message should not appeared
    verify last name error message should not appeared
    verify email error message should not appeared
    Verify global error message should get vanish by enter correct value    2
    verify form validation - password require
    verify form validation - confirm password require

EndUser-Government - Enter FN,LN,EM,PWD and Verify error message for FN,LN shouldn't be appear , rest should be

    Enter First Name  Test
    Enter Last Name  Test
    Enter Email ID  test@gm.com
    Enter Password  123qwe!@#
    Click Continue button
    verify first name error message should not appeared
    verify last name error message should not appeared
    verify email error message should not appeared
    verify password error message should not appeared
    Verify global error message should get vanish by enter correct value    1
    verify form validation - confirm password require

EndUser-Government - Enter DIFFERENT PWD,CPWD and Verify error message

    Enter First Name  Test
    Enter Last Name  Test
    Enter Email ID  test@gm.com
    Enter Password  123qwe!@#
    Enter confirm Password  123qwesad
    Click Continue button
    Verify Invalid password error message

EndUser-Government - Enter valid data and verify the navigation

    Enter First Name  Test
    Enter Last Name  Test
    Enter JobTitle
    Enter Email ID  test@gm.com
    Enter Password  123qwe!@#
    Enter confirm Password  123qwe!@#
    Click Continue button
    verify Billing information page Navgition
    verify first name error message should not appeared
    verify last name error message should not appeared
    verify email error message should not appeared
    verify password error message should not appeared
    verify confirm password error message should not appeared