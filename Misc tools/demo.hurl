POST https://mito.eu.auth0.com/oauth/token
Content-Type: application/json
{
  "client_id": "{{client_id}}",
  "client_secret": "{{client_secret}}",
  "audience": "https://mito.eu.auth0.com/api/v2/",
  "grant_type": "client_credentials",
  "scope": "read:users"
}
HTTP 200
[Captures]
token: jsonpath "$.access_token"
expires_in: jsonpath "$.expires_in"
[Asserts]
variable "expires_in" > 0
variable "token" exists
variable "token" != ""
## adjfhsdflojslkfgj


GET https://mito.eu.auth0.com/api/v2/users
Authorization: Bearer {{token}}
Accept: application/json
[QueryStringParams]
q: email:"victor@strise.ai"
HTTP 200
[Captures]
user: jsonpath "$.[0]"
[Asserts]
variable "user" exists
