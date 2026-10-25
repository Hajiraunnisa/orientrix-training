# API TESTING - POSTMAN

## 1. Introduction to API

### What is an API?
API stands for **Application Programming Interface**. It allows two software applications to communicate with each other.

**Example:** A shopping application requests product details from a server through an API, and the server returns the product information.

### What is Postman?
Postman is a tool used to send API requests and examine API responses without building a complete application.

**Uses of Postman:**
- Send HTTP requests.
- Test API endpoints.
- Check status codes and response data.
- Write automated API tests.
- Organize requests into collections.
- Run multiple API tests together.

---

## 2. HTTP (Hypertext Transfer Protocol)

HTTP defines how clients and servers communicate.

### How HTTP Works
1. The client sends a request.
2. The server processes the request.
3. The server sends a response.
4. The client uses the returned information.

### Components of an HTTP Request
- **Method:** Specifies the operation.
- **URL:** Specifies where the request is sent.
- **Headers:** Contain additional information.
- **Parameters:** Provide additional values to the request.
- **Body:** Contains data sent to the server.

### Components of an HTTP Response
- **Status Code:** Indicates the result of the request.
- **Headers:** Provide response metadata.
- **Body:** Contains returned data or an error message.
- **Response Time:** Indicates how long the request took.

---

## 3. HTTP Methods

| Method | Purpose | Example |
|---|---|---|
| GET | Retrieve data | Get student details |
| POST | Create or submit data | Register a student |
| PUT | Replace a resource | Replace a student's profile |
| PATCH | Update part of a resource | Update a student's email |
| DELETE | Delete a resource | Delete a student |

**Remember:**
- GET = Read
- POST = Create or submit
- PUT = Replace
- PATCH = Partially update
- DELETE = Remove

The exact behavior depends on the API documentation.

---

## 4. HTTP Status Codes

### Successful Responses

| Status Code | Meaning |
|---|---|
| 200 OK | Request succeeded |
| 201 Created | Resource created successfully |
| 202 Accepted | Request accepted for processing |
| 204 No Content | Request succeeded without a response body |

### Client Errors

| Status Code | Meaning |
|---|---|
| 400 Bad Request | Request is invalid |
| 401 Unauthorized | Authentication is missing or invalid |
| 403 Forbidden | Access is denied |
| 404 Not Found | Resource or endpoint was not found |
| 409 Conflict | Request conflicts with the current state |
| 415 Unsupported Media Type | Unsupported request format |
| 422 Unprocessable Content | Request data failed validation |
| 429 Too Many Requests | Rate limit exceeded |

### Server Errors

| Status Code | Meaning |
|---|---|
| 500 Internal Server Error | Unexpected server error |
| 502 Bad Gateway | Invalid response from an upstream server |
| 503 Service Unavailable | Service temporarily unavailable |
| 504 Gateway Timeout | Upstream server did not respond in time |

**Important:** A status code alone does not prove that an API test passed. The response must also meet the expected requirements.

---

## 5. Sending Your First Request in Postman

Example API:

`https://jsonplaceholder.typicode.com/users/1`

Steps:
1. Open Postman.
2. Create a new HTTP request.
3. Select the GET method.
4. Enter the URL.
5. Click **Send**.
6. Check the status code.
7. Inspect the response body and response time.

The API should return information about user ID 1.

---

## 6. Collections

A collection is a group of related API requests saved together.List of Multiple Requests Connected to same API.

Example: A Student API collection might contain:
- Get all students.
- Get a student by ID.
- Create a student.
- Update a student.
- Delete a student.

### Benefits of Collections
- Organize requests.
- Reuse saved requests.
- Run multiple requests together.
- Share requests with team members.

---

## 7. Variables in Postman

Variables store values that can be reused.Instead of Typing base address repeatedly, you can store it in variable and make use of it in multiple requests.

Example:

`{{baseUrl}}/users/1`

If `baseUrl` contains:

`https://jsonplaceholder.typicode.com`

Postman substitutes the variable when sending the request.

### Common Variable Scopes
- **Global Variables:** Available broadly across the workspace.
- **Collection Variables:** Available within a collection.
- **Environment Variables:** Used for different environments, such as testing and production.
- **Local and Data Variables:** Used in specific execution contexts.

### Why Use Variables?
- Avoid repeating URLs and IDs.
- Make requests reusable.
- Switch between environments easily.

**Security note:** Never commit real passwords, API tokens, or secrets to a public GitHub repository.

---

## 8. Query Parameters

Query parameters provide additional information to an API request.It filter or control the results returned by an API.

Example:

`https://example.com/products?category=books&limit=10`

Here:
- `category=books` filters products by category.
- `limit=10` requests up to ten results.

