*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${CHROME_BROWSER_PATH}    D:/Work/Software Engineering/LAB7/WebDemo-master/WebDemo-master/ChromeForTesting/chrome.exe
${CHROME_DRIVER_PATH}    D:/Work/Software Engineering/LAB7/WebDemo-master/WebDemo-master/ChromeForTesting/chromedriver.exe
${SERVER}         localhost:7272
${DELAY}          0
${FORM URL}    http://${SERVER}/Form.html
${COMPLETE URL}    http://${SERVER}/Complete.html

*** Keywords ***
Open Browser To Form Page
    ${options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${options.binary_location}    Set Variable    ${CHROME_BROWSER_PATH}
    ${service}    Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")
    # [selenium >= 4.10] `chrome_options` change to `options`
    Create Webdriver    Chrome    options=${options}    service=${service}
    Go To    ${FORM URL}
    Form Page Should Be Open

Form Page Should Be Open
    Location Should Be    ${FORM URL}
    Title Should Be    Customer Inquiry

Open Browser To Complete Page
    ${options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${options.binary_location}    Set Variable    ${CHROME_BROWSER_PATH}
    ${service}    Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")
    # [selenium >= 4.10] `chrome_options` change to `options`
    Create Webdriver    Chrome    options=${options}    service=${service}
    Go To    ${COMPLETE URL}
    Complete Page Should Be Open

Complete Page Should Be Open
    Location Should Be    ${COMPLETE URL}
    Title Should Be    Complete Page