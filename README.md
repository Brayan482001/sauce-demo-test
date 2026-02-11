# 🎭 SauceDemo E2E Automation Project

![Playwright](https://img.shields.io/badge/Playwright-31C653?style=for-the-badge&logo=Playwright&logoColor=white)
![Cucumber](https://img.shields.io/badge/Cucumber-23D96C?style=for-the-badge&logo=cucumber&logoColor=white)
![TypeScript](https://img.shields.io/badge/TypeScript-007ACC?style=for-the-badge&logo=typescript&logoColor=white)

Proyecto de automatización de pruebas de extremo a extremo (E2E) para la plataforma **SauceDemo**, diseñado para demostrar habilidades en arquitectura de software, calidad de código y manejo de evidencia.

---
## 🛠️ Instalación Paso a Paso

1.  **Clonar el repositorio:**
    ```bash
    git clone (https://github.com/Brayan482001/sauce-demo-test.git)
    cd sauce-demo-test
    ```

2.  **Instalar dependencias de Node.js:**
    ```bash
    npm install
    ```

3.  **Instalar navegadores de Playwright:**
    ```bash
    npx playwright install
    ```

---

## 🚀 Ejecución de Pruebas

### 1. Ejecutar la suite completa
Corre todos los escenarios definidos en el proyecto:
```bash
npm test
```
### 2. Ejecutar solo el Happy Path (@smoke)
```bash
npx cucumber-js --tags "@smoke"
```
---
## 📊 Reportes y Evidencia de Calidad

### Cómo abrir el reporte HTML
Tras cada ejecución, se genera un reporte visual en la raíz:

1. Navega a la carpeta `reports/`.
2. Abre el archivo `cucumber-report.html` en tu navegador preferido.

---
## 🏗️ Estructura del Proyecto

El framework utiliza el patrón de diseño **Page Object Model (POM)** para separar la lógica de negocio de la infraestructura técnica:

* **`src/features/`**: Definición de escenarios en lenguaje Gherkin (Garantiza legibilidad para stakeholders).
* **`src/step-definitions/`**: "Glue code" que conecta Gherkin con TypeScript.
* **`src/pages/`**: Objetos de página con locators robustos (`data-test`) y métodos de acción.
* **`src/utils/`**: Configuración de `CustomWorld` para manejo de contextos y `Hooks` para gestión de evidencia.
* **`reports/`**: Directorio para la salida de artefactos (Screenshots, Videos y Reportes HTML).