Query parameters appear after `?` in a URL. Multiple parameters are separated by `&`.

### How to Add Query Parameters
1. Open the request in Postman.
2. Select the **Params** tab.
3. Enter the parameter key.
4. Enter the parameter value.
5. Send the request.

### Query Parameter Test Cases
- Valid parameter value.
- Missing optional parameter.
- Invalid parameter value.
- Boundary values.
- Multiple parameters together.
- Special characters and URL encoding.

---

## 9. Path Variables

Path variables identify a specific resource.

Examples:

- `/users/1`
- `/users/2`
- `/orders/ABC123`

Here, `1`, `2`, and `ABC123` identify particular resources.

### Difference Between Path Variables and Query Parameters

| Path Variable | Query Parameter |
|---|---|
| Identifies a resource | Filters or customizes a request |
| Example: `/users/1` | Example: `/users?role=student` |

### Path Variable Test Cases
- Valid ID.
- Nonexistent ID.
- Invalid ID format.
- Missing required path value.
- Access to an unauthorized resource.

---

## 10. POST Requests

POST is commonly used to create a resource or submit data.

Example JSON request body:

```json
{
  "name": "Hajira",
  "course": "M.Tech"
}
```

### Steps to Send a POST Request
1. Select POST.
2. Enter the API endpoint.
3. Open the **Body** tab.
4. Select **raw** and choose JSON if required.
5. Enter the JSON data.
6. Add required headers and authentication.
7. Click **Send**.
8. Verify the status code and response body.

### What Should a Tester Check?
- Correct status code.
- Required fields are returned.
- Returned values are correct.
- Invalid data is handled properly.
- Duplicate data is handled according to requirements.

---

## 11. Authentication and Authorization

### Authentication
Authentication verifies the identity of a user or application.

**Question:** Who are you?

### Authorization
Authorization determines what an authenticated user is allowed to access.

**Question:** What are you allowed to do?

### Common Authentication Methods
- API Key
- Bearer Token
- Basic Authentication
- OAuth 2.0

### Authentication Test Cases
- Valid credentials.
- Missing credentials.
- Invalid token.
- Expired token.
- Insufficient permissions.
- Incorrect authentication format.

Always use the authentication method documented by the API.

---

## 12. JSON

JSON stands for **JavaScript Object Notation**. It is a common format for exchanging structured data.

Example:

```json
{
  "id": 1,
  "name": "Asha",
  "active": true,
  "skills": ["SQL", "API Testing"],
  "address": {
    "city": "Hyderabad"
  }
}
```

### JSON Rules
- Objects use `{}`.
- Arrays use `[]`.
- Property names and string values use double quotes.
- Values can be strings, numbers, booleans, null, objects, or arrays.
- Comments and trailing commas are not allowed in standard JSON.

### What Should a Tester Check?
- Response contains valid JSON.
- Required fields exist.
- Values are correct.
- Data types are correct.
- Nested objects and arrays are structured correctly.

---

## 13. Random Test Data

Random or generated data helps test an API with different inputs.

Examples:
- Different names.
- Unique email addresses.
- Different IDs.
- Valid and invalid values.
- Minimum and maximum allowed values.

### Benefits
- Finds input-related bugs.
- Reduces dependence on fixed test data.
- Helps test boundary conditions.
- Improves test coverage.

Use safe, synthetic test data instead of real personal information.

---

## 14. PATCH Requests

PATCH updates part of an existing resource.

Example JSON body:

```json
{
  "status": "shipped"
}
```

This could update only the status of an order if the API supports that operation.

### PATCH Testing Checklist
- Correct resource is updated.
- Only intended fields change.
- Other fields remain unchanged.
- Invalid updates are rejected.
- Missing or nonexistent resources are handled correctly.

---

## 15. DELETE Requests

DELETE is used to remove a resource.

Example:

`DELETE /orders/123`

### DELETE Testing Checklist
- Correct resource is deleted.
- Expected status code is returned.
- Response body matches the API contract.
- Deleted resource is no longer available, if verification is supported.
- Unauthorized deletion is prevented.

**Important:** Use test data and authorized environments. Deletion may be irreversible.

---

# Part 2: API Test Automation

## 16. What Is API Test Automation?

API test automation uses scripts to verify API behavior automatically.

### Benefits
- Saves time.
- Reduces repetitive manual work.
- Provides consistent results.
- Helps detect regressions.
- Supports CI/CD pipelines.

Automation checks only the conditions that have been programmed.

---

## 17. Writing Automated Tests in Postman

Postman supports JavaScript-based tests.

Example:

```javascript
// Check that the API returned HTTP 200.
pm.test("Status code is 200", function () {
    pm.response.to.have.status(200);
});

// Check that the JSON response contains an ID.
pm.test("Response contains an ID", function () {
    const body = pm.response.json();

    pm.expect(body).to.have.property("id");
});
```

