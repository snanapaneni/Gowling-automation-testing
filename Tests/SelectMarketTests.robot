*** Settings ***
Documentation    Suite description
Library  Selenium2Library
Resource  ../Resources/Keywords/SelectMarketKeywords.robot
Library	Screenshot
Suite Setup     open browser  http://startech:St@rT3ch!@startech-qa.ecentricarts.com/  chrome
Suite Teardown     Close browser


*** Variables ***

${filePath}     ${EXECDIR}//Resources/MarketData.txt

*** Test Cases ***

Goto to landing page and get the urls of the market and language. Grap the footer warehouse data
    [Documentation]  Get the data from the externalsheet --> Iterate all the market, respective language and grab the Warehouse data
    [Tags]    Critical
    @{lines}=  Read data from external source   ${filePath}
    Iterate the markets from the external data    @{lines}