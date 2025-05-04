# Smart Contracts en Solidity

Este repositorio contiene tres módulos desarrollados en Solidity que ilustran conceptos fundamentales y avanzados del desarrollo de contratos inteligentes. Cada carpeta aborda una temática diferente, progresando desde lo básico hasta aplicaciones más complejas como la integración con Chainlink.

---

## 📁 1. SimpleStorage

Este contrato es una introducción básica a Solidity. Cubre:

- Tipos de datos primitivos (`bool`, `uint`, `int`, `address`, `bytes`)
- Estructuras (`struct`)
- Arreglos dinámicos
- Mappings (`mapping`)
- Modificadores `view` y `pure`
- Variables `memory`, `storage` y `calldata`
- Funciones públicas para almacenar y recuperar datos
- Comentarios explicativos para cada sección del código

Este módulo es ideal para principiantes que deseen entender los fundamentos del lenguaje.

---

## 📁 2. StorageFactory

Este módulo amplía los conceptos del módulo anterior y presenta:

- **Herencia y modularidad**: Uso de `import` y herencia entre contratos
- **Override de funciones**: Reescritura de funciones con `override` y uso de `virtual`
- **Creación dinámica de contratos**: Despliegue de instancias de `SimpleStorage` desde un contrato `StorageFactory`
- **Gestión de múltiples contratos**: Lógica para almacenar y acceder a múltiples contratos desplegados dinámicamente

Contratos incluidos:
- `SimpleStorage.sol` (versión con `virtual`)
- `StorageFactory.sol`
- `AddFiveStorage.sol` (hereda de `SimpleStorage` y modifica su lógica)

Este módulo es útil para comprender cómo construir aplicaciones más modulares en Solidity.

---

## 📁 3. FundMe

Este es un contrato más avanzado, que simula una plataforma de financiamiento con conversión de ETH a USD usando Chainlink. Incluye:

- **Uso de bibliotecas (`library`)**: `PriceConverter` calcula el valor de ETH en USD usando Chainlink
- **Integración con oráculos de precios (Chainlink)**
- **Modificadores personalizados** (`onlyOwner`)
- **Palabras clave `constant` e `immutable`** para eficiencia de gas
- **Manejo de ETH directamente**: funciones `receive()` y `fallback()`
- **Retiro de fondos mediante `call()`**
- **Mensajes de error personalizados (`error`)** para ahorrar gas

Requiere acceso a la interfaz de Chainlink para el contrato de precios ETH/USD.

Este módulo representa una dApp básica de financiamiento descentralizado.

---

## 🔧 Requisitos

- Solidity ^0.8.18
- Hardhat o Remix para pruebas
- Para el módulo 3 (FundMe), se requiere acceso a Chainlink y una red compatible (como Sepolia)

---

## 📜 Licencia

Este proyecto está bajo la licencia [MIT](https://opensource.org/licenses/MIT).

---

## 📫 Contacto

Para dudas o sugerencias, abre un issue o contacta al autor del repositorio directamente.

