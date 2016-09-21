---
title: Ownerships
template: api.jade
---

- `id` - ID
- `href` - Canonical URL
- `user` - [Linked](../links.html) [user](users.html) object - owner of the device.
- `device` - [Linked](../links.html) [device](devices.html) object.

---

# GET `/ownerships`
Returns an array of ownerships.

#### Scopes
Requires `devices` scope to access data about resource owner's ownerships or any of the user's devices' ownerships.

#### Query parameters

Exactly one is required

- `user` - Query user's devices
- `device` - Query device's owners

#### Example request

```http
GET /ownerships?user=453453 HTTP/1.1
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
    "device": {"href": "/devices/54362"},
    "user": {"href": "/users/453453"}
  },
  {
    "id": 65462,
    "device": {"href": "/devices/08632"},
    "user": {"href": "/users/453453"}
  },
  …
]
```
