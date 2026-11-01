# SauceDemo – Playwright Automation Testing

Automated testing of the SauceDemo website using Playwright and JavaScript.

**Website:** https://www.saucedemo.com/

## Test Scenarios

1. Successful login with valid credentials.
2. Login failure with an incorrect password.
3. Adding a product to the shopping cart.
4. Completing the checkout flow.
5. Logging out successfully.

## Tools and Technologies

- JavaScript
- Playwright
- Node.js
- Visual Studio Code

## Installation and Setup

### 1. Install Dependencies

```bash
npm install
```

### 2. Install Playwright Browsers

```bash
npx playwright install
```

## Running Tests

### 1. Run all tests

```bash
npx playwright test
```

### 2. Run SauceDemo test file

```bash
npx playwright test tests/automatedscript.spec.js
```

### 3. Run tests in Chromium

```bash
npx playwright test tests/automatedscript.spec.js --project=chromium
```

### 4. Run tests in Headed Mode

```bash
npx playwright test tests/automatedscript.spec.js --project=chromium --headed
```

### 5. Run tests in Debug Mode

```bash
npx playwright test tests/automatedscript.spec.js --project=chromium --debug
```

### 6. View HTML Test Report

```bash
npx playwright show-report
```

## Expected Results

All five test scenarios should execute successfully.

The HTML report displays the execution results, including passed and failed tests.
