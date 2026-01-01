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

TC_002: Empty First Name
    Open Registration Page
    Input Text    name=lastname        Sodsai
    Input Text    name=organization    CS KKU
    Input Text    name=email           somyod@kkumail.com
    Input Text    name=phone           091-001-1234
    Click Button    id=registerButton

    # ===== Expected Results =====
    Title Should Be    Registration
    Page Should Contain    Please enter your first name!!

TC_003: Empty Last Name
    Open Registration Page
    Input Text    name=firstname       Somyod
    Input Text    name=organization    CS KKU
    Input Text    name=email           somyod@kkumail.com
    Input Text    name=phone           091-001-1234
    Click Button    id=registerButton

    # ===== Expected Results =====
    Title Should Be    Registration
    Page Should Contain    Please enter your first name!!

TC_004: Empty First name and Last Name
    Open Registration Page
    Input Text    name=organization    CS KKU
    Input Text    name=email           somyod@kkumail.com
    Input Text    name=phone           091-001-1234
    Click Button    id=registerButton

    # ===== Expected Results =====
    Title Should Be    Registration
    Page Should Contain    Please enter your name!!

TC_004: Empty Email
    Open Registration Page
    Input Text    name=firstname       Somyod
    Input Text    name=lastname        Sodsai
    Input Text    name=organization    CS KKU
    Input Text    name=phone           091-001-1234
    Click Button    id=registerButton

    # ===== Expected Results =====
    Title Should Be    Registration
    Page Should Contain    Please enter your email!!

TC_005: Empty Phone Number
    Open Registration Page
    Input Text    name=firstname       Somyod
    Input Text    name=lastname        Sodsai
    Input Text    name=organization    CS KKU
    Input Text    name=email           somyod@kkumail.com
    Click Button    id=registerButton

    # ===== Expected Results =====
    Title Should Be    Registration
    Page Should Contain    enter your phone number!!

TC_006: Empty Phone Number
    Open Registration Page
    Input Text    name=firstname       Somyod
    Input Text    name=lastname        Sodsai
    Input Text    name=organization    CS KKU
    Input Text    name=email           somyod@kkumail.com
    Input Text    name=phone           1234
    Click Button    id=registerButton

    # ===== Expected Results =====
    Title Should Be    Registration
    Page Should Contain    Please enter a valid phone number, e.g., 081-234-5678, 081 234 5678, or 081.234.5678)

*** Keywords ***
Open Registration Page
    Open Browser  ${HOMEPAGE}  ${BROWSER}