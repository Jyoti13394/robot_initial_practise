*** Settings ***
Documentation    A resource file with reusable keywords and variables
Library     SeleniumLibrary


*** Variables ***
${user_name}    rahulshettyacademy
${password}     12345678
${URL}  https://rahulshettyacademy.com/loginpagePractise/
${Browser}  Chrome

*** Keywords ***
Open the browser with url
	Open Browser    ${URL}  ${Browser}
	Maximize Browser Window