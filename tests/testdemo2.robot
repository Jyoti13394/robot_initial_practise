*** Settings ***
Documentation    Handling child window
Library    SeleniumLibrary
Library    String
Library    Collections
Resource    resource.robot
Test Setup    Open the browser with url

*** Variables ***
${Browser}  Chrome
${URL}  https://rahulshettyacademy.com/loginpagePractise/

*** Test Cases ***
Validate Child Window Functionality
	Select the link of child window
	Verify the user is switched to child window
	Grab the email id in the child window
	Switch to parent window and enter the email


*** Keywords ***
Select the link of child window
	Click Link    css:.blinkingText
	Sleep    5

Verify the user is switched to child window
	Switch Window    NEW
	${title_of_child_window}=   Get Title
    Log     ${title_of_child_window}
    Should Be Equal As Strings    ${title_of_child_window}      RS Academy

Grab the email id in the child window
    ${full_text}=   Get Text  css:p[class='im-para red']
    @{list_of_strings}=     Split String    ${full_text}
    Log     ${list_of_strings[4]}
    ${email}=       Get From List   ${list_of_strings}     4
    Set Global Variable    ${email}

Switch to parent window and enter the email
	Switch Window    MAIN
	Title Should Be    LoginPage Practise | Rahul Shetty Academy
	Input Text    id:username   ${email}
