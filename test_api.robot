*** Settings ***
Library  RequestsLibrary

*** Test Cases ***
Test Addition API
    [Documentation]  Test the /plus/a/b endpoint of the API
    [Tags]  API
    Create Session  api_session  http://localhost:8080  # Adjust the URL based on your API's address and port

    # Test case for positive numbers
    ${response}  GET On Session  api_session  /plus/2/3
    Should Be Equal As Numbers  ${response.status_code}  ${200}
    ${result}  Set Variable  ${response.json()["result"]}
    Should Be Equal As Numbers  ${result}  ${5}

    # Test case for negative numbers
    ${response}  GET On Session  api_session  /plus/-2/3
    Should Be Equal As Numbers  ${response.status_code}  ${200}
    ${result}  Set Variable  ${response.json()["result"]}
    Should Be Equal As Numbers  ${result}  ${1}

*** Keywords ***
Should Be Equal As Numbers
    [Arguments]  ${actual}  ${expected}
    Should Be Equal  ${actual}  ${expected}
