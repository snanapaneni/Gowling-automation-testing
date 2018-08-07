*** Settings ***
Documentation   Suite description
Library  Selenium2Library
Resource  ../Resources/Keywords/SectorPageKeywords.robot

Suite Setup  open browser   https://gowling-qa.ecentricarts.com/    chrome
Suite Teardown  Close browser

*** Test Cases ***

Access Sector Page and go to Automotive sector page

    maximize browser window
    Navigate to Sector page from Home Page
