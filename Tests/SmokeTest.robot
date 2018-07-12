*** Settings ***
Documentation    Suite description
Resource  ../Resources/Keywords/SiteLoginKeyword.robot
Library  Selenium2Library
Resource  ../Resources/Keywords/SmokeTestKeywords.robot
Resource  ../Resources/Keywords/CMS_PIMKeywords.robot
Library	Screenshot
Library   robot.libraries.String
Resource  ../Resources/Keywords/SelectMarketKeywords.robot
Suite Setup     open browser  http://startech-qa.ecentricarts.com/en-us/home-5  chrome
Suite Teardown  Close browser

*** Variables ***

${userName}     abharath
${password}     qwe123!@#
${pimModuleName}   PIM
${marketModuleName}   Market

*** Test Cases ***


Primary Navigation

    verify product selection
    verify support selection
    verify product subcategory and navigation
    verify support subcategory and navigation

#Access contact info via Contact Utility
#
#    verify Talk to Advisor hours
#    verify Live Chat link
#    verify Contact number
#    verify E-mail link
#
#Use Logo to navigate to homepage
#
#    verify logo redirection
#
#
#Default Market & Language
#
#    verify Default Market & Language
#
#Select a Market with a single language only
#
#    close all browsers
#    open browser  http://startech-qa.ecentricarts.com/en-us/register-4  chrome
#    Select a Market with a single language only
#
#As Not Authenticated User - select Market & Language combo
#
#    [Documentation]  Get the data from the externalsheet --> Iterate all the market, respective language and grab the Warehouse data
#    [Tags]    Critical
#    @{lines}=  Read data from external source   ${EXECDIR}//Resources/MarketData.txt
#    Iterate the markets from the external data    @{lines}
#
##As Authenticated User - select Market & Language combo"
# #   [Documentation]  Successfull login with automation username and password
#  #  [Tags]    Critical
#   # maximize browser window
#    #Navigate to login page from landing page
#    #Login with valid credentials   auto-test-user      qwe123!@#
#   # LogOut the logged-in user
#
#
#SiteLogin login with valid credentials
#    [Documentation]  Successfull login with automation username and password
#    [Tags]    Critical
#    close all browsers
#    open browser  http://startech-qa.ecentricarts.com/en-us/home-5  chrome
#    maximize browser window
#    Navigate to login page from landing page
#    Login with valid credentials   auto-test-user      qwe123!@#
#    LogOut the logged-in user
#
#
#SiteLogin login with Invalid credentials and Verify Error Message
#    [Documentation]  Successfull login with automation username and password
#    [Tags]    Critical
#    Navigate to login page from landing page
#    Click Login submit button
#    userName should not be null
#    Enter UserName  inValid
#    Click Login submit button
#    password should not be null
#    Enter wrong password    inValid
#    Click Login submit button





#Create HardCategory and verify it in UI

   # close all browsers
    #open browser  http://startech-qa.ecentricarts.com/CMSPages/logon.aspx?ReturnUrl=%2fAdmin%2fCMSAdministration.aspx  chrome
    #maximize browser window
    #Login CMS   ${userName}     ${password}
    #Navigate to custom modules  Categorization
    #navigate to Cetegorization module

    #Add New Parent Hard Category
    #Add New Child Hard Category
    #Add child category to parent category
    #Create Category Pages

#Verify Hard Category in UI

 #   close all browsers
  #  open browser    http://startech-qa.ecentricarts.com/en-us/home-5    chrome
   # Navigate to hardCategory page and verify