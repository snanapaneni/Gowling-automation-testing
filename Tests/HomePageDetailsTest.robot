*** Settings ***

Documentation    Suite description
Library  Selenium2Library
Resource  ../Resources/Keywords/HomePageDetailsKeywords.robot
Library	Screenshot
Library   robot.libraries.String

Suite Setup     open browser  http://startech:St@rT3ch!@startech-qa.ecentricarts.com/en-us/products/dvi-dual-monitor-docking-station-for-laptops-hdm/  chrome
Suite Teardown     Close browser

*** Variables ***

*** Test Cases ***
Global header - Global brand image

    Verify Global header - Global brand image

Global header - Tagline image

    Verify Global header - Tagline image

Global header - Search bar

    verify global header - search bar

Global header - Search bar icon

    verify global header - search bar icon

Primary Nav bar - Products tab

    verify primary nav bar - products tab

Primary Nav bar - Support tab

    verify primary nav bar - support tab

Primary Nav bar - Contact support tab

    verify primary nav bar - contact support tab

Primary Nav bar - Live chat link & icon

    verify primary nav bar - live chat link & icon

Primary Nav bar - Phone number link & icon

    verify primary nav bar - phone number link & icon


Primary footer bar - Footer primary links

    verify primary footer bar - footer primary links

Primary footer bar - Footer secondary heading

    verify primary footer bar - footer secondary heading

Primary footer bar - Footer secondary links

    verify primary footer bar - footer secondary links

Primary footer bar - Footer social heading

    verify primary footer bar - footer social heading

Primary footer bar - Footer social item links

    verify primary footer bar - footer social item links

Footer utility bar - Privacy link

    verify footer utility bar - privacy link

Footer utility bar - Site Feedback link

    verify footer utility bar - privacy link

Footer utility bar - Terms and conditions

    verify footer utility bar - terms and conditions

Footer utility bar - Site map

    verify footer utility bar - site map

Footer utility bar - copyright text

    verify footer utility bar - copyright text