### Explanation
- `pm.test()` defines a test with a readable name.
- `pm.response` provides access to the response.
- `pm.response.to.have.status(200)` checks the status code.
- `pm.response.json()` parses the JSON response body.
- `pm.expect()` checks whether an expected condition is true.
- A failed assertion causes the test to fail.

---
## 18. More Postman Test Examples
When we send a request in Postman, we should not only check whether it succeeded. We should also verify whether the response contains the correct data.
### Test 1: Check the Status Code

```javascript
// Verify that the API returned HTTP 200.
pm.test("Status code is 200", function () {
    pm.response.to.have.status(200);
});
```

### Test 2: Check a Response Field

```javascript
// Parse the response as JSON.
const body = pm.response.json();

// Verify that the response contains the name field.
pm.test("Name field exists", function () {
    pm.expect(body).to.have.property("name");
});
```

### Test 3: Check the Data Type

```javascript
// Parse the response as JSON.
const body = pm.response.json();

// Verify that the name field contains a string.
pm.test("Name is a string", function () {
    pm.expect(body.name).to.be.a("string");
});
```

### Test 4: Check Response Time

```javascript
// Verify that the response arrives within 2 seconds.
// This is an example threshold; use project requirements.
pm.test("Response time is below 2000 ms", function () {
    pm.expect(pm.response.responseTime).to.be.below(2000);
});
```

### Test 5: Check a Non-Empty Name

```javascript
// Parse the response body.
const body = pm.response.json();

// Verify that the name exists and is not empty.
pm.test("Name is not empty", function () {
    pm.expect(body.name).to.be.a("string").and.not.empty;
});
```

---

## 19. Types of API Tests

### Status Code Testing
- Check successful responses.
- Check validation errors.
- Check unauthorized requests.
- Check nonexistent resources.

### Response Body Testing
- Verify required fields.
- Check data types.
- Verify expected values.
- Check arrays and nested objects.
- Verify error messages.

### Header Testing
- Check Content-Type.
- Verify required headers.
- Check relevant security headers when required.

---

## 20. Extracting Data from a Response

Sometimes one API request returns an ID needed by another request.

Example response:

```json
{
  "id": 123,
  "name": "Asha"
}
```

You can save the returned ID in a collection variable.

```javascript
// Parse the JSON response.
const body = pm.response.json();

// Save the returned ID for later requests.
pm.collectionVariables.set("userId", body.id);
```

Use the variable in another request:

`{{baseUrl}}/users/{{userId}}`

### Why Is This Useful?
- Avoids hard-coded IDs.
- Makes requests reusable.
- Supports automated workflows.
- Allows one request to use data returned by another.

Always verify that the expected value exists before using it in later requests.

---

## 21. Request Chaining

Request chaining means using data from one API request in another request.

Example workflow:

1. Create a user.
2. Extract the returned user ID.
3. Retrieve the user using that ID.
4. Update the user's details.
5. Verify the update.
6. Delete the user if appropriate.

This helps test a complete API workflow.

**Note:** Some public demo APIs simulate write operations without permanently saving changes. Check the API's behavior before expecting a later GET request to show the update.

---

## 22. Collection Runner

The Collection Runner executes multiple requests in a collection.

### Steps
1. Create a collection.
2. Add API requests.
3. Write tests for each request.
4. Select the collection.
5. Choose the correct environment.
6. Configure iterations or test data if needed.
7. Run the collection.
8. Review passed and failed tests.
9. Investigate failures.

### Benefits
- Runs multiple tests together.
- Saves time.
- Supports regression testing.
- Makes repeated test execution easier.

Requests normally run in their listed order, so requests that depend on earlier results must be organized correctly.

---

## 23. Postman Monitors

Postman Monitors can run collections on a schedule and report whether requests and tests pass.

### Uses
- Check API availability regularly.
- Detect failures between manual test sessions.
- Monitor important API workflows.
- Review scheduled test results.

### Best Practices
- Use the correct environment.
- Protect API credentials.
- Avoid destructive requests against production.
- Consider API rate limits.
- Check the availability of monitoring features in your Postman plan.

---

## 24. Newman

Newman is a command-line collection runner for Postman.

It allows API collections to run from a terminal or automated pipeline.

### Basic Workflow
1. Export a Postman collection.
2. Install Node.js if required.
3. Install Newman according to its documentation.
4. Run the collection from the command line.
5. Review the results.

Example command:

```bash
# Run an exported Postman collection.
newman run my-collection.json
```

### Benefits
- Runs collections outside the Postman interface.
- Supports repeatable automated testing.
- Can be integrated with CI/CD.
- Provides a command-line test summary.

