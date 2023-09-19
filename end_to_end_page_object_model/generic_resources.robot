*** Settings ***
Documentation    General Keyswords and variables
Library    SeleniumLibrary



*** Variables ***
${Browser}  Chrome
${URL}  https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***
Open Browser and Launch URL
	Open Browser    ${URL}  ${Browser}
	Maximize Browser Window


Wait until element is located on page
	[Arguments]    ${page_element_locator}
	Wait Until Element Is Visible    ${page_element_locator}