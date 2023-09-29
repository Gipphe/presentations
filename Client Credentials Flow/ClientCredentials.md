---
marp: true
---

# OAuth Client Credentials

> Authentication and authorization as a machine

---

## Credentials

- Client ID
  - "Username"
- Client Secret
  - "Password"

---

## Token

- Token endpoint: `/oauth/token`
- Sends:

  - Type of authentication (`client_credentials`)
  - Credentials: "Who you are"
  - Audience: "Where you log in"
  - Scope (optional): "What you want to do"

- Receives
  - Token
  - Expiration

---

# Demo
