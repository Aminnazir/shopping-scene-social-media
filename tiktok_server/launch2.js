const { chromium } = require('playwright');

(async () => {
    const browser = await chromium.launch({ headless: true });  // Ensure headless mode is enabled
    const page = await browser.newPage();
    await page.goto('https://shoppingscene.pk');
    await page.screenshot({ path: 'example3.png' });
    await browser.close();
})();
