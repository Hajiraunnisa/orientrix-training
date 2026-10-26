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

## 5. How to Reproduce

1. Open Postman and sign in (free account is fine).
2. Create a new collection named **"Task3 - JSONPlaceholder API Tests"**.
3. Create the 10 requests listed in Section 2 with the given method and URL.
4. For requests 04, 05, and 06, set **Body → raw → JSON** with the payloads shown below.
5. Add the test scripts (Section 6) to each request's **Tests** tab.
6. Click the collection name → **Run** → set the options in Section 3 → click **Run**.
7. Confirm all tests show green **Pass**.
8. Export the collection: right-click collection → **Export** → **Collection v2.1** → save as `Task3_Postman_Collection.json`.

---

