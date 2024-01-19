---
marp: true
---

# Authorization Code Flow

> Authentication and authorization as a human

---

## Credentials (factors)

- Identifying element
  - Username
  - Phone number
- Something only you know
  - Password
- Something you have (MFA)
  - TOTP device (phone, BankID chip)
  - Hardware key

---

## Authorization code flow

- Redirects user's browser
- Endpoint: `/authentication`
- Sends:
  - Client ID
  - Callback URL
    - Configured ahead of time in tenant
  - Type of authentication (`authorization_code`)
- User logs into the login page
- Returns to client with:
  - Authorization code
  - ???

---

## Authorization code as a proof

- Proof that the user logged in
- Identifies the logged-in user

---

## Client credentials flow + authorization code

- Endpoint: `/oauth/token`
- Send:
  - Client ID
  - Client Secret
  - Authorization Code
  - Type of authentication (`authorization_code`)
- Receives:
  - Access token
  - Identity token
  - Refresh token

---

## Visualized

![](https://github.com/Gipphe/presentations/blob/main/2023-10-19%20-%20OAuthorization%20Code%20Flow/img/authorization_code.png?raw=true)

---

## Visualized (better)

---

## You (user) and web page (client)

![](https://github.com/Gipphe/presentations/blob/main/2023-10-19%20-%20OAuthorization%20Code%20Flow/img/you_and_client.webp?raw=true)

---

## Auth0 (tenant)

![](https://github.com/Gipphe/presentations/blob/main/2023-10-19%20-%20OAuthorization%20Code%20Flow/img/auth0.webp?raw=true)

---

## You give your credentials to Auth0

![](https://github.com/Gipphe/presentations/blob/main/2023-10-19%20-%20OAuthorization%20Code%20Flow/img/whispering.jpg?raw=true)

---

## Auth0 checks your credentials

![](https://github.com/Gipphe/presentations/blob/main/2023-10-19%20-%20OAuthorization%20Code%20Flow/img/typing.jpg?raw=true)

---

## Credentials check out

![](https://github.com/Gipphe/presentations/blob/main/2023-10-19%20-%20OAuthorization%20Code%20Flow/img/allgood.jpg?raw=true)

---

## Auth0 returns Authorization code to client

![](https://github.com/Gipphe/presentations/blob/main/2023-10-19%20-%20OAuthorization%20Code%20Flow/img/secret-code.jpg?raw=true)

---

## Client exchanges Auth code for tokens behind the scenes

![](https://github.com/Gipphe/presentations/blob/main/2023-10-19%20-%20OAuthorization%20Code%20Flow/img/got-more-tokens.jpg?raw=true)

---

## Heading over to the API

![height:600px](https://github.com/Gipphe/presentations/blob/main/2023-10-19%20-%20OAuthorization%20Code%20Flow/img/running.jpg?raw=true)

---

## The API you want to use (resource server)

![height:600px](https://github.com/Gipphe/presentations/blob/main/2023-10-19%20-%20OAuthorization%20Code%20Flow/img/secure.jpg?raw=true)

---

## Use the access token received from Auth0

![height:600px](https://github.com/Gipphe/presentations/blob/main/2023-10-19%20-%20OAuthorization%20Code%20Flow/img/access-token.jpg?raw=true)

---

## You're in

![height:600px](https://github.com/Gipphe/presentations/blob/main/2023-10-19%20-%20OAuthorization%20Code%20Flow/img/dog-doggo.png?raw=true)
