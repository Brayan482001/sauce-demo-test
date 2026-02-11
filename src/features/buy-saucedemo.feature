Feature: Flujo de compras en SauceDemo

  @smoke @critical
  Scenario: Login exitoso y checkout completo
    Given que estoy en la página de SauceDemo
    When inicio sesión con "standard_user" y "secret_sauce"
    And agrego el producto "Sauce Labs Backpack" al carrito
    And completo el checkout con mis datos
    Then debería ver el mensaje de confirmación "Thank you for your order!"

  @negative @regression
  Scenario: Intento de login con usuario bloqueado
    Given que estoy en la página de SauceDemo
    When inicio sesión con "locked_out_user" y "secret_sauce"
    Then debería ver el mensaje de error "Epic sadface: Sorry, this user has been locked out."

  @regression
  Scenario Outline: Pruebas con múltiples perfiles de usuario
    Given que estoy en la página de SauceDemo
    When inicio sesión con "<user>" y "secret_sauce"
    Then el inicio de sesión debería ser exitoso
    Examples:
      | user                    |
      | standard_user           |
      | performance_glitch_user |
      | visual_user             |