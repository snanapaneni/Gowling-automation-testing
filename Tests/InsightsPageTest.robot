*** Settings ***
Documentation   Suite description
Library  Selenium2Library
Resource  ../Resources/Keywords/InsightsPageKeywords.robot

Suite Setup  open browser   https://gowling-qa.ecentricarts.com/    chrome
Suite Teardown  Close browser


*** Test Cases ***

Access Insights listing Page and find the Articles list
    maximize browser window
    Navigate to Insights listing page from Home Page
    Navigate to Article details page from listing page