---
title: Authentication and authorization
template: page.jade
---

The Lokalizoo API uses the [OAuth 2](https://tools.ietf.org/html/rfc6749) scheme
for authentication and authorization.

---

### *Implicit* grant type <small>(for&nbsp;single page JS apps)</small>

Redirect the user of your app to the following URI:

```http
GET /auth?response_type=token&client_id=<your_client_id> HTTP/1.1
Host: api.lokalizoo.pl
```

Upon successful (or unsuccessful) authentication
the resource owner (a.k.a. user) will be redirected to your website
with the **access token** appended in the query string.

```http
HTTP/1.1 302 Found
Location: <your_redirect_uri>?token_type=bearer \
                             &access_token=AccEss_t0kEn \
                             &expires_in=3155673600
```

Your app should extract the access token from the query string
and use it in subsequent requests.

---

### *Authorization Code* grant type <small>(for&nbsp;mobile and&nbsp;desktop apps)</small>

Redirect the user of your app to the following URI:

```http
GET /auth?response_type=code&client_id=<your_client_id> HTTP/1.1
Host: api.lokalizoo.pl
```

The resource owner (a.k.a. user) will be redirected to your website
with the **authorization code** appended in the query string.

```http
HTTP/1.1 302 Found
Location: <your_redirect_uri>?code=12345678
```
Your app should extract the authorization code from the query string
and exchange it for an access token via following request:

```http
POST /token HTTP/1.1
Host: api.lokalizoo.pl
Content-Type: application/json

{
  "grant_type": "authorization_code",
  "code": "12345678",
  "client_id": "<your_client_id>",
  "client_secret": "<your_client_secret>"
}
```

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "access_token": "AccEss_t0kEn",
  "expires_in": 3155673600,
  "token_type": "bearer"
}
```

> **Hint:** `application/x-www-form-urlencoded` content type is also supported.

> **Hint:** You can optionally provide your client ID and secret
  in the Authorization header using HTTP Basic Auth scheme instead.
