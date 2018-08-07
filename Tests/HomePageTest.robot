*** Settings ***
Documentation   Suite description
Library  Selenium2Library
Resource  ../Resources/Keywords/HomePageKeywords.robot

Suite Setup  open browser   https://gowling-qa.ecentricarts.com/    chrome
Suite Teardown  Close browser

*** Test Cases ***

Access Home Page and verify the content by location
    maximize browser window
    verify default region on page load
    verify default language on page load