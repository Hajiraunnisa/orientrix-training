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

# Codegen
Playwright Codegen is a tool that automatically generates test code while we interact with a website.   
**npx playwright codegen**
This command opens 2 window - browser window and playwright inspector. what ever you click on browser window,play wright inspector records it automatically.
**npx playwright codegen https://www.google.com**   
This command opens the codegen browser with particular website.   
**npx playwright codegen --browser chromium https://google.com**   
This command opens the codegen with chromium browser only.   
You dont need to copy paste the generated testcript manually, you simple write - **npx playwright codegen -o tests/login.spec.js https://example.com** 
or **npx playwright codegen --traget=javascript -output tests/demo.spec.js** 
generated script may need some manual intervention,like writing  **test("function name,** async...
Set viewport - screen resolution (size)  **npx playwright codegen --viewport-size=800,600**
Emulate devices  **npx playwright codegen --device="iPhone 11"**
you can also emulate color scheme   
npx playwright codegen --color-scheme=dark

# Traceviewer
A tool that trace the executed tests like timestamp,screenshot,action(before,after),network or enivironment details.
<img width="1562" height="926" alt="image" src="https://github.com/user-attachments/assets/5fcf1b3e-330b-4e61-9ea0-60639a58cb21" />

different Trace viewer Options-   
'on-first-retry'  - Record a trace only when retrying a test for the first time.   
'off'       - Do not record a trace.   
'on'       - Record a trace for each test. (not recommended as it's performance heavy)   
'retain-on-failure' - Record a trace for each test, but remove it from successful test runs   
if you want to apply any one of the above,go to config file and change trace value.   
To set trace on from command   npx playwright test --trace on

Different ways to view trace-   
Using command - npx playwright show-trace trace.zip   
Using HTML Report   
Using utility - https://trace.playwright.dev/ (go to this link and upload .zip file)   

I learned how to generate trace files programmatically using Playwright.

Instead of depending only on the configuration file, I used Playwright's tracing API to manually start and stop trace recording.

1. Starting the Trace

await context.tracing.start({
    screenshots: true,
    snapshots: true
});

context.tracing.start() – Starts recording the browser session.

screenshots: true – Captures screenshots during test execution.

snapshots: true – Captures DOM snapshots of the webpage.

2. Stopping the Trace

await context.tracing.stop({
    path: testInfo.outputPath('trace.zip')
});

context.tracing.stop() – Stops the trace recording.

path – Specifies where the trace file should be saved.

testInfo.outputPath() – Generates a test-specific output location.

3. Using beforeEach()

test.beforeEach(async ({ context }) => {
    await context.tracing.start({
        screenshots: true,
        snapshots: true
    });
});

beforeEach() runs before every test case. I used it to start trace recording automatically before each test.

4. Using afterEach()

test.afterEach(async ({ context }, testInfo) => {
    await context.tracing.stop({
        path: testInfo.outputPath('trace.zip')
    });
});

afterEach() runs after every test case. I used it to stop recording and save the trace file.

5. Tests Performed

I practised tracing with the following test cases:

Checking the Playwright website title.

Clicking the Get Started link.

Verifying the Installation heading.

Checking website navigation and page title.
# Web Objects
Selectors and Locators are used to identify elements on a webpage, such as buttons, text boxes, links, images and dropdowns.A selector is a way of identifying an HTML element on a webpage.example- button,id,class,name.... Selectors are used to create Locators.just to find selector we use locator.   
To find an object or element we use the syntax  page.locator(selector[, options])\
Locator is a class in Playwright library.
<img width="1867" height="837" alt="image" src="https://github.com/user-attachments/assets/805a88cc-6d19-49d3-9690-e30868995d89" />

You can locate selector using 
- ID selector (#username)
- Class selector (.login-btn)
- CSS selector
- XPath
- getByRole()
- getByText()
- getByLabel()
- getByPlaceholder()

# Assertions
Assertions are used to verify whether something on a website is working as expected.
# Playwright – Assertions
- Whether a button is visible.
- Whether login is successful.
- Whether the page title is correct.
- Whether the entered data is correct.
- Whether an element is enabled or disabled.

In Playwright, we use `expect()` to perform assertions.

## 2. Types of Playwright Assertions

### A. Visibility Assertions

| Assertion | Meaning |
|---|---|
| `toBeVisible()` | Checks whether an element is visible on the webpage. |
| `toBeHidden()` | Checks whether an element is hidden or does not exist. |

### B. Enabled / Disabled Assertions

| Assertion | Meaning |
|---|---|
| `toBeEnabled()` | Checks whether an element is enabled and usable. |
| `toBeDisabled()` | Checks whether an element is disabled. |

### C. Text Assertions

| Assertion | Meaning |
|---|---|
| `toHaveText()` | Checks whether an element has the expected text. |
| `toContainText()` | Checks whether an element contains specific text. |

### D. Input Assertions

| Assertion | Meaning |
|---|---|
| `toHaveValue()` | Checks the value inside an input field. |
| `toBeChecked()` | Checks whether a checkbox or radio button is selected. |

### E. Attribute and Count Assertions

| Assertion | Meaning |
|---|---|
| `toHaveAttribute()` | Checks an HTML attribute of an element. |
| `toHaveCount()` | Checks the number of matching elements. |

### F. Page Assertions

| Assertion | Meaning |
|---|---|
| `toHaveTitle()` | Checks the webpage title. |
| `toHaveURL()` | Checks the current webpage URL. |

### G. Other Useful Assertions

| Assertion | Meaning |
|---|---|
| `toBeFocused()` | Checks whether an element is focused. |
| `toBeEmpty()` | Checks whether an element is empty. |
| `toBeEditable()` | Checks whether an element can be edited. |

## 3. Normal Assertion vs Soft Assertion

### Normal Assertion – `expect()`

- Checks whether a condition is correct.
- If it fails, the test stops at that point.
- Remaining test steps will not execute.

### Soft Assertion – `expect.soft()`

- Checks whether a condition is correct.
- If it fails, the test continues executing.
- Failed assertions are reported at the end of the test.

Example:
```javascript
await expect.soft(page).toHaveTitle('Swag Labs');
```

## 4. Practical Example – SauceDemo

Website: https://www.saucedemo.com/

```javascript
import { test, expect } from '@playwright/test';

test('SauceDemo Assertion Practice', async ({ page }) => {

    // Open SauceDemo website
    await page.goto('https://www.saucedemo.com/');

    // 1. Check page title
    await expect(page).toHaveTitle('Swag Labs');

    // 2. Check username field visibility
    await expect(page.locator('#user-name')).toBeVisible();

    // 3. Check password field visibility
    await expect(page.locator('#password')).toBeVisible();

    // 4. Check login button is enabled
    await expect(page.locator('#login-button')).toBeEnabled();

    // Enter login credentials
    await page.locator('#user-name').fill('standard_user');
    await page.locator('#password').fill('secret_sauce');

    // Click login button
    await page.locator('#login-button').click();

    // 5. Check URL after login
    await expect(page).toHaveURL(/inventory/);

    // 6. Check Products heading
    await expect(page.locator('.title')).toHaveText('Products');

    // 7. Check total number of products
    await expect(page.locator('.inventory_item')).toHaveCount(6);

    // 8. Check product price is visible
    await expect(page.locator('.inventory_item_price').first()).toBeVisible();

    // 9. Add first product to cart
    await page.locator('#add-to-cart-sauce-labs-backpack').click();

    // 10. Check cart badge displays 1
    await expect(page.locator('.shopping_cart_badge')).toHaveText('1');

    // 11. Check Remove button is visible
    await expect(page.locator('#remove-sauce-labs-backpack')).toBeVisible();

});
```

## 5. Important Commands to Remember

```javascript
// Visibility
await expect(locator).toBeVisible();
await expect(locator).toBeHidden();

// Enabled / Disabled
await expect(locator).toBeEnabled();
await expect(locator).toBeDisabled();

// Text
await expect(locator).toHaveText('Products');
await expect(locator).toContainText('Product');

// Input value
await expect(locator).toHaveValue('standard_user');

// Checkbox
await expect(locator).toBeChecked();

// Attribute and count
await expect(locator).toHaveAttribute('type', 'text');
await expect(locator).toHaveCount(6);

// Page
await expect(page).toHaveTitle('Swag Labs');
await expect(page).toHaveURL(/inventory/);

// Soft assertion
await expect.soft(locator).toBeVisible();
```
## Slow motion and video recording
Slow motion is used to slow down Playwright browser actions so that we can clearly see each action being performed.

Normally, Playwright executes actions very fast. Using slowMo, we can watch the actions slowly.   
just go to playwright.cofig and modify use   
use: {   
    slowMo: 1000   
}   
now when you run each comand it will be in slow motion and also video will be recorded
# Hooks and Groups
Hooks are special functions used to perform actions before or after test cases.

test.beforeAll()	Executes once before all tests in a file.\
test.afterAll()	Executes once after all tests in a file.\
test.beforeEach()	Executes before every test.\
test.afterEach()	Executes after every test.\
import { test, expect } from '@playwright/test';

// Runs once before all tests
test.beforeAll(async () => {
    console.log('Starting test execution');
});

// Runs before every test
test.beforeEach(async ({ page }) => {
    // Open SauceDemo before each test
    await page.goto('https://www.saucedemo.com/');
});

// First test case
test('Check website title', async ({ page }) => {
    await expect(page).toHaveTitle('Swag Labs');
});

// Second test case
test('Check login button', async ({ page }) => {
    await expect(page.locator('#login-button')).toBeVisible();
});

// Runs after every test
test.afterEach(async () => {
    console.log('Test completed');
});

// Runs once after all tests
test.afterAll(async () => {
    console.log('All tests completed');
});

Grouping tests means organizing related test cases into one group using test.describe().  
test.describe('Login Tests', () => {
    // All login-related tests go here
});

# Annotations and Tags
Annotations tell Playwright how to handle a test, such as skip it, mark it as expected to fail, or give it more time.   
Tags help us categorize and filter tests, such as Smoke Tests or Regression Tests.   
## Playwright – Annotations

| Command | Purpose |
|---|---|
| `test.only()` | Run only selected tests. |
| `test.skip()` | Skip a test. |
| `test.skip(condition)` | Skip a test when a condition is true. |
| `test.fail()` | Mark a test as expected to fail. |
| `test.fixme()` | Mark a test as needing a fix; do not run it. |
| `test.slow()` | Give the test 3 times the default timeout. |

--grep @smoke is a command used to run tests that match a particular name or tag.   
--grep-invert @smoke does the opposite of --grep.(it excludes all the test with the specified tag)
@smoke, @regression, and @hellogirl are all just labels. Playwright doesn't assign any special meaning to their names. you can give your own tag and use that when executing.
