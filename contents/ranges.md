---
title: Specifying ranges
template: page.jade
---

Some collections support ordering and filtering results by a particular fields. There are several ways to specify a range:

- Via **query parameter** by appending `field=range` to the query string
- Via **range header** by specifying a `Range` HTTP header with a value `field=range`

The results will be sorted according to the following rules

- When `range` is `start..end` - sorted by `field` in **ascending** order, where value of `field` is equal or greater than `start` and less than `end`

- When `range` is `start..` - sorted by `field` in **ascending** order, where value of `field` is greater than `start`

- When `range` is `..end` - sorted by `field` in **descending** order, where value of `field` is less than `end`

- When `range` is `..` - sorted by `field` in **ascending** order

Remember that if the range is too big, not all items are guaranted to be returned. The `Content-Range` response header will reflect the actual returned range.
