---
title: Messages
template: api.jade
---

- `id` - ID
- `href` - Canonical URL
- `author` - [Linked](../links.html) [user](users.html) object - author of the message
- `group` - [Linked](../links.html) target [group](groups.html) object
- `content` - Message's text content
- `timestamp` - Time when the message was posted

---

# GET `/groups/{gid}/messages`
Returns an array of messages posted to the group `{gid}`.

#### Scopes
Requires `chat` scope to access messages posted to resource owner's groups.

#### Query parameters

Exactly one is required

- `timestamp` - Order and limit by timestamp (See [specyfying ranges](../ranges.html))

#### Example request

```http
GET /groups/12345/messages?timestamp=..2017-01-01T00:00.00Z  HTTP/1.1
Host: api.lokalizoo.pl
Authorization: Bearer AccEss_t0kEn
```

#### Example response

```http
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

[
  {
    "id": 56453,
    "href": "/groups/12345/messages/56453",
    "author": {"href": "/users/453453"},
    "content": "Hello!",
    "timestamp": "2016-09-19T14:53:12Z"
  },
  {
    "id": 56455,
    "href": "/groups/12345/messages/56455",
    "author": {"href": "/users/443678"},
    "content": "What's up?",
    "timestamp": "2016-09-19T14:52:32Z"
  },
  …
]
```

---

# POST `/groups/{gid}/messages`
Sends a message to group.

#### Scopes
Requires `chat` scope to send messages to resource owner's groups.

#### Example request
```http
POST /groups/12345/messages HTTP/1.1
Host: api.lokalizoo.pl
Authorization: Bearer AccEss_t0kEn
Content-Type: application/json

{
  "content": "Hello!"
}
```

---

# Subscribing
Message collections can be [subscribed to](../subscribing.html).
