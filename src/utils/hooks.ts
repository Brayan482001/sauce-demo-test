import { Before, After, Status } from "@cucumber/cucumber";
import { chromium, Browser } from "@playwright/test";
import { CustomWorld } from "./world";

let browser: Browser;

Before(async function (this: CustomWorld) {
  browser = await chromium.launch({ headless: false });

  this.context = await browser.newContext({
    recordVideo: { dir: "reports/videos/" }
  });
  this.page = await this.context.newPage();
});

After(async function (this: CustomWorld, scenario) {
  if (scenario.result?.status === Status.FAILED) {

    const cleanName = scenario.pickle.name.replace(/[^a-z0-9]/gi, '_').toLowerCase();
    const image = await this.page?.screenshot({ 
      path: `reports/screenshots/${cleanName}.png`, 
      fullPage: true 
    });
    if (image) this.attach(image, "image/png");
  }

  await this.page?.close();
  await this.context?.close();
  await browser.close();
});