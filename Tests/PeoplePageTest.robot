*** Settings ***
Documentation   Suite description
Library  Selenium2Library
Resource  ../Resources/Keywords/PeoplePageKeywords.robot

Suite Setup  open browser   https://gowling-qa.ecentricarts.com/    chrome
Suite Teardown  Close browser


*** Test Cases ***

Access People Page and find the list from canada location
    maximize browser window
    Navigate to People page from Home Page
