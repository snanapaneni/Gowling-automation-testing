*** Settings ***
Documentation    Suite description
Library  Selenium2Library
Resource  ../Resources/Keywords/ProductDetailsPageKeywords.robot
Library	Screenshot
Library   robot.libraries.String

Suite Setup     open browser  http://startech:St@rT3ch!@startech-qa.ecentricarts.com/en-us/products/dvi-dual-monitor-docking-station-for-laptops-hdm/  chrome
Suite Teardown     Close browser

*** Variables ***



*** Test Cases ***
Verify Page title
    [Tags]    Critical

    The page title must be <product name - StarTech.com>

Breadcrumbs - Back to results link should be available

    Breadcrumbs - Back to results link should be available

Breadcrumbs - Home link should be available

    Breadcrumbs - Home link should be available

Product name, which should match the heading text on class="product name"

    Product name, which should match the heading text on class="product name"

Product Details Page - Flag should present

    Product Details Page - Flag should present

Product Details Page - Product name should present

    Product Details Page - Product name should present

Product Details Page - Product supplemental should present

    Product Details Page - Product supplemental should present

Product Details Page - Product ID should present

    Product Details Page - Product ID should present

Product Details Page - Product review

    Product Details Page - Product review

Product Gallery - Product Image

    Product Gallery - Product Image

Product Price

    Product Price


