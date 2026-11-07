# 🚀 Day 3: Automated API Tests with Postman & GitHub Actions

This repository contains an automated API test suite for the ReqRes API, built as part of the Day 3 task. The tests are designed to run automatically in the cloud using **GitHub Actions** and **(Postman's CLI tool)** .

## Repository Structure
*   `collection.json`: The exported Postman Collection containing the API request and test scripts.
*   `data.csv`: A CSV file with 20 different data combinations used for data-driven testing.
*   `api-tests.yml`: The GitHub Actions workflow file that triggers the Newman test run on every push.

##  Features Implemented

### 1. Data-Driven Testing
The test suite uses the `data.csv` file to feed 20 different combinations of emails and passwords into a single `POST /api/login` request. The Collection Runner iterates through each row, dynamically updating the variables and asserting the expected status codes.

### 2. Schema Validation
Instead of checking individual fields, the test script uses `pm.response.to.have.jsonSchema` to validate the entire structure of the response. 
*   Successful responses (`200`) are validated to ensure they contain a string `token`.
*   Error responses (`400`) are validated to ensure they contain a string `error`.

### 3. Continuous Integration (CI)
A GitHub Actions workflow is configured to run on every `push` to this repository. It installs Node.js and Newman, then executes the Postman collection against the CSV data file. A `500ms` delay is applied between requests to respect the ReqRes API's rate limits.
