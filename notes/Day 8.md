# PLAYWRIGHT

Playwright is a tool that automates a browser to test a website.\
**Main Features-**
Free – Costs nothing\
Made by Microsoft – Reliable and well-maintained\
Works on all browsers – Chrome, Firefox, Safari with same code\
Many languages – JavaScript, Python, Java, .NET\
Auto-waits – Waits for things to load before clicking, so tests don't break randomly\
Runs everywhere – Windows, Mac, Linux\
Comes with test runner – Built-in tool to run tests fast (in parallel)\
Codegen (recorder) – Watches you use a site and writes the test code for you\
Trace Viewer – Shows step-by-step what happened when a test ran, to find problems\
Mobile testing – Pretends to be a phone to test mobile sites\
Network control – Can watch or fake network requests\
Screenshots/videos – Records what happened during tests\
## Running Tests in Playwright

Playwright provides different commands to run tests. These commands help us run all tests, run a specific test file, select a browser, and debug failed tests.

### 1. Run All Tests

```bash
npx playwright test
```

- Runs all test files in the project.
- By default, tests run in headless mode, meaning the browser window is not visible.
- Runs tests on the browser projects configured in `playwright.config.js`.

### 2. Run Tests Using Multiple Workers

```bash
npx playwright test --workers 3
```

- Runs tests using 3 workers in parallel.
- Multiple workers can execute tests at the same time.
- This can reduce the total execution time.

### 3. Run a Specific Test File

```bash
npx playwright test one.spec.js
```

- Runs tests only from the specified file.
- Useful when we want to test one file instead of running the entire project.

### 4. Run Multiple Test Files

```bash
npx playwright test one.spec.js two.spec.js
```

- Runs tests from both specified files.
- Useful when we want to test selected files together.

### 5. Run Test Files Using Part of Their Names

```bash
npx playwright test one two
```

- Runs test files whose paths match the provided filters.
- Useful when we remember only part of a file name.
- If multiple file paths match, tests from multiple files may run.

### 6. Run a Test by Its Title

```bash
npx playwright test -g "check title"
```

- The `-g` option means `--grep`.
- Runs tests whose titles match the given text or regular expression.
- Useful when we want to execute one particular test without running every test in the file.

**Example:**

```javascript
test('check title', async ({ page }) => {
  // Test code goes here
});
```

### 7. Run Tests on a Specific Browser

```bash
npx playwright test --project=chromium
```

- Runs tests using the Chromium browser project.
- The project must be configured in `playwright.config.js`.
- Other configured projects may include `firefox` and `webkit`.

### 8. Run Tests in Headed Mode

```bash
npx playwright test --headed
```

- Opens a visible browser window while tests run.
- Useful for watching how Playwright interacts with a website.
- Helpful for beginners who want to understand test execution.

### 9. Debug Tests

```bash
npx playwright test --debug
```

- Opens Playwright's debugging tools.
- Allows us to execute tests step by step.
- Helps us inspect page elements and understand why a test is failing.

### 10. Debug a Specific Test File

```bash
npx playwright test example.spec.js --debug
```

- Runs the specified test file in debug mode.
- Useful when we want to investigate an error in one file.

### 11. Debug Starting from a Specific Line

```bash
npx playwright test example.spec.js:21 --debug
```

- Targets the test associated with line 21 in the specified file.
- Useful when we want to debug a particular test without running unrelated tests.
- The line should correspond to a test declaration or a location Playwright can use to identify a test.

---
Test() enables us write test. and expect() enables us write assertions.
