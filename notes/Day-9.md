# Automated Test Script for saucedemo.com
```javascript

import { test, expect } from '@playwright/test';

// SauceDemo login details
const URL = 'https://www.saucedemo.com/';
const USERNAME = 'standard_user';
const PASSWORD = 'secret_sauce';

// Reusable login function
async function login(page) {
    await page.locator('#user-name').fill(USERNAME);
    await page.locator('#password').fill(PASSWORD);
    await page.locator('#login-button').click();
}
// await page.pause() // Pause execution to inspect the browser state


test.describe('SauceDemo Automation Tests', () => {

    // Open SauceDemo before every test
    test.beforeEach(async ({ page }) => {
        await page.pause()
        await page.goto(URL);
    });

    // TEST 1: Successful Login
    test('Successful login with valid credentials', async ({ page }) => {

        // Enter valid username and password
        await login(page);

        // Verify successful login
        await expect(page).toHaveURL(/inventory.html/);

        // Verify Products heading
        await expect(page.locator('.title')).toHaveText('Products');
    });

    // TEST 2: Login Failure with Incorrect Password
    test('Login failure with incorrect password', async ({ page }) => {

        // Enter valid username
        await page.locator('#user-name').fill(USERNAME);

        // Enter incorrect password
        await page.locator('#password').fill('wrong123');

        // Click login button
        await page.locator('#login-button').click();

        // Verify error message is visible
        const errorMessage = page.locator('[data-test="error"]');
        await expect(errorMessage).toBeVisible();

        // Verify error message text
        await expect(errorMessage).toContainText(
            'Username and password do not match'
        );
    });

    // TEST 3: Adding a Product to the Cart
    test('Add a product to the shopping cart', async ({ page }) => {

        // Login to SauceDemo
        await login(page);

        // Add Sauce Labs Backpack to cart
        await page.locator('#add-to-cart-sauce-labs-backpack').click();

        // Verify cart badge displays 1
        await expect(page.locator('.shopping_cart_badge')).toHaveText('1');

        // Verify Remove button is visible
        await expect(
            page.locator('#remove-sauce-labs-backpack')
        ).toBeVisible();
    });

    // TEST 4: Completing the Checkout Flow
    test('Complete the checkout process', async ({ page }) => {

        // Login to SauceDemo
        await login(page);

        // Add a product to cart
        await page.locator('#add-to-cart-sauce-labs-backpack').click();

        // Open shopping cart
        await page.locator('.shopping_cart_link').click();

        // Verify cart page
        await expect(page).toHaveURL(/cart.html/);

        // Click checkout
        await page.locator('#checkout').click();

        // Enter customer details
        await page.locator('#first-name').fill('Hajira');
        await page.locator('#last-name').fill('Begum');
        await page.locator('#postal-code').fill('500001');

        // Continue to order overview
        await page.locator('#continue').click();

        // Verify selected product
        await expect(page.locator('.inventory_item_name'))
            .toHaveText('Sauce Labs Backpack');

        // Finish the checkout
        await page.locator('#finish').click();

        // Verify order confirmation
        await expect(page.locator('.complete-header'))
            .toHaveText('Thank you for your order!');
    });

    // TEST 5: Logging Out
    test('Logout successfully', async ({ page }) => {

        // Login first
        await login(page);

        // Open side menu
        await page.locator('#react-burger-menu-btn').click();

        // Click logout
        await page.locator('#logout_sidebar_link').click();

        // Verify login button is visible
        await expect(page.locator('#login-button')).toBeVisible();

        // Verify redirection to login page
        await expect(page).toHaveURL(URL);
    });

});
```
