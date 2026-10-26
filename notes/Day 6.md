Postman Collection: JSONPlaceholder API Tests

**API under test:** JSONPlaceholder (https://jsonplaceholder.typicode.com)
**Tool:** Postman
**Total requests:** 10
**Checks:** HTTP status codes + response fields

---

## 1. Overview

This collection tests the free public API **JSONPlaceholder** using Postman.
Each request includes automated test scripts (JavaScript) that verify:

- The **HTTP status code** returned by the API
- The **presence and value of specific fields** in the JSON response

JSONPlaceholder is a fake online REST API used for testing and prototyping.
It requires no authentication, no API key, and no login.

---

## 2. Requests and Checks

| # | Request Name | Method | Endpoint | Tests Performed |
|---|--------------|--------|----------|-----------------|
| 01 | Get All Posts | GET | `/posts` | Status 200; response is a non-empty array; first post has `userId` and `title` |
| 02 | Get Single Post | GET | `/posts/1` | Status 200; `id` equals 1; `title` is a string |
| 03 | Get Comments for Post 1 | GET | `/posts/1/comments` | Status 200; response is an array; first comment has `email` |
| 04 | Create New Post | POST | `/posts` | Status 201; response has `id`; `title` matches sent data |
| 05 | Update Post (PUT) | PUT | `/posts/1` | Status 200; `title` is updated |
| 06 | Patch Post | PATCH | `/posts/1` | Status 200; `title` is patched |
| 07 | Delete Post | DELETE | `/posts/1` | Status 200 or 204 |
| 08 | Get Users | GET | `/users` | Status 200; response is an array; first user has `email` |
| 09 | Get Albums | GET | `/albums` | Status 200; first album has `userId` |
| 10 | Invalid Resource | GET | `/invalidendpoint` | Status 404 |

**Total: 10 requests, 20 automated tests.**

---
<img width="1187" height="908" alt="Screenshot 2026-10-26 235433" src="https://github.com/user-attachments/assets/d882cb92-1681-43a6-bafc-b699e8e68d49" />

<img width="1202" height="891" alt="Screenshot 2026-10-26 235455" src="https://github.com/user-attachments/assets/49fe6335-06ed-4c64-b43c-fc25c82776c2" />

## 3. Collection Runner Settings Used

| Setting | Value |
|---------|-------|
| Persist responses for a session | OFF |
| Turn off logs during run | OFF |
| Stop run if error occurs | OFF |
| Run collection without using stored cookies | ON |
| Save cookies after collection run | OFF |

---

## 4. Result

All 10 requests executed successfully.

**Summary:** 10 requests — 20 tests — 20 passed — 0 failed.


---

## 5. Request Bodies and Test Script

01 — Get All Posts\
Method: GET\
URL: https://jsonplaceholder.typicode.com/posts\
Body: None\

Test script:\

javascript
```
pm.test('Status code is 200', function () { pm.response.to.have.status(200); });
pm.test('Response is an array', function () { pm.expect(pm.response.json()).to.be.an('array'); });
pm.test('Array is not empty', function () { pm.expect(pm.response.json().length).to.be.greaterThan(0); });
pm.test('First post has userId and title', function () {
    var first = pm.response.json()[0];
    pm.expect(first).to.have.property('userId');
    pm.expect(first).to.have.property('title');
});
02 — Get Single Post
Method: GET
URL: https://jsonplaceholder.typicode.com/posts/1
Body: None

Test script:

javascript
pm.test('Status code is 200', function () { pm.response.to.have.status(200); });
pm.test('Body has ID 1', function () { pm.expect(pm.response.json().id).to.eql(1); });
pm.test('Body has title string', function () { pm.expect(pm.response.json().title).to.be.a('string'); });
03 — Get Comments for Post 1
Method: GET
URL: https://jsonplaceholder.typicode.com/posts/1/comments
Body: None

Test script:

javascript
pm.test('Status code is 200', function () { pm.response.to.have.status(200); });
pm.test('Response is array', function () { pm.expect(pm.response.json()).to.be.an('array'); });
pm.test('Comment contains email', function () { pm.expect(pm.response.json()[0]).to.have.property('email'); });
04 — Create New Post
Method: POST
URL: https://jsonplaceholder.typicode.com/posts
Headers: Content-Type: application/json
Body (raw → JSON):

json
{
    "title": "Test Post",
    "body": "This is a test body",
    "userId": 1
}
Test script:

javascript
pm.test('Status code is 201', function () { pm.response.to.have.status(201); });
pm.test('Response has ID', function () { pm.expect(pm.response.json()).to.have.property('id'); });
pm.test('Title matches sent data', function () { pm.expect(pm.response.json().title).to.eql('Test Post'); });
05 — Update Post (PUT)
Method: PUT
URL: https://jsonplaceholder.typicode.com/posts/1
Headers: Content-Type: application/json
Body (raw → JSON):

json
{
    "id": 1,
    "title": "Updated Title",
    "body": "Updated Body",
    "userId": 1
}
Test script:

javascript
pm.test('Status code is 200', function () { pm.response.to.have.status(200); });
pm.test('Title is updated', function () { pm.expect(pm.response.json().title).to.eql('Updated Title'); });
06 — Patch Post
Method: PATCH
URL: https://jsonplaceholder.typicode.com/posts/1
Headers: Content-Type: application/json
Body (raw → JSON):

json
{
    "title": "Patched Title"
}
Test script:

javascript
pm.test('Status code is 200', function () { pm.response.to.have.status(200); });
pm.test('Title is patched', function () { pm.expect(pm.response.json().title).to.eql('Patched Title'); });
07 — Delete Post
Method: DELETE
URL: https://jsonplaceholder.typicode.com/posts/1
Body: None

Test script:

javascript
pm.test('Status code is 200 or 204', function () { pm.expect([200, 204]).to.include(pm.response.code); });
08 — Get Users
Method: GET
URL: https://jsonplaceholder.typicode.com/users
Body: None

Test script:

javascript
pm.test('Status code is 200', function () { pm.response.to.have.status(200); });
pm.test('Response is array', function () { pm.expect(pm.response.json()).to.be.an('array'); });
pm.test('User has email field', function () { pm.expect(pm.response.json()[0]).to.have.property('email'); });
09 — Get Albums
Method: GET
URL: https://jsonplaceholder.typicode.com/albums
Body: None

Test script:

javascript

pm.test('Status code is 200', function () { pm.response.to.have.status(200); });
pm.test('Album has userId', function () { pm.expect(pm.response.json()[0]).to.have.property('userId'); });
10 — Invalid Resource (404 Check)
Method: GET
URL: https://jsonplaceholder.typicode.com/invalidendpoint
Body: None

Test script:

javascript
pm.test('Status code is 404', function () { pm.response.to.have.status(404); });
```
