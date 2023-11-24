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

![](./diagrams/out/authorization_code.png)

---

## Visualized (better)

---

## You (user) and web page (client)

![](./img/you_and_client.webp)

---

## Auth0 (tenant)

![](./img/auth0.webp)

---

## You give your credentials to Auth0

![](./img/whispering.jpg)

---

## Auth0 checks your credentials

![](./img/typing.jpg)

---

## Credentials check out

![](./img/allgood.jpg)

---

## Auth0 returns Authorization code to client

![](./img/secret-code.jpg)

---

## Client exchanges Auth code for tokens behind the scenes

![](./img/got-more-tokens.jpg)

---

## Heading over to the API

![height:600px](./img/running.jpg)

---

## The API you want to use (resource server)

![height:600px](./img/secure.jpg)

---

## Use the access token received from Auth0

![height:600px](./img/access-token.jpg)

---

## You're in

![height:600px](./img/dog-doggo.png)
