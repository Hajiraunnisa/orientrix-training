# Day 4 — Think Like an Attacker (Safely)

Practice API: [Restful-Booker](https://restful-booker.herokuapp.com)
Tool used: Postman only

---

## 1. Authorization Testing

### Setup

1. **Get a valid token**
   - `POST https://restful-booker.herokuapp.com/auth`
   - Body:
     ```json
     { "username": "admin", "password": "password123" }
     
    <img width="832" height="677" alt="Screenshot 2026-11-08 010249" src="https://github.com/user-attachments/assets/e46fa014-5014-4987-b6e8-6a16f0e98fce" />
    

   The response contain token. i copied it and saved in notes!

2. **Create a booking to target**

POST https://restful-booker.herokuapp.com/booking

Body:

json
{
  "firstname": "Test",
  "lastname": "User",
  "totalprice": 100,
  "depositpaid": true,
  "bookingdates": { "checkin": "2026-01-01", "checkout": "2026-01-05" }
}

<img width="790" height="880" alt="Screenshot 2026-11-08 010259" src="https://github.com/user-attachments/assets/9556b5fd-033f-4d88-a255-7d6310439fa1" />

Copy the returned bookingid.

Test 1 — No Token
PUT https://restful-booker.herokuapp.com/booking/{id}

No Cookie / Authorization header.

Body: modified booking JSON (e.g. firstname: "Hacked").

<img width="756" height="617" alt="Screenshot 2026-11-08 010234" src="https://github.com/user-attachments/assets/59f31414-7f44-41d7-8f72-945182baacea" />


Observed: 403 Forbidden ✅

Why 403 and not 401: the server understands the request but refuses the action because no credential was supplied for a protected operation. Restful-Booker uses 403 for missing auth on modification endpoints.

Test 2 — Garbage / Expired Token
Same PUT URL.

Header: Cookie: token=thisIsAGarbageToken123

<img width="853" height="632" alt="Screenshot 2026-11-08 010714" src="https://github.com/user-attachments/assets/745276b9-a6aa-4502-ae75-6e88398bcac9" />

Observed: 403 Forbidden ✅

Why: the token cannot be validated, so the server denies the action. It does not leak whether the token is malformed vs expired.

Test 3 — IDOR (Core Test)
List current bookings: GET https://restful-booker.herokuapp.com/booking

Pick an ID that is not yours.

PUT https://restful-booker.herokuapp.com/booking/1

Header: Cookie: token={your valid token}

<img width="722" height="662" alt="Screenshot 2026-11-08 012907" src="https://github.com/user-attachments/assets/6fc37add-cfd5-4dff-ad30-344045d26637" />

Observed: 403 Forbidden ✅

Why this matters: this is the IDOR check. You are authenticated (valid token) but not authorized for that resource. A correct API returns 403. If it had returned 200 and actually changed the data, that would be a real IDOR vulnerability — private data leaking because the server only checks "is there a token" and not "does this token own this record."

he 401 vs 403 distinction you should write down: 401 means "I don't know who you are — give me credentials." 403 means "I know who you are, but you still can't do this" . A 404 would mean the booking simply doesn't exist (which happens on Restful-Booker because it resets every ~10 minutes and other users can delete your data) . A 404 is data loss, not an authorization result.

IDOR happens when an app lets you access a record by changing an ID in the request, without checking whether you are allowed to access that record . Your test proved Restful-Booker does check — it returned 403 instead of letting you edit someone else's booking.

**2. Multilingual Data Testing**
Request
POST https://restful-booker.herokuapp.com/booking

Header: Content-Type: application/json; charset=utf-8

Body:
{
"firstname": "తెలుగు नमस्ते اردو 😀 ",
"lastname": "TestUser",
"totalprice": 150,
"depositpaid": true,
"bookingdates": { "checkin": "2026-12-01", "checkout": "2026-12-05" }
}
(two trailing spaces after the emoji)

<img width="850" height="888" alt="Screenshot 2026-11-08 011700" src="https://github.com/user-attachments/assets/62460b49-ab3e-444f-8661-e416f0a246b6" />

Copied returned bookingid.

Immediately GET /booking/2867.

<img width="828" height="861" alt="Screenshot 2026-11-08 011812" src="https://github.com/user-attachments/assets/732eba7b-ae32-433d-bafd-d31e1d2fbc87" />

Result
Sent: తెలుగు नमस्ते اردو 😀 (with two trailing spaces)

Received: తెలుగు नमस्ते اردو 😀 (with two trailing spaces)

Identical: Yes — all three scripts, the emoji, and both trailing spaces survived intact.

Conclusion: the API preserved UTF-8 content correctly through create-and-read. No garbling, no emoji corruption, no whitespace stripping.
Even when two strings look identical on screen, they can be different sequences of code points. Unicode allows the same visible character to be represented in more than one way — for example, a single composed character versus a base character followed by a combining accent mark. Telugu and Hindi vowel signs, and emoji with skin-tone modifiers, are common cases.

If an application compares raw code points without normalizing first (to a standard form such as NFC or NFD), two visually identical names can fail an equality check — causing login mismatches, duplicate-detection failures, or search misses. A byte-identical round-trip through an API (as observed here) does not prove that a downstream system will treat those strings as equal without normalization.

Unicode normalization: the same visible character can be stored in more than one way inside a computer (for example, "é" as one piece vs "e" + accent mark). They look identical but the computer counts them as different, so exact comparison fails. Normalization converts everything to one standard form so matching works. My test showed the API returns the exact same data it received — but that doesn't prove the school's database will match visually identical names without normalization.

 ## 3. Privacy Test Checklist — Children's Exam Results

### Data Minimization

- [ ] The app collects only what is needed to show a result — student name, exam ID, score, and a necessary identifier. No home address, parent phone number, photo, or location unless legally required.
- [ ] Multilingual names are stored and compared correctly (see Day 4, Bullet 2) so children are not misidentified or given someone else's result.

### Access Control (IDOR Defense)

- [ ] A student can view **only their own** results using their own login/token. Changing the ID in the request to another student's ID must return **403**, not the other student's marks.
- [ ] A parent/guardian can view only their own child's results; guessing another child's ID does not work.
- [ ] Teacher and admin accounts are scoped to their assigned classes/students only — not the whole school.
- [ ] No result is accessible without login (no public URLs, no "anyone with the link" pages).

### User Rights and Transparency

- [ ] Parents/guardians can view, correct, and request deletion of their child's data.
- [ ] The privacy notice is written in plain language a child or parent can understand.
- [ ] There is a way to report a privacy problem (contact email or in-app form).

### Logging and Monitoring

- [ ] Every access to a child's result is logged (who viewed it, when).
- [ ] Repeated failed attempts to access other students' results trigger an alert or temporary block (rate limiting).
