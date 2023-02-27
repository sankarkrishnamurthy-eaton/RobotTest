*** Settings ***
Library    Collections
Library    RequestsLibrary
Library    String
Library    b64encode

*** Test Cases ***
Retrive Entitlement
    Create Session    TokenSession    https://api-qa.eaton.com/oauth   disable_warnings=True
    ${basicToken}=  Evaluate    base64.b64encode("uA123DuFzns3Wrx61zU2O1xCVvlRWQAX:6pMZMWkirANnsHFy".encode('utf-8')).decode("ascii")
    ${headersToken}    Create Dictionary    Authorization=Basic ${basicToken}
    ${authres}  POST On Session     TokenSession    url=/accesstoken?grant_type=client_credentials  headers=${headersToken}
    ${responsepayload}=    Set Variable    ${authres.json()}
    ${token}=      Set Variable    ${responsepayload['access_token']}
    Create Session  EntitlementSession  https://api-qa.eaton.com/entitlement-management/v1  disable_warnings=True
    ${headers}    Create Dictionary    Authorization=Bearer ${token}    Content-Type=application/json    Accept=application/json
    ${entitlmentRes}    GET On Session    EntitlementSession    url=/entitlements?actIdSearchType=EQUALS&accountId=US_STEEL_GARY    headers=${headers}
    Log    ${entitlmentRes.text}    console=True
    Should Be Equal As Strings    ${entitlmentRes.status_code}  200
    Should contain       ${entitlmentRes.text}  SUCCESS
