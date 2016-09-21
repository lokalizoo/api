---
title: Memberships
template: api.jade
---

- `id` - ID
- `href` - Canonical URL
- `user` - [Linked](../links.html) [user](users.html) object
- `group` - [Linked](../links.html) [group](groups.html) object

---

# GET `/memberships`
Returns an array of memberships.

#### Scopes
Requires `groups` scope to access data about resource owner's memberships or any of the user's friends' memberships.

#### Query parameters

Exactly one is required

- `user` - Query user's groups
- `group` - Query group's members

#### Example request

```http
GET /memberships?user=453453 HTTP/1.1
Host: api.lokalizoo.pl
Authorization: Bearer AccEss_t0kEn
Content-Type: application/json
```

#### Example response

```http
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

[
  {
    "id": 56453,
    "group": {"href": "/groups/54362"},
    "user": {"href": "/users/453453"}
  },
  {
    "id": 65462,
    "group": {"href": "/groups/08632"},
    "user": {"href": "/users/453453"}
  },
  …
]
```
