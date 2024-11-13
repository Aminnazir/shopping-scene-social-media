const { firefox } = require('playwright');

(async () => {
    const browser = await firefox.launch({ headless: true });  // Ensure headless mode is enabled
    const page = await browser.newPage();
    await page.goto('https://google.com');
    await page.screenshot({ path: 'exampledd.png' });
    await browser.close();
})();
