*** Settings ***
Documentation    Suite description

Library  Selenium2Library
Resource  ../Resources/Keywords/CMS_PIMKeywords.robot
Library	Screenshot
Suite Setup     open browser  http://startech-qa.ecentricarts.com/CMSPages/logon.aspx?ReturnUrl=%2fAdmin%2fCMSAdministration.aspx  chrome
Suite Teardown     Close All Browsers


*** Variables ***

${userName}     abharath
${password}     qwe123!@#
${pimModuleName}   PIM
${marketModuleName}   Market

*** Test Cases ***
Nagivate to CMS PIM module - validate individual tabs

    Login CMS   ${userName}     ${password}
    Navigate to custom modules  ${pimModuleName}
    navigate to PIM-Product type
    navigate to pim-field groups
    navigate to pim-fields
    navigate to pim-presets
    navigate to pim - unit of measure
    Reload page
#Nagivate to CMS Market module - validate individual tabs

   # Navigate to custom modules  ${marketModuleName}
    #Navigate To Markets - Regions
    #Navigate To Markets - Warehouse
    #Reload Page
