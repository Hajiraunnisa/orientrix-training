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

