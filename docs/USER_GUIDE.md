# 📱 Guía de Usuario - Tienda Móvil

## 📋 Tabla de Contenidos
- [Introducción](#-introducción)
- [Primeros Pasos](#-primeros-pasos)  
- [Pantallas de la Aplicación](#-pantallas-de-la-aplicación)
- [Flujos de Trabajo](#-flujos-de-trabajo)
- [Consejos y Trucos](#-consejos-y-trucos)
- [Solución de Problemas](#-solución-de-problemas)
- [Preguntas Frecuentes](#-preguntas-frecuentes)

## 🎯 Introducción

**Tienda Móvil** es una aplicación intuitiva diseñada para ayudar a pequeños comerciantes a gestionar su inventario de productos de manera eficiente y profesional.

### ✨ ¿Qué puedes hacer con Tienda Móvil?

- 🔐 **Autenticarte** de forma segura en la aplicación
- ➕ **Registrar productos** con información detallada
- 📋 **Ver y gestionar** tu inventario completo
- 👤 **Administrar tu perfil** personal
- 🧭 **Navegar fácilmente** entre diferentes secciones

## 🚀 Primeros Pasos

### 1. 📲 Instalación

La aplicación está disponible para múltiples plataformas:

- **Android**: Descargar APK o desde Google Play Store
- **iOS**: Descargar desde App Store  
- **Web**: Acceder desde tu navegador
- **Desktop**: Versión para Windows, macOS y Linux

### 2. 🔑 Primer Acceso

Al abrir la aplicación por primera vez, verás la **pantalla de Login**:

```
┌─────────────────────────┐
│        LOGIN            │
│                         │
│ Email: ________________ │
│                         │
│ Password: _____________ │
│                         │
│      [  LOGIN  ]        │
└─────────────────────────┘
```

> **Nota**: En esta versión, puedes usar cualquier email y contraseña para acceder. La validación real se implementará en futuras versiones.

## 📱 Pantallas de la Aplicación

### 🔐 1. Pantalla de Login

**Propósito**: Punto de entrada seguro a la aplicación.

#### 📝 Campos Disponibles:
| Campo | Descripción | Ejemplo |
|-------|-------------|---------|
| **Email** | Tu dirección de correo | usuario@ejemplo.com |
| **Password** | Tu contraseña segura | ••••••••• |

#### 🎯 Acciones:
- **LOGIN**: Ingresar a la aplicación
- **Validación visual**: Los campos se destacan al enfocar

#### 💡 Tips:
- Asegúrate de tener conexión a internet
- Los datos no se validan actualmente (versión demo)

---

### 🏠 2. Tab Bar Principal (`main_tab_scaffold.dart`)

**Propósito**: Navegación central con `CupertinoTabBar` persistente en la parte inferior.

```
┌─────────────────────────┐
│   (contenido del tab)   │
│                         │
│                         │
│                         │
├─────────────────────────┤
│  🏠   📦   👤   ⚙️    │
│ Home Prod Perfil Ajustes│
└─────────────────────────┘
```

#### 🎯 Tabs Disponibles:

| # | Tab | Ícono | Pantalla | Descripción |
|---|-----|-------|----------|-------------|
| 0 | **Inicio** | 🏠 `house_fill` | HomeScreen | Resumen y métricas |
| 1 | **Buscar** | 🔍 `search` | SearchScreen | Búsqueda con filtros por categoría |
| 2 | **Productos** | 📦 `cube_box_fill` | ProductListScreen | Lista de inventario |
| 3 | **Carrito** | 🛒 `cart_fill` | CartScreen | Carrito de compras |
| 4 | **Avisos** | 🔔 `bell_fill` | NotificationsScreen | Notificaciones agrupadas |
| 5 | **Perfil** | 👤 `person_fill` | ProfileScreen | Tu perfil personal |
| 6 | **Ajustes** | ⚙️ `settings_solid` | SettingsScreen | Configuraciones |

#### 💡 Tips:
- El tab bar es persistente y siempre visible
- Cada tab mantiene su propio historial de navegación independiente

---

### 🔍 3. Búsqueda (`search_screen.dart`)

**Propósito**: Encontrar productos rápidamente con filtros por categoría.

#### 🎯 Elementos:
- **`CupertinoSearchTextField`**: barra de búsqueda con ícono lupa y botón para limpiar
- **Filtros horizontales**: chips scrollables (Todos, Electrónicos, Ropa, Alimentos, Hogar, Juguetes)
- **Búsquedas recientes**: historial con botón para eliminar cada entrada
- **Categorías populares**: lista con conteo de productos por categoría

#### 💡 Tips:
- Toca un filtro para seleccionar la categoría (se resalta en azul)
- Toca la X de una búsqueda reciente para eliminarla
- Toca una categoría para ver sus productos

---

### 🛒 4. Carrito (`cart_screen.dart`)

**Propósito**: Revisar y gestionar los productos antes de pagar.

#### 🎯 Elementos:
- **Lista de items**: imagen placeholder, nombre, precio y controles de cantidad
- **Controles +/−**: botones `CupertinoButton` con íconos `minus_circle` / `plus_circle_fill`
- **Resumen de precio**: subtotal, envío (gratis) y total en footer fijo
- **Botón "Vaciar"**: texto rojo en la navigation bar
- **Botón "Proceder al pago"**: `CupertinoButton.filled` ancho completo

#### 💡 Tips:
- Usa los botones + y − para ajustar cantidades
- El total se actualiza al modificar cantidades (cuando se implemente la lógica)

---

### 🔔 5. Notificaciones (`notifications_screen.dart`)

**Propósito**: Ver alertas y avisos agrupados por fecha.

#### 🎯 Grupos:
| Sección | Ejemplos de notificaciones |
|---------|---------------------------|
| **HOY** | Pedido confirmado, Stock bajo, Nueva valoración |
| **AYER** | Promoción activa, Nuevo cliente |
| **ESTA SEMANA** | Reporte semanal, Producto sin stock |

#### 💡 Tips:
- Las notificaciones no leídas muestran un punto azul a la derecha
- Toca "Leer todo" para marcarlas todas como leídas (cuando se implemente)

---

### 🏷️ 6. Detalle de Producto (`product_detail_screen.dart`)

**Propósito**: Ver toda la información de un producto antes de comprarlo.

#### 🎯 Secciones:
- **Imagen**: área placeholder de 280px lista para mostrar fotos reales
- **Categoría**: chip con fondo azul translúcido
- **Nombre y precio**: precio destacado en `systemBlue`
- **Badge de stock**: etiqueta verde "En stock: N"
- **Descripción**: texto con interlineado 1.5
- **Info adicional**: `CupertinoListSection` con categoría, stock y código SKU
- **Botón "Agregar al carrito"**: ancho completo con ícono `cart_badge_plus`

**Acceso**: Se abre desde la lista de productos con `CupertinoPageRoute` (desliza hacia atrás para volver).

---

### ➕ 7. Registro de Productos

**Propósito**: Añadir nuevos productos a tu inventario con información completa.

#### 📋 Formulario Completo (5 Campos):

```
┌─────────────────────────────────┐
│     REGISTRO DE PRODUCTOS       │
│                                 │
│ Nombre del producto:            │
│ _____________________________ │
│                                 │  
│ Precio:                         │
│ _____________________________ │
│                                 │
│ Descripción:                    │
│ _____________________________ │
│ _____________________________ │
│ _____________________________ │
│                                 │
│ Categoría:                      │
│ _____________________________ │
│                                 │
│ Stock:                          │
│ _____________________________ │
│                                 │
│        [ GUARDAR ]              │
└─────────────────────────────────┘
```

#### 📝 Detalle de Campos:

| # | Campo | Tipo | Obligatorio | Descripción | Ejemplo |
|---|-------|------|-------------|-------------|---------|
| 1️⃣ | **Nombre del producto** | Texto | ✅ | Nombre identificativo | "iPhone 13 Pro" |
| 2️⃣ | **Precio** | Numérico | ✅ | Precio en moneda local | "1299.99" |
| 3️⃣ | **Descripción** | Texto multilínea | ❌ | Descripción detallada | "Smartphone última generación..." |
| 4️⃣ | **Categoría** | Texto | ✅ | Clasificación | "Electrónicos" |
| 5️⃣ | **Stock** | Numérico | ✅ | Cantidad disponible | "25" |

#### 🎯 Funcionalidades:
- **Auto-scroll**: La pantalla se ajusta automáticamente
- **Validación de tipos**: Campos numéricos solo aceptan números
- **Limpieza automática**: Los campos se limpian tras guardar
- **Feedback visual**: Confirmación al guardar producto

#### 💡 Tips de Uso:
- Completa todos los campos obligatorios
- Usa descripciones claras para mejor organización
- El stock te ayudará a controlar el inventario

---

### 📋 8. Lista de Productos

**Propósito**: Visualizar y gestionar todo tu inventario de productos.

#### 🎨 Diseño de la Lista:

```
┌─────────────────────────────────┐
│            Items                │
│                                 │
│ ┌─────────────────────────────┐ │
│ │ Producto 1        $25.99    │ │
│ │ Descripción del producto 1  │ │  
│ │ Categoría: Categoría A      │ │
│ └─────────────────────────────┘ │
│                                 │
│ ┌─────────────────────────────┐ │
│ │ Producto 2        $45.50    │ │
│ │ Descripción del producto 2  │ │
│ │ Categoría: Categoría B      │ │
│ └─────────────────────────────┘ │
│                                 │
│                            [+]  │
└─────────────────────────────────┘
```

#### 📊 Información Mostrada:

| Elemento | Descripción |
|----------|-------------|
| **Nombre** | Título del producto en **negrita** |
| **Precio** | Valor en color azul destacado |
| **Descripción** | Texto descriptivo en gris |
| **Categoría** | Clasificación en texto pequeño |

#### 🎯 Interacciones:
- **Tocar producto**: Ver detalles (muestra mensaje)
- **Botón flotante (+)**: Ir a registro de producto
- **Scroll**: Navegar por lista larga
- **Botón Atrás**: Volver al menú

#### 💡 Tips:
- Los productos se organizan por orden de registro
- Usa el botón + para añadir productos rápidamente
- La lista es infinita - añade tantos productos como necesites

---

### 👤 9. Perfil de Usuario

**Propósito**: Gestionar tu información personal y datos de cuenta.

#### 👨‍💼 Estructura del Perfil:

```
┌─────────────────────────────────┐
│          🙂                     │
│                                 │
│        Mi Perfil                │
│                                 │
│ Nombre:                         │
│ _____________________________ │
│                                 │
│ Apellidos:                      │
│ _____________________________ │
│                                 │
│ Fecha de nacimiento:            │
│ _____________________________ │📅│
│                                 │
│    [ GUARDAR CAMBIOS ]          │
│                                 │
│ ┌─────────────────────────────┐ │
│ │ Información de la cuenta    │ │
│ │ Email: usuario@ejemplo.com  │ │
│ │ Miembro desde: Enero 2024   │ │
│ │ Productos registrados: 12   │ │
│ └─────────────────────────────┘ │
└─────────────────────────────────┘
```

#### 📝 Campos Editables:

| Campo | Tipo | Funcionalidad |
|-------|------|---------------|
| **Nombre** | Texto libre | Editable directamente |
| **Apellidos** | Texto libre | Editable directamente |
| **Fecha de nacimiento** | Selector | Abre calendario interactivo |

#### 🗃️ Información de Solo Lectura:

| Campo | Descripción |
|-------|-------------|
| **Email** | Tu dirección de correo registrada |
| **Miembro desde** | Fecha de registro en la app |
| **Productos registrados** | Contador de productos activos |

#### 📅 Selector de Fecha (CupertinoDatePicker):
- **Rango**: Desde 1900 hasta hoy
- **Formato**: DD/MM/AAAA
- **Interacción**: Toca el campo para abrir un modal estilo iOS con rueda (spinner) de fechas

#### 💡 Tips:
- Los cambios se guardan localmente
- El avatar es un placeholder (personalización futura)
- La información de cuenta se actualizará automáticamente

## 🧩 Widgets y APIs usados por las vistas
- **Navigator**: Rutas nombradas con `Navigator.pushNamed` y `Navigator.pushReplacementNamed` (ej. [lib/screens/login_screen.dart](lib/screens/login_screen.dart), [lib/screens/menu_screen.dart](lib/screens/menu_screen.dart)).
- **ListView.builder**: Listas dinámicas y renderizado eficiente (ej. [lib/screens/product_list_screen.dart](lib/screens/product_list_screen.dart)).
- **TextField & TextEditingController**: Campos de entrada con `obscureText`, `readOnly`, `keyboardType` y `maxLines` (varios screens como [lib/screens/login_screen.dart](lib/screens/login_screen.dart) y [lib/screens/register_product_screen.dart](lib/screens/register_product_screen.dart)).
- **Botones**: `CupertinoButton.filled` para acciones primarias y `CupertinoButton` en navigation bar para añadir productos.
- **Layouts y contenedores**: `CupertinoPageScaffold`, `CupertinoNavigationBar`, `SafeArea`, `Padding`, `Column`, `Row`, `Expanded`, `SizedBox`.
- **Interacciones**: `GestureDetector` para respuestas táctiles nativas.
- **Feedback**: `showCupertinoDialog` + `CupertinoAlertDialog` para notificaciones al usuario.
- **Selector de fecha**: `showCupertinoModalPopup` + `CupertinoDatePicker` para elegir fechas ([lib/screens/profile_screen.dart](lib/screens/profile_screen.dart)).
- **Íconos**: `CupertinoIcons` para iconografía nativa iOS (`person_fill`, `calendar`, `add`, etc.).
- **Estilos**: Uso de `Text`, `TextStyle` y `BoxDecoration` para presentación consistente.
- **Buenas prácticas**: Liberar `TextEditingController` en `dispose()` para evitar fugas de memoria.

## 🔄 Flujos de Trabajo

### 📈 Flujo Principal: Registro de Producto

```mermaid
flowchart TD
    A[🔐 Login] --> B[🏠 Menú]
    B --> C[➕ Registrar Producto]
    C --> D[📝 Llenar Formulario]
    D --> E{¿Datos Completos?}
    E -->|Sí| F[💾 Guardar]
    E -->|No| D
    F --> G[✅ Confirmación]
    G --> H[🔄 Limpiar Campos]
    H --> I{¿Otro Producto?}
    I -->|Sí| D
    I -->|No| B
```

### 📊 Flujo Secundario: Consulta de Inventario

```mermaid
flowchart TD
    A[🏠 Menú] --> B[📋 Lista Productos]
    B --> C[👀 Ver Productos]
    C --> D{¿Añadir Producto?}
    D -->|Sí| E[➕ Botón Flotante]
    D -->|No| F[🔙 Volver]
    E --> G[📝 Formulario]
    F --> A
    G --> B
```

### 👤 Flujo de Gestión de Perfil

```mermaid
flowchart TD
    A[🏠 Menú] --> B[👤 Profile]
    B --> C[✏️ Editar Datos]
    C --> D[📅 Fecha Nacimiento?]
    D -->|Sí| E[📅 Abrir Calendar]
    D -->|No| F[💾 Guardar Cambios]
    E --> F
    F --> G[✅ Confirmación]
    G --> H[🔙 Volver]
    H --> A
```

## 💡 Consejos y Trucos

### 🚀 Productividad

#### Para Registro Rápido:
1. **Prepara la información**: Ten todos los datos del producto listos
2. **Usa el teclado numérico**: Para campos de precio y stock
3. **Aprovecha la descripción**: Añade detalles que te ayuden después
4. **Categorías consistentes**: Usa las mismas categorías para facilitar organización

#### Para Gestión de Lista:
1. **Revisa regularmente**: Mantén tu inventario actualizado  
2. **Usa el botón +**: Acceso rápido desde la lista
3. **Toca para detalles**: Cada producto muestra información al tocar

#### Para Perfil:
1. **Actualiza datos**: Mantén tu información personal al día
2. **Usa el calendario**: Más fácil que escribir fechas manualmente
3. **Revisa estadísticas**: El contador de productos te ayuda a hacer seguimiento

### 🎨 Personalización

#### Navegación Eficiente:
- **Botón Atrás**: Siempre disponible en pantallas internas
- **Menú Central**: Tu hub para todas las funciones
- **Logout Seguro**: Cambia de usuario fácilmente

## 🔧 Solución de Problemas

### ❗ Problemas Comunes

#### 1. La app no inicia
**Soluciones:**
- Verifica que tengas Flutter instalado correctamente
- Ejecuta `flutter doctor` para revisar configuración
- Reinicia el dispositivo/emulador

#### 2. Los campos no responden
**Soluciones:**
- Toca directamente sobre el área de texto
- Verifica que el teclado esté configurado correctamente
- Reinicia la aplicación

#### 3. La navegación no funciona
**Soluciones:**
- Asegúrate de tocar completamente los botones
- Espera a que las animaciones terminen
- Verifica la conexión si hay problemas de rendimiento

#### 4. Los datos no se guardan
**Soluciones:**
- Completa todos los campos obligatorios
- Toca específicamente el botón "GUARDAR"
- Espera la confirmación visual antes de navegar

### 🔄 Reinicios y Limpieza

#### Para limpiar datos temporales:
1. Cierra completamente la aplicación
2. Reinicia la app
3. Vuelve a hacer login

#### Para reportar problemas:
- Documenta los pasos que causaron el problema
- Toma capturas de pantalla si es posible
- Contacta al equipo de desarrollo

## ❓ Preguntas Frecuentes

### 🔐 Seguridad y Acceso

**P: ¿Necesito crear una cuenta?**  
R: En la versión actual (1.0.0), puedes usar cualquier email y contraseña. La creación de cuentas reales se implementará en la versión 1.1.0.

**P: ¿Mis datos están seguros?**  
R: Actualmente los datos se almacenan localmente. En futuras versiones implementaremos encriptación y almacenamiento en la nube seguro.

**P: ¿Puedo usar la app sin internet?**  
R: Sí, la app funciona completamente offline en la versión actual.

### 📱 Funcionalidades

**P: ¿Cuántos productos puedo registrar?**  
R: No hay límite actual. La aplicación maneja dinámicamente cualquier cantidad de productos.

**P: ¿Puedo editar productos después de crearlos?**  
R: La edición de productos se implementará en la versión 1.1.0. Actualmente solo puedes visualizarlos.

**P: ¿Puedo añadir imágenes a los productos?**  
R: Las imágenes de productos están planificadas para la versión 1.2.0.

**P: ¿Hay búsqueda y filtros?**  
R: La funcionalidad de búsqueda y filtros se añadirá en la versión 1.2.0.

### 🔄 Actualizaciones

**P: ¿Cómo me entero de nuevas versiones?**  
R: Las notificaciones de actualización se implementarán en futuras versiones.

**P: ¿Perderé mis datos al actualizar?**  
R: Implementaremos migración automática de datos para garantizar que no pierdas información.

### 📞 Soporte

**P: ¿Dónde puedo obtener ayuda adicional?**  
R: Puedes contactar al equipo de desarrollo a través de:
- **Email**: soporte@tiendamovil.com  
- **GitHub**: [Repositorio del proyecto](https://github.com/tuusuario/tiendamovil)
- **Documentación**: Revisa los archivos en `/docs`

---

<div align="center">

### 🎉 ¡Listo para comenzar!

**Tienda Móvil te ayuda a gestionar tu inventario de manera profesional y eficiente.**

*¿Necesitas ayuda adicional? Consulta nuestra [documentación técnica](ARCHITECTURE.md) o [guía de instalación](../README.md).*

</div>