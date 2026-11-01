# Exam Results Application — Risk Scenarios & Test Plan


## 1. Incorrect Marks or Grades

**Problem:** The application displays incorrect marks, total scores, percentages or grades.

**Testing:** Enter known marks for different subjects and compare the displayed total, percentage and grade with manually calculated expected results. Also test boundary values — minimum marks, maximum marks, zero, and decimal values — to verify rounding is correct.

---

## 2. Showing Results to the Wrong Student

**Problem:** One student can view another student's exam results. This is a serious privacy and security issue.

**Testing:** Log in using two different student accounts and verify that each student can access only their own results. Also try accessing another student's result by modifying the URL or student ID. Confirm the server blocks the request, not just the screen.

---

## 3. Missing or Incomplete Results

**Problem:** Some subject marks or the entire result may be missing even when the examination has been completed.

**Testing:** Check whether all subjects and marks are displayed. Compare the application results with the approved database records. Simulate a slow or failed data response and verify the application shows a clear error instead of an incomplete total.

---

## 4. Incorrect Pass/Fail Status

**Problem:** A student who passes may be marked as failed, or a student who fails may be marked as passed.

**Testing:** Test students with marks above, below and exactly at the passing threshold. Verify that the application calculates the pass/fail status according to the examination rules, including subjects with separate passing criteria.

---

## 5. Application Crashes or Becomes Slow

**Problem:** Many students may try to access their results at the same time, causing the application to become slow or unavailable.

**Testing:** Perform load testing by simulating multiple students accessing their results simultaneously. Verify that the application responds correctly without crashing, losing data or displaying incorrect results.

---

## 6. Results Shown Before Official Release

**Problem:** Results become visible before the official release date, causing confusion or leaking information early.

**Testing:** Before the release date, try opening the results page directly using the URL. Verify the application blocks access and shows a "not available yet" message. Check that the release time works correctly across different timezones.

---

## 7. No Record of Changes to Results

**Problem:** Marks can be changed without any record of who changed them, making disputes impossible to resolve.

**Testing:** Try to send an "edit marks" request as a student — it must be blocked. Verify that every change made by an admin is logged with who changed it, what was changed and when.

---
