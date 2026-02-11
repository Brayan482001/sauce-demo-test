
import { setWorldConstructor, World, IWorldOptions, setDefaultTimeout } from "@cucumber/cucumber";
import { BrowserContext, Page } from "@playwright/test";

// Configuración de timeout global
setDefaultTimeout(30000);

export class CustomWorld extends World {
  context?: BrowserContext;
  page?: Page;

  constructor(options: IWorldOptions) {
    super(options);
  }
}

setWorldConstructor(CustomWorld);