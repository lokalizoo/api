---
title: Users
template: api.jade
---

- `id` - ID
- `href` - Canonical URL
- `memberships` - [Linked](../links.html) collection of [membership](memberships.html) objects that represent groups the user belongs to
- `ownerships` - [Linked](../links.html) collection of [Ownership](ownerships.html) objects that represent the user's devices.
- `login` - User's login. Usually an email address.
- `avatar` - Object containing the URL of user's profile picture in different formats
  - `large` - Full size picture
  - `small` - 80x80 icon
- `details` - Personal information and other details

---

# GET `/users/{id}`

Returns user data. Special ID `me` can be used to request data about the resource owner.

#### Scopes
Requires `identify` scope to access data about resource owner. `friends` scope allows querying users that share a common group.

#### Example response

```http
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "id": "90f78ab7",
  "href": "/users/90f78ab7",
  "memberships": {"href": "/memberships?user=90f78ab7"},
  "ownerships": {"href": "/ownerships?user=90f78ab7"},
  "login": "jan@kowalski.net",
  "avatar": {
    "large": "https://lokcdn.com/avatars/941ccada95030ba9.jpg",
    "small": "https://lokcdn.com/avatars/0f56c7eedc63366c.jpg"
  },
  "details": {
    "name": "Jan Kowalski",
    "address": "Strumykowa 12",
    "city": "Zielona Góra",
    "postCode": "12-345"
  }
}
```
