# Bug Reports

## Bug 1: Captcha input field is missing on the "Forgot Account Details" page

**Environment:** Web Browser (Desktop), IRCTC Website
**Severity:** High (Blocks core functionality)

**Steps to Reproduce:**
1. Open the IRCTC website (`https://www.irctc.co.in`).
2. Click on "LOGIN / REGISTER".
3. Click on the "Forgot Account Details" or "Forgot Password" link.
4. Observe the fields under the "FORGOT ACCOUNT DETAILS" heading.

**Expected Result:** 
There should be a visible text input box next to the "Captcha*" label where the user can type the characters shown in the captcha image below it.

**Actual Result:** 
The text input field for the Captcha is completely missing. Only the label "Captcha*" is visible. Because the input box is missing, the user cannot type the Captcha and is blocked from proceeding with the account recovery.

**Screenshot:**
<img width="1882" height="952" alt="Screenshot 2026-10-27 002242" src="https://github.com/user-attachments/assets/1832a992-f3eb-4d56-971a-6a7fa9f6ef20" />
