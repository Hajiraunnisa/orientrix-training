# 3 critical bugs found this week

🐛 **Bug Report 1**: API returns unexpected 200 OK for invalid passwords\
Title: ReqRes Login API accepts incorrect passwords and returns 200 instead of 401/400.

Environment: Postman v11 (Desktop), Newman v6, API Endpoint: POST https://reqres.in/api/login

Exact Steps to Reproduce:

Send a POST request to /api/login.
Set the body to JSON: {"email": "eve.holt@reqres.in", "password": "wrongpassword"}.
Observe the HTTP status code and response body.
Expected vs Actual:

Expected: The API should reject the incorrect password and return a 401 Unauthorized or 400 Bad Request.

Actual: The API returns a 200 OK and successfully generates an authentication token.

Evidence:

<img width="1073" height="892" alt="Screenshot 2026-11-08 230219" src="https://github.com/user-attachments/assets/2080928e-eef8-4b26-b62d-645ebe3d85cb" />

Severity: High

Priority: High

Reasoning: This is a critical security vulnerability; an authentication endpoint must never issue a valid session token for an incorrect password.

**Bug Report 2**: Misleading Error Message for Unregistered Users\
Title: Register/Login endpoints return vague "Only defined users succeed" error instead of 404 Not Found.

Environment: ReqRes API (POST /api/register or /api/login).

Exact Steps to Reproduce:

Send a POST request to /api/register.
Use an email address that is not in ReqRes's pre-defined whitelist (e.g., test@example.com).
Observe the response body and status code.
Expected vs Actual:

Expected: The API should return 404 Not Found (User does not exist) or 401 Unauthorized with a clear message.

Actual: The API returns 400 Bad Request with the cryptic message: {"error": "Note: Only defined users succeed registration"} .

Evidence:<img width="580" height="242" alt="Screenshot 2026-11-08 233105" src="https://github.com/user-attachments/assets/2e218a41-06eb-451c-b003-7a1709e46138" />


Severity: Low

Priority: Medium

Reasoning: The error message is developer-facing jargon that does not clearly indicate the root cause (missing user fixture); it forces testers to waste time debugging their payload instead of understanding the API's constraints.

**Bug Report 3: Unauthenticated Access Exposes Full User PII**\
Title: /users endpoint returns full names, emails, and physical addresses without any authentication or API key.

Environment: ReqRes API (GET https://reqres.in/api/users), Postman.

Exact Steps to Reproduce:

Send a GET request to https://reqres.in/api/users without any x-api-key or Authorization header.
Observe the response body.
Expected vs Actual:

Expected: The API should require authentication (a key or token) to access user data, or at least redact sensitive PII.

Actual: The API returns 200 OK with a full list of users including full names, emails, phone numbers, addresses, and GPS coordinates in a single unauthenticated call .

Evidence: <img width="1091" height="846" alt="Screenshot 2026-11-09 000433" src="https://github.com/user-attachments/assets/5a179691-9797-47bf-8758-18669d7e355c" />


Severity: Critical

Priority: High

Reasoning: In a real production system, this would be a severe GDPR violation and data breach, allowing anyone on the internet to scrape the entire user base .

# Day 5— Test Summary Report (Short)

**Tester:** HAJIRA UNNISA BEGUM
**Date:** 0811-2026
**APIs tested:** JSONPlaceholder, Restful-Booker, Reqres.in
**Tool:** Postman

---

## What I Tested and How

| API | What I tested | How |
|---|---|---|
| **JSONPlaceholder** | Basic CRUD, no auth | GET/POST/PUT/DELETE on /posts, /users |
| **Restful-Booker** | Authorization (no token, garbage token, IDOR) + multilingual data | POST /auth → token; PUT /booking/{id} with/without token; POST + GET with Telugu/Hindi/Urdu/emoji |
| **Reqres.in** | Login, token-based access, user endpoints | POST /login → token; GET /users with/without token |

---

## What Passed

| Test | API | Expected | Actual | Status |
|---|---|---|---|---|
| No token → PUT booking | Restful-Booker | 403 | 403 | ✅ |
| Garbage token → PUT booking | Restful-Booker | 403 | 403 | ✅ |
| IDOR → PUT other's booking with own token | Restful-Booker | 403 | 403 | ✅ |
| Multilingual round-trip | Restful-Booker | Identical string | Identical string | ✅ |
| Login returns token | Reqres.in | Token in response | Token received | ✅ |
| GET users with valid token | Reqres.in | 200 + user list | 200 + data | ✅ |
| CRUD operations | JSONPlaceholder | 200/201 | 200/201 | ✅ |

---

## What Failed / Was Blocked

| Issue | API | Detail |
|---|---|---|
| Intermittent 404 | Restful-Booker | API resets every ~10 min; target booking wiped before request landed. Data loss, not auth failure. |
| No rate limiting observed | Restful-Booker | Repeated 403s, no 429 or block. Risk observation, not confirmed bug. |
| No real auth to test | JSONPlaceholder | API is open by design — no login, no tokens. Cannot test authorization here. |
| Privacy checklist not executed live | — | Checklist written but no real children's exam-results app available to audit. |

---

## What I'd Test Next With More Time

1. **Vertical privilege escalation** — can a normal user reach admin endpoints? (PortSwigger Access Control labs)
2. **Method-based bypass** — if PUT is blocked, try PATCH/POST/GET on same endpoint.
3. **Token expiry** — does the Reqres.in token expire? Can an old token still access data?
4. **Unicode normalization** — send same name in NFC vs NFD form, search for it, see if API treats them as equal.
5. **Rate limiting** — send 100 requests in 60 seconds, check for 429.
6. **Run privacy checklist on a real app** — with permission, audit an actual exam-results portal.

---

## Summary

- **Restful-Booker:** all three authorization tests passed (403), multilingual round-trip passed (identical).
- **Reqres.in:** login and token-based access worked.
- **JSONPlaceholder:** CRUD worked; no auth to test.
- **Blocker:** Restful-Booker's 10-minute reset caused 404s — tests must be create → verify → act quickly.
- **Next:** PortSwigger Access Control labs + real-app privacy audit.
