---
title: Devices
template: api.jade
---

- `id` - ID
- `href` - Canonical URL
- `ownerships` - [Linked](../links.html) collection of [ownership](ownerships.html) objects that represent the devices's owners.
- `fcmRegToken` **(write only)** - [FCM registration token](https://firebase.google.com/docs/cloud-messaging/concept-options#credentials).

**TODO** document remaining fields

---

# GET `/devices/{id}`

Returns device data. `{id}` can be device's ID or IMEI number

#### Scopes
Requires `devices` scope to access data about resource owner's devices.

#### Example response

```http
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "id": "448",
  "href": "/devices/448",
  "ownerships": {"href": "/ownerships?device=448"},
  "routes": {"href": "/devices/448/routes"},
  "name": "HTC One M9",
  "lastPoint": {
    "date": "2016-09-20T19:00:41.000Z",
    "fuelLevel": 0,
    "heading": 0,
    "ignitionState": false,
    "location": {"coordinates": [15.508, 51.930, 191], "type": "Point"},
    "routeDistance": null,
    "speed": 0
  }
}
```

# PATCH `/devices/{id}`

Update device data. `{id}` can be device's ID or IMEI number.

#### Scopes
Requires `devices` scope to update resource owner's devices.

#### Example request
```http
PATCH /devices/12345 HTTP/1.1
Host: api.lokalizoo.pl
Authorization: Bearer AccEss_t0kEn
Content-Type: application/json

{
  "name": "HTC One M9",
  "fcmRegToken": "j84jc84jmc89"
}
```
