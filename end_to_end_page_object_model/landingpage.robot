*** Settings ***
Documentation    Landing Page Keywords and Variables
Library    SeleniumLibrary
Resource    generic_resources.robot

*** Variables ***
${user_name}    rahulshettyacademy
${password}     learning
${incorrect_password}   password
${pop_up}   css:.modal-body
${error_message}    css:.alert-danger

*** Keywords ***
Fill the login form
	Input Text    id:username   ${user_name}
	Input Password    id:password   ${password}
	Click Element    xpath://input[@value = 'user']
	Wait Until Element Is Located On Page        ${pop_up}
	Click Button    id:okayBtn
	Select From List By Value    css:select[class='form-control']   teach
	Click Button    id:signInBtn

Validate unsuccesful login
	[Arguments]    ${user_name}     ${password}
	Input Text    id:username   ${user_name}
	Input Password    id:password   ${incorrect_password}
	Click Button    id:signInBtn
    Wait Until Element Is Located On Page    ${error_message}
	Element Text Should Be    ${error_message}  Incorrect username/password.