Keep credentials out of committed collection and environment files.

---

## 25. HTML Test Reports

Test reports help testers and developers understand the results of an API test run.

Reports may include:
- Total requests executed.
- Passed tests.
- Failed tests.
- Error details.
- Overall execution results.

Newman supports reporting options, and some report formats require additional reporters. Check the documentation for the installed version.

---

## 26. CI/CD

CI/CD stands for **Continuous Integration and Continuous Delivery/Deployment**.

### Continuous Integration (CI)
Code changes are integrated regularly, and automated checks help identify problems early.

### Continuous Delivery
Code is kept ready for release after required tests and approvals.

### Continuous Deployment
Changes that pass the pipeline may be deployed automatically.

### Example API Testing Pipeline
1. A developer pushes code.
2. The CI system starts a pipeline.
3. The application or test environment is prepared.
4. API tests run using Postman/Newman.
5. Test results are recorded.
6. Failures are investigated and may block the next stage.

Automated tests improve confidence but do not prove that an application has no bugs.

---

# API Testing Checklist for QA Engineers

## Before Sending a Request
- [ ] Correct HTTP method.
- [ ] Correct URL and endpoint.
- [ ] Correct path variables.
- [ ] Correct query parameters.
- [ ] Required headers are included.
- [ ] Authentication is configured.
- [ ] Request body is valid.
- [ ] Test data is appropriate.

## After Sending a Request
- [ ] Status code matches expectations.
- [ ] Response body contains required fields.
- [ ] Values and data types are correct.
- [ ] Error handling is correct.
- [ ] Response time meets requirements.
- [ ] Unauthorized access is prevented.
- [ ] No sensitive data is exposed.
- [ ] Automated tests pass for the right reasons.

## Before Running a Collection
- [ ] Requests have clear names.
- [ ] Variables are configured correctly.
- [ ] Requests run in the correct order.
- [ ] Test data is safe and repeatable.
- [ ] Secrets are not committed.
- [ ] Failed tests are investigated.
- [ ] The collection can be exported and reused.

---

# Common Beginner Confusions

| Concept | Explanation |
|---|---|
| API vs Postman | API is the interface; Postman is the testing tool. |
| HTTP vs API | HTTP is a communication protocol; an API defines how software interacts. |
| Status code vs test result | Status code describes the response; test result shows whether expectations passed. |
| Authentication vs authorization | Authentication verifies identity; authorization checks permissions. |
| PUT vs PATCH | PUT commonly replaces a resource; PATCH updates selected parts. |
| Manual vs automated testing | Manual testing is performed by the tester; automated testing uses scripts. |
| Collection vs environment | Collection stores requests; environment stores configuration values. |
| Request vs response | Request is sent to the server; response is returned by the server. |

---

# Glossary

| Term | Meaning |
|---|---|
| API | Application Programming Interface |
| HTTP | Hypertext Transfer Protocol |
| Endpoint | A location where an API operation is available |
| Request | Message sent to an API |
| Response | Message returned by an API |
| Header | Metadata associated with a request or response |
| Body | Main data sent or returned |
| Query Parameter | Value used to filter or customize a request |
| Path Variable | Value identifying a resource in a URL |
| JSON | JavaScript Object Notation |
| Token | Value used for authentication or authorization |
| Assertion | A check that verifies an expected condition |
| Collection | Group of saved API requests |
| Environment | Set of configuration variables |
| Regression Testing | Rechecking existing functionality after changes |
| Newman | Command-line runner for Postman collections |
| CI/CD | Automated software integration and delivery process |

---

# Practice Task for My QA Internship

Create a Postman collection named **Student API Tests**.

Use a public demo API such as JSONPlaceholder and add at least 10 requests or checks.

Suggested requests:

1. Get all users and verify the response status.
2. Get user ID 1 and verify the returned ID.
3. Request a nonexistent user and check the documented behavior.
4. Get all posts and verify the response is an array.
5. Get one post and verify required fields.
6. Filter posts by user ID and check the returned data.
7. Send a POST request with sample data and verify the response.
8. Test invalid input using an API that supports input validation.
9. Check the Content-Type header when JSON is expected.
10. Add a response-time test with a reasonable threshold.

Export the collection as JSON and save it in the internship repository.

**Important:** JSONPlaceholder simulates some write operations. A successful POST, PUT, PATCH, or DELETE does not necessarily mean the change was permanently saved.

---

# Final Revision

Remember the API testing workflow:

**Choose method → Enter URL → Add parameters, headers, and body → Send request → Inspect response → Compare with expected result → Write automated tests → Run collection → Review failures.**

These are the core concepts of API testing with Postman.
