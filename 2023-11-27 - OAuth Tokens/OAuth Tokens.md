---
marp: true
---

# OAuth Tokens

> What are they good for?

---

## 3 types of tokens

![](./img/bring-it-on-kuzco.gif)

---

## Access token

![bg right](./img/gate.jpg)

- All flows
- "Proof" of access
- Signed by a "trusted authority"
- Describes:
  - subject: _who_ has access
  - audience: _what_ do they have access to
  - scopes: optionally, _which parts_ do they have access to

---

## Identity token

![bg right contain](./img/passport.jpg)

- User flows only
  - Authorization code flow
- OIDC only
- Describes user details:
  - Email
  - Name
  - Nickname
  - Profile picture
  - Phone number

---

## Refresh token

![bg right contain](./img/refresh_tokens.jpg)

- User flows only\*
  - Authorization code flow
- OIDC only
- Opaque
  - An ID to a session
  - A JWT describing the access token to issue

---

## Demo time

![](./img/NH9FsJ9.gif)

---

## Token reponse

```json
{
  "access_token": "eyJhbGc...",
  "id_token": "eyJhbGc...",
  "refresh_token": "pdG8uZX...",
  "scope": "openid profile offline_access",
  "expires_in": 86400,
  "token_type": "Bearer"
}
```

---

## Access token

```json
{
  "https://api.mito.ai/email": "victor@strise.ai",
  "iss": "https://mito.eu.auth0.com/",
  "sub": "google-oauth2|102585866882064009450",
  "aud": ["https://example.com/tokens", "https://mito.eu.auth0.com/userinfo"],
  "iat": 1700823792,
  "exp": 1700910192,
  "azp": "qpqMFAYEG2FOkezzOwI4B5iHcoUxVa8W",
  "scope": "openid profile"
}
```

---

## ID token

```json
{
  "https://api.mito.ai/email": "victor@strise.ai",
  "scope": ["openid", "profile"],
  "given_name": "Victor Nascimento ",
  "family_name": "Bakke",
  "nickname": "victor",
  "name": "Victor Nascimento Bakke",
  "picture": "https://lh3.googleusercontent.com/a/ACg8ocI0TeJdNrYKA9oNbuSu-Bc0R4ReZK7cCZJUI85Z-8k-=s96-c",
  "locale": "en",
  "updated_at": "2023-11-24T11:03:11.645Z",
  "iss": "https://mito.eu.auth0.com/",
  "aud": "qpqMFAYEG2FOkezzOwI4B5iHcoUxVa8W",
  "iat": 1700823792,
  "exp": 1700859792,
  "sub": "google-oauth2|102585866882064009450",
  "sid": "bjlxcB8sfzl73YRFKApaIhTU04KFYMKw",
  "nonce": "ei1ncC5rMHJBQ3EtQ3JpSmsyTlZabXlNMFNlUX56RXpLN0pESTFldUhKUQ=="
}
```
