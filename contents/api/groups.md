---
title: Groups
template: api.jade
---

- `id` - ID
- `href` - Canonical URL
- `memberships` - [Linked](../links.html) collection of [membership](memberships.html) objects that represent group's members.
- `messages` - [Linked](../links.html) collection of [messages](messages.html) posted to group chat.
- `name` - Group's display name.

---

# GET `/groups/{id}`

Returns group data.

#### Scopes
Requires `groups` scope to access data about resource owner's groups.

#### Example response

```http
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "id": "90f78ab7",
  "href": "/groups/90f78ab7",
  "memberships": {"href": "/memberships?group=90f78ab7"},
  "messages": {"href": "/groups/90f78ab7/messages"},
  "name": "Lokalizoo"
}
```
