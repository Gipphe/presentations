# Assuming secrets.env has `client_id` and `client_secret` defined
hurl --variables-file secrets.env --verbose m2m_token.hurl | jq
