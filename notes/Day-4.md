# TESTING FUNDAMENTAL
**SDLC**
1.. Requirement Gathering- The team understands what the customer needs.  
2. Planning and Feasibility-The team estimates the cost, time, resources, and technical requirements.  
3. Design-The team plans the application's structure, database, and user interface.  
4. Development (Coding)-Developers write the code to build the application.  
5. Testing-Testers check whether the application works correctly and identify bugs.  
6. Deployment-The application is released for users to access.  
7. Maintenance-The team fixes bugs, improves performance, and adds new features after release.  

BRD (Bussiness Requirement Document)- What the bussiness needs and why?   
FRD-(Functional Requirement Document) -FRD mainly explains what each feature should do and how it should behave. One feature can contain multiple functions.  
Example - Login-(feature)-->	Enter username/email,Enter password,Validate credentials,Display an error for incorrect credentials,Redirect the user to the home page after successful login....(different functions).
SRS-Software Requirement Specification- It includes the documents which contain all functional and Non Functional Requirement  
**STLC**
1.Requirement Analysis-The tester studies the requirements to understand what needs to be tested.  
2. Test Planning-The test lead decides the testing scope, resources, schedule, tools, and strategy.  
3. Test Case Development-Testers prepare test scenarios and detailed test cases with steps and expected results.  
4. Test Environment Setup-The team prepares the required hardware, software, test data, and environment.  
5. Test Execution-Testers execute test cases, compare actual results with expected results, and report defects.  
6. Test Cycle Closure-The team reviews test results, summarizes defects, checks test coverage, and prepares a test summary report.  

**TEST SCENARIO** - A test scenario describes what feature or functionality you need to test. It tells you what to check, without giving all the detailed steps.\
**TEST CASE**-A test case describes exactly how to test a particular scenario. It includes the steps, test data, expected result, and often a priority.

## Difference Between Test Scenario and Test Case
| Test Scenario | Test Case |
|---|---|
| Describes what to test. | Describes how to test. |
| High-level description. | Detailed instructions. |
| Covers a broad functionality. | Tests a specific condition or behavior. |
| One scenario can have multiple test cases. | Each test case verifies a particular condition or behavior. |

### Example
Test Scenario: Verify login functionality.
**Test Cases:**
1. Login with valid username and password.
2. Login with an incorrect password.
3. Login with an empty username.
4. Login with an empty password.

### BUG LIFECYCLE
It is the sequence of stages a bug goes through, from the time a tester identifies and reports it until it is fixed and closed.  
Bug means Abnormal Behaviour or Defect.

1.New-Tester identifies and reports a bug.

2 Assigned-The bug is assigned to a developer.

3 Open-The developer starts investigating.

4 Fixed-The developer fixes the bug.

5 Retest-The tester checks the fix.

6 Verified-The tester confirms the bug is fixed.

7 Closed -The bug is marked as completed.

What if the bug is not fixed?\
If the tester retests the feature and the same problem still occurs, the bug is typically Reopened and sent back to the developer.\

Other possible statuses include:
- Rejected: The reported issue is not accepted as a valid bug.
- Duplicate: The same bug has already been reported before.
- Deferred: The team decides to fix the bug in a future release,version. or they may feel it is not much important to fix that bug.
- Cannot Reproduce: The team cannot reproduce the reported issue.

  
# Severity vs Priority in Software Testing

## 1. What is Severity?

**Severity** describes how seriously a bug affects the functionality of an application.

It answers the question: **How badly does the bug affect the system?**

Examples:
- High Severity: The application crashes when opened.
- Medium Severity: A major feature works incorrectly, but a workaround is available.
- Low Severity: A small icon is misaligned.

## 2. What is Priority?

**Priority** describes how urgently a bug needs to be fixed.

It answers the question: **How soon should the team fix the bug?**

Examples:
- High Priority: The company's name is misspelled on the homepage before launch.
- Medium Priority: A non-critical feature needs correction in an upcoming release.
- Low Priority: A minor visual issue on a rarely visited page.

## 3. Difference Between Severity and Priority

| Severity | Priority |
|---|---|
| Measures the impact of a bug. | Measures the urgency of fixing a bug. |
| Focuses on how badly functionality is affected. | Focuses on how soon the bug should be fixed. |
| Usually assessed by the QA team with input from developers. | Often decided by the product owner, manager, or team. |
| Example: Payment functionality is completely broken. | Example: A spelling mistake in the company name needs urgent correction. |

## 4. Examples of Severity and Priority

### Example 1: High Severity, High Priority

**Bug:** Users cannot complete payments on an e-commerce website.

- Severity: High
- Priority: High
- Reason: The main business functionality is broken, affecting purchases.

### Example 2: Low Severity, High Priority

**Bug:** The company's name is misspelled on the homepage before a major launch.

- Severity: Low
- Priority: High
- Reason: The functionality works, but the visible mistake harms the company's image.

### Example 3: High Severity, Low Priority

**Bug:** A rarely used report-generation feature crashes, but the feature is scheduled to be removed soon.

- Severity: High
- Priority: Low
- Reason: The feature is seriously broken, but the team may decide that fixing it is not urgent.

### Example 4: Low Severity, Low Priority

**Bug:** A small icon is slightly misaligned on a rarely visited page.

- Severity: Low
- Priority: Low
- Reason: The issue has little functional impact and can wait.

*Note: Severity and priority depend on the application's requirements, business impact, and release plans.*

## 5. Quick Revision

- **Severity = How serious is the bug?**
- **Priority = How urgently should the bug be fixed?**
