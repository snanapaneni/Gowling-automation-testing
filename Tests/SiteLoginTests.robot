*** Settings ***
Documentation    Suite description
Library  Selenium2Library
Resource  ../Resources/Keywords/SiteLoginKeyword.robot
Library	Screenshot

Suite Setup     open browser  http://startech:St@rT3ch!@startech-qa.ecentricarts.com/  chrome
Suite Teardown     Close browser

#Create Webdriver    Chrome    executable_path=C:/WebDrivers/chromedriver.exe
#Go To    http://cnn.com

*** Variables ***


*** Test Cases ***
SiteLogin login with valid credentials
    [Documentation]  Successfull login with automation username and password
    [Tags]    Critical
    maximize browser window
    Navigate to login page from landing page
    Login with valid credentials   auto-test-user      qwe123!@#
    LogOut the logged-in user




