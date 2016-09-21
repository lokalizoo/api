---
title: Subscribing to collection changes
template: page.jade
---

There are two ways to subscribe to a collection's changefeed:
- Server Sent Events
- Firebase Cloud Messaging

---

### Subscribing via Server Sent Events

Simply pass the collection URL as the source of server sent events

#### Example

```js
// Subscribe to chat messages
const stream = new EventSource('https://api.lokalizoo.pl/groups/12345/messages')
stream.on('create', ev => {/* ev.data is the msg that was posted */})
stream.on('update', ev => {/* ev.data is the msg after it was edited */})
stream.on('delete', ev => {/* ev.data.id is the id of the msg that was deleted */})
```

### Subscribing via Firebase Cloud Messaging

- `type` - must be `fcm`
- `token` - device's FCM registration token
- `event` - which type of event are you interested in (`create` / `update` / `delete`)
- `notification` - [FCM notification parameters](https://firebase.google.com/docs/cloud-messaging/concept-options#notifications).

#### Example request
```http
POST /groups/12345/messages/subscribe HTTP/1.1
Host: api.lokalizoo.pl
Authorization: Bearer AccEss_t0kEn
Content-Type: application/json

{
  "type": "fcm",
  "token": "FrH7F56Fv",
  "event": "create",
  "notification": {
    "title": "New message by {author}",
    "body": "{content}",
    "icon": "message"
  }
}
```
