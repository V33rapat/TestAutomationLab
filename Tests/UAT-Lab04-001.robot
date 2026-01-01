*** Settings ***
Library    SeleniumLibrary
Test Teardown    Capture Page Screenshot

*** Variables ***
${HOMEPAGE}    http://localhost:7272/Lab4/Registration.html
${BROWSER}     Chrome

*** Test Cases ***
TC_001: Open Workshop Registration Page
    Open Registration Page

    # ===== Expected Results =====
    Title Should Be    Registration

TC_002: Register Success
    Open Registration Page
    Input Text    name=firstname       Somyod
    Input Text    name=lastname        Sodsai
    Input Text    name=organization    CS KKU
    Input Text    name=email           somyod@kkumail.com
    Input Text    name=phone           091-001-1234
    Click Button    id=registerButton

    # ==== Expected Results ====
    Title Should Be    Success
    Page Should Contain    Thank you for registering with us.
    Page Should Contain    We will send a confirmation to your email soon.

TC_003: Register Success No Organization Info
    Open Registration Page
    Input Text    name=firstname       Somyod
    Input Text    name=lastname        Sodsai
    Input Text    name=email           somyod@kkumail.com
    Input Text    name=phone           091-001-1234
    Click Button    id=registerButton

    # ==== Expected Results ====
    Title Should Be    Success
    Page Should Contain    Thank you for registering with us.
    Page Should Contain    We will send a confirmation to your email soon.

*** Keywords ***
Open Registration Page
    Open Browser  ${HOMEPAGE}  ${BROWSER}