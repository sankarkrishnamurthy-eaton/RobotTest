*** Settings ***
Documentation   Auto1/QA Task
Library         SeleniumLibrary
Library         String
Library         helpers.HelpLib
Library         Collections    
Suite Setup     Open URL Locally
Suite Teardown  Close Browser


*** Test Cases ***
TC1 - Check Filters on Advanced Searh Page
    Given Open URL AutoHero
   


*** Keywords ***
Open Tests in Souce Labs
    ${desired_capabilities}=    Create Dictionary
    Set to Dictionary    ${desired_capabilities}    build    test_run
    Set to Dictionary    ${desired_capabilities}    platformName    Windows 10
    Set to Dictionary    ${desired_capabilities}    name    Auto1
    Set to Dictionary    ${desired_capabilities}    browserName    chrome

    ${executor}=    Evaluate          str('http://milan.novovic:0f772a45-b623-4d44-a01f-9a1db40f0d5d@ondemand.saucelabs.com:80/wd/hub')
    Create Webdriver    Remote      desired_capabilities=${desired_capabilities}    command_executor=${executor}   


Open URL Locally
    #Open Webdriver hosted on Azure Devops
    Create Webdriver    Chrome    executable_path=D:/a/1/s/node_modules/chromedriver/lib/chromedriver/chromedriver.exe
    
    # Open Browser on Local Machine
    # Open Browser    https://www.autohero.com/de/search/    chrome
    Maximize Browser Window

Open URL AutoHero
    Go To    https://www.autohero.com/

