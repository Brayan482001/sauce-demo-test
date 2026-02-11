import { Page, Locator } from "@playwright/test";

export class InventoryPage {
  readonly page: Page;
  readonly cartButton: Locator;

  constructor(page: Page) {
    this.page = page;
    this.cartButton = this.page.locator('[data-test="shopping-cart-link"]');
  }

  async addProductToCart(productName: string) {
    const productButton = this.page.locator(`//div[text()="${productName}"]/ancestor::div[@class="inventory_item"]//button`);
    await productButton.click();
  }

  async goToCart() {
    await this.cartButton.click();
  }
}