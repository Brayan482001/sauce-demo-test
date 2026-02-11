import { Given, When, Then } from "@cucumber/cucumber";
import { CustomWorld } from "../utils/world";
import { expect } from "@playwright/test";
import { LoginPage } from '../pages/login-page'
import { InventoryPage } from "../pages/inventory-page";
import { CartPage } from "../pages/cart-page";
import { CheckoutPage } from "../pages/checkout-page";

Given('que estoy en la página de SauceDemo', async function (this: CustomWorld) {
    const loginPage = new LoginPage(this.page!);
    await loginPage.navigate();
});

When('inicio sesión con {string} y {string}', async function (this: CustomWorld, user: string, pass: string) {
    const loginPage = new LoginPage(this.page!);
    await loginPage.login(user, pass);
});

When('agrego el producto {string} al carrito', async function (this: CustomWorld, productName: string) {
  const inventoryPage = new InventoryPage(this.page!);
  await inventoryPage.addProductToCart(productName);
});

Then('debería ver el mensaje de error {string}', async function (this: CustomWorld, expectedError: string) {
  const loginPage = new LoginPage(this.page!);
  await expect(loginPage.errorMessage).toHaveText(expectedError);
});

Then('el inicio de sesión debería ser exitoso', async function (this: CustomWorld) {
  await expect(this.page!).toHaveURL(/inventory.html/);
});

When('completo el checkout con mis datos', async function (this: CustomWorld) {
  const inventoryPage = new InventoryPage(this.page!);
  const cartPage = new CartPage(this.page!)
  const checkoutPage = new CheckoutPage(this.page!);
  
  await inventoryPage.goToCart();

  await cartPage.goToCheckout();
  
  await checkoutPage.fillInformation("Pedro", "Paez", "11106");
  await checkoutPage.finishOrder();
});

Then('debería ver el mensaje de confirmación {string}', async function (this: CustomWorld, message: string) {
  const checkoutPage = new CheckoutPage(this.page!);
  await expect(checkoutPage.completeHeader).toHaveText(message);
});