*** Settings ***
Library    Collections
Library     RequestsLibrary


*** Variables ***
${base_url}     https://rahulshettyacademy.com
${book_id}

*** Test Cases ***
Play Around with dictionary
	&{data}=    Create Dictionary    name=Jyoti Prasad      age=29      Occupation=Salaried
	Log     ${data}
	Dictionary Should Contain Key    ${data}    name
	Log     ${data}[name]
    ${age}=     Get From Dictionary    ${data}  age
    log     ${age}

Add book into library database
    &{request_body}=     Create Dictionary    name=Robotframework    isbn=72786  aisle=32445     author= Jyoti
    ${response}=    POST    ${base_url}/Library/Addbook.php     json=${request_body}    expected_status=200
    log     ${response.json()}
    Dictionary Should Contain Key    ${response.json()}     ID
    ${book_id}=    Get From Dictionary    ${response.json()}   ID
    Set Global Variable    ${book_id}
    log     ${book_id}
    Should Be Equal As Strings      successfully added  ${response.json()}[Msg]

Get the book details which got added
	${get_response}=    GET     ${base_url}/Library/GetBook.php     params=ID=${book_id}   expected_status=200
	log     ${get_response.json()}