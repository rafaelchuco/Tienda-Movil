# 🛍️ Tienda Móvil - Aplicación Flutter

<div align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter">
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart">
  <img src="https://img.shields.io/badge/Version-1.0.0-green?style=for-the-badge" alt="Version">
  <img src="https://img.shields.io/badge/Status-En%20Desarrollo-yellow?style=for-the-badge" alt="Status">
</div>

## 📋 Tabla de Contenidos
- [Descripción](#-descripción)
  - [Objetivo](#-objetivo)
  - [Usuario Actual](#-usuario-actual)
- [Características](#-características)
- [Arquitectura](#-arquitectura)
- [Estructura del Proyecto](#-estructura-del-proyecto)
- [Instalación y Configuración](#-instalación-y-configuración)
- [Ejecución](#-ejecución)
- [Pantallas y Funcionalidades](#-pantallas-y-funcionalidades)
- [Flujo de Navegación](#-flujo-de-navegación)
- [Casos de Uso](#-casos-de-uso)
- [Tecnologías](#-tecnologías)
- [Datos de Prueba](#-datos-de-prueba)
- [Roadmap](#-roadmap)
- [Contribución](#-contribución)
- [Licencia](#-licencia)

## 📱 Descripción

**Tienda Móvil** es una aplicación Flutter moderna y elegante diseñada para la gestión de productos y usuarios. La aplicación cuenta con un sistema de navegación intuitivo que permite a los usuarios registrar productos, visualizar inventarios y gestionar su perfil personal.

### 🎯 Objetivo
Crear una plataforma móvil eficiente para pequeños comercios que necesiten gestionar su inventario de productos de manera sencilla y profesional.

### 👤 Usuario Actual

| Dato | Valor |
|------|-------|
| **Nombre Completo** | Rafael Chucco |
| **Fecha de Nacimiento** | 19 de agosto de 2006 |
| **Email** | rafael@gmail.com |
| **Miembro Desde** | Febrero 2023 |
| **Estado** | Activo |


## ✨ Características

### 🔐 Autenticación
- ✅ Pantalla de login con validación visual
- ✅ Función logout implementada
- 🔄 Navegación automática entre sesiones

### 📦 Gestión de Productos  
- ✅ Registro de productos con 5 campos completos
- ✅ Lista interactiva de productos (ListView)
- ✅ Navegación fluida entre pantallas
- 🔄 Integración con formularios

### 👤 Perfil de Usuario
- ✅ Gestión completa de datos personales
- ✅ Selector de fecha de nacimiento
- ✅ Información de cuenta integrada

### 🧭 Navegación
- ✅ Menú principal centralizado
- ✅ Navegación por rutas nombradas
- ✅ Transiciones suaves entre pantallas

## 🏗️ Arquitectura

La aplicación sigue una arquitectura **MVC (Model-View-Controller)** simplificada con enfoque en **Stateful Widgets** para el manejo de estado local.

```mermaid
graph TB
    A[main.dart] --> B[CupertinoApp]
    B --> C[CupertinoTabScaffold]
    C --> D[LoginScreen]
    C --> E[MainTabScaffold]
    E --> F[RegisterProductScreen]
    E --> G[ProductListScreen]
    E --> H[ProfileScreen]
    E --> I[SettingsScreen]
```

### 🎨 Patrón de Diseño
- **Separation of Concerns**: Cada pantalla en archivo separado
- **Stateful Widgets**: Para manejo de formularios y estado
- **Cupertino (iOS Design)**: Componentes y estilos nativos de iOS
- **Responsive Layout**: Adaptable a diferentes tamaños

## 📁 Estructura del Proyecto

```
tiendamovil/
├── 📄 README.md                     # Documentación principal
├── 📄 pubspec.yaml                  # Dependencias y configuración
├── 📁 lib/                          # Código fuente principal
│   ├── 📄 main.dart                 # Punto de entrada y rutas
│   └── 📁 screens/                  # Pantallas de la aplicación
│       ├── 📄 login_screen.dart             # 🔐 Pantalla de login
│       ├── 📄 main_tab_scaffold.dart        # 🏠 Tab bar principal (CupertinoTabScaffold)
│       ├── 📄 home_screen.dart              # 🏡 Pantalla de inicio
│       ├── 📄 register_product_screen.dart  # ➕ Registro de productos
│       ├── 📄 product_list_screen.dart      # 📋 Lista de productos
│       ├── 📄 profile_screen.dart           # 👤 Perfil de usuario
│       └── 📄 settings_screen.dart          # ⚙️ Configuraciones
├── 📁 android/                      # Configuración Android
├── 📁 ios/                          # Configuración iOS
├── 📁 web/                          # Configuración Web
├── 📁 windows/                      # Configuración Windows
├── 📁 macos/                        # Configuración macOS
└── 📁 test/                         # Tests unitarios
```

## 🛠️ Instalación y Configuración

### Prerequisitos
Antes de comenzar, asegúrate de tener instalado:

- **Flutter SDK** (versión 3.11.4 o superior)
- **Dart SDK** (incluido con Flutter)
- **Android Studio** o **Visual Studio Code**
- **Git** para control de versiones

### 📋 Verificación del Entorno

```bash
# Verificar instalación de Flutter
flutter doctor

# Verificar versión de Flutter
flutter --version
```

### 🚀 Instalación

1. **Clona el repositorio**
```bash
git clone https://github.com/tuusuario/tiendamovil.git
cd tiendamovil
```

2. **Instala las dependencias**
```bash
flutter pub get
```

3. **Verifica la configuración**
```bash
flutter doctor -v
```

4. **Conecta tu dispositivo o inicia un emulador**
```bash
# Ver dispositivos disponibles
flutter devices
```

## 🚀 Ejecución

### 📱 Ejecutar en Dispositivo/Emulador

```bash
# Ejecución básica
flutter run

# Ejecución en modo debug con hot reload
flutter run --debug

# Ejecución en modo release (optimizado)
flutter run --release

# Ejecución en dispositivo específico
flutter run -d <device_id>
```

### 🔧 Comandos de Desarrollo

```bash
# Hot reload (durante ejecución)
r

# Hot restart (durante ejecución)  
R

# Abrir DevTools
flutter inspector

# Analizar rendimiento
flutter run --profile
```

### 🌐 Plataformas Soportadas

- ✅ **Android** (API 21+)
- ✅ **iOS** (iOS 12+)
- ✅ **Web** (Chrome, Firefox, Safari)
- ✅ **Windows** (Windows 10+)
- ✅ **macOS** (macOS 10.14+)
- ✅ **Linux** (Ubuntu 18.04+)

## 📱 Pantallas y Funcionalidades

### 🔐 1. Login Screen (`login_screen.dart`)

<div align="center">

| Campo | Tipo | Validación | Descripción |
|-------|------|-----------|-------------|
| **Email** | CupertinoTextField | Visual | Campo de correo electrónico |
| **Password** | CupertinoTextField | Oculto | Campo de contraseña |
| **LOGIN Button** | CupertinoButton.filled | - | Navega al menú principal |

</div>

**Funcionalidades:**
- ✅ Campos de entrada con estilo Cupertino nativo
- ✅ Navegación automática al tab scaffold tras login
- ✅ Interfaz responsive y elegante
- ✅ Validación visual de campos

**Flujo:**
```
Usuario ingresa credenciales → Presiona LOGIN → Navega a MenuScreen
```

---

### 🏠 2. Main Tab Scaffold (`main_tab_scaffold.dart`)

<div align="center">

| Tab | Ícono | Pantalla | Descripción |
|-----|-------|----------|-------------|
| **Home** | `CupertinoIcons.house_fill` | HomeScreen | Pantalla principal |
| **Productos** | `CupertinoIcons.cube_box_fill` | ProductListScreen | Lista de productos |
| **Perfil** | `CupertinoIcons.person_fill` | ProfileScreen | Perfil de usuario |
| **Ajustes** | `CupertinoIcons.settings_solid` | SettingsScreen | Configuraciones |

</div>

**Funcionalidades:**
- ✅ Navegación por tabs con `CupertinoTabScaffold` + `CupertinoTabBar`
- ✅ Cada tab tiene su propio `CupertinoTabView` con stack de navegación independiente
- ✅ Íconos nativos iOS con `CupertinoIcons`
- ✅ Color activo `CupertinoColors.systemBlue`

---

### ➕ 3. Register Product Screen (`register_product_screen.dart`)

<div align="center">

| # | Campo | Tipo | Keyboard | Validación | Descripción |
|---|-------|------|----------|-----------|-------------|
| 1️⃣ | **Nombre del producto** | TextEditingController | text | Requerido | Nombre identificativo |
| 2️⃣ | **Precio** | TextEditingController | number | Numérico | Precio en moneda local |
| 3️⃣ | **Descripción** | TextEditingController | text | Opcional | Descripción detallada (3 líneas) |
| 4️⃣ | **Categoría** | TextEditingController | text | Requerido | Clasificación del producto |
| 5️⃣ | **Stock** | TextEditingController | number | Numérico | Cantidad en inventario |

</div>

**Funcionalidades:**
- ✅ Formulario completo con 5 campos específicos
- ✅ Validación de tipos de entrada
- ✅ Botón GUARDAR con feedback
- ✅ Auto-limpieza de campos tras guardar
- ✅ Scroll automático para pantallas pequeñas

**Flujo del Formulario:**
```
Llenar campos → GUARDAR → Mostrar confirmación → Limpiar formulario
```

---

### 📋 4. Product List Screen (`product_list_screen.dart`)

<div align="center">

| Elemento | Tipo | Datos Mostrados | Interacción |
|----------|------|----------------|-------------|
| **Navigation Bar** | CupertinoNavigationBar | "Productos" | Visual |
| **Product Item** | Custom Widget | Nombre, Precio, Descripción, Categoría | Tap para seleccionar |
| **Botón Agregar** | CupertinoButton (trailing) | Icono `CupertinoIcons.add` | Navega a registro |
| **ListView** | ListView.builder | Lista dinámica | Scroll infinito |

</div>

**Estructura de Producto:**
```dart
Map<String, String> product = {
  'name': 'Nombre del producto',
  'price': 'Precio formateado',
  'description': 'Descripción completa',
  'category': 'Categoría del producto',
};
```

**Funcionalidades:**
- ✅ ListView optimizado con builder pattern
- ✅ Diseño de cards elegante y responsive
- ✅ Navegación directa al formulario de registro
- ✅ Feedback visual al seleccionar productos
- ✅ Datos de ejemplo pre-cargados

---

### 👤 5. Profile Screen (`profile_screen.dart`)

<div align="center">

| Sección | Campo | Tipo | Widget | Valor Actual | Funcionalidad |
|---------|-------|------|--------|--------------|---------------|
| **Avatar** | Foto de perfil | CircleAvatar | Icon | 👤 | Placeholder visual |
| **Datos Personales** | Nombre | TextEditingController | TextField | **Rafael** | Editable |
| **Datos Personales** | Apellidos | TextEditingController | TextField | **Chucco** | Editable |
| **Datos Personales** | Fecha de nacimiento | TextEditingController | DatePicker | **19/08/2006** | Selector de fecha |
| **Información** | Email | Text (readonly) | Container | **rafael@gmail.com** | Solo lectura |
| **Información** | Miembro desde | Text (readonly) | Container | **Febrero 2023** | Solo lectura |
| **Información** | Productos registrados | Text (readonly) | Container | 12 | Contador |

</div>

**Funcionalidades Especiales:**
- ✅ **Selector de fecha interactivo** con fecha de nacimiento del usuario (19/08/2006)
- ✅ **Avatar placeholder personalizable**
- ✅ **Información de cuenta integrada** con datos personales reales
- ✅ **Formulario de edición completo** para gestionar datos del usuario
- ✅ **Validación de fechas** dentro del rango permitido (1900 hasta hoy)

**DatePicker Implementation (Usuario Rafael Chucco):**
```dart
void _selectBirthDate(BuildContext context) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (ctx) => SizedBox(
      height: 260,
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.date,
        initialDateTime: DateTime(2006, 8, 19),  // Fecha de Rafael
        minimumDate: DateTime(1900),
        maximumDate: DateTime.now(),
        onDateTimeChanged: (date) {
          // Formateo automático DD/MM/AAAA
          // Ej: 19/08/2006
        },
      ),
    ),
  );
}
```

**Datos de Prueba Pre-cargados:**
```dart
void initState() {
  super.initState();
  // Usuario: Rafael Chucco
  _firstNameController.text = 'Rafael';
  _lastNameController.text = 'Chucco';
  _birthDateController.text = '19/08/2006';
  
  // Información de cuenta
  // Email: rafael@gmail.com
  // Miembro desde: Febrero 2023
}
```

## Widgets y APIs usados por las vistas
- **CupertinoApp**: Raíz de la aplicación con `CupertinoThemeData` y `primaryColor: CupertinoColors.systemBlue`.
- **CupertinoTabScaffold + CupertinoTabBar**: Navegación por pestañas con `CupertinoTabView` por tab ([lib/screens/main_tab_scaffold.dart](lib/screens/main_tab_scaffold.dart)).
- **CupertinoPageScaffold + CupertinoNavigationBar**: Estructura de pantalla estilo iOS (ej. [lib/screens/product_list_screen.dart](lib/screens/product_list_screen.dart), [lib/screens/profile_screen.dart](lib/screens/profile_screen.dart)).
- **CupertinoPageRoute**: Navegación con transición slide estilo iOS.
- **CupertinoTextField**: Campos de texto nativos iOS con `placeholder`, `obscureText`, `keyboardType` y `maxLines` (ej. [lib/screens/login_screen.dart](lib/screens/login_screen.dart), [lib/screens/register_product_screen.dart](lib/screens/register_product_screen.dart)).
- **CupertinoButton / CupertinoButton.filled**: Botones nativos iOS para acciones primarias y secundarias.
- **CupertinoListSection + CupertinoListTile**: Listas agrupadas estilo iOS con `CupertinoListTileChevron` (ej. [lib/screens/settings_screen.dart](lib/screens/settings_screen.dart), [lib/screens/profile_screen.dart](lib/screens/profile_screen.dart)).
- **ListView.builder**: Listas dinámicas para colecciones de productos ([lib/screens/product_list_screen.dart](lib/screens/product_list_screen.dart)).
- **CupertinoIcons**: Íconos nativos iOS (`house_fill`, `cube_box_fill`, `person_fill`, `settings_solid`, `add`, `calendar`, etc.).
- **CupertinoColors**: Paleta de colores semántica (`systemBlue`, `systemBackground`, `label`, `secondaryLabel`, `systemGrey6`, etc.).
- **showCupertinoModalPopup + CupertinoDatePicker**: Selector de fecha nativo iOS ([lib/screens/profile_screen.dart](lib/screens/profile_screen.dart)).
- **showCupertinoDialog + CupertinoAlertDialog**: Diálogos de confirmación estilo iOS ([lib/utils/cupertino_dialogs.dart](lib/utils/cupertino_dialogs.dart)).
- **Gestión de recursos**: Llamadas a `dispose()` para liberar `TextEditingController` y evitar fugas de memoria.

## �🧭 Flujo de Navegación

```mermaid
flowchart TD
    A[🚀 App Startup] --> B[🔐 Login Screen]
    
    B --> |Login Success| C[🏠 CupertinoTabScaffold]
    
    C --> |Tab 0| D[🏡 Home Screen]
    C --> |Tab 1| E[📋 Product List Screen]
    C --> |Tab 2| F[👤 Profile Screen]
    C --> |Tab 3| G[⚙️ Settings Screen]
    
    E --> |CupertinoPageRoute| H[➕ Register Product Screen]
    H --> |Pop| E
    
    style A fill:#e1f5fe
    style B fill:#fff3e0
    style C fill:#e8f5e9
    style D fill:#fce4ec
    style E fill:#fff8e1
    style F fill:#f3e5f5
    style G fill:#e8f5e9
```

### 📍 Estructura de Navegación

| Nivel | Widget | Pantalla | Descripción |
|-------|--------|----------|-------------|
| Raíz | `CupertinoApp` | — | Punto de entrada (initialRoute: `/login`) |
| Login | `CupertinoPageScaffold` | LoginScreen | Pantalla inicial de autenticación |
| Principal | `CupertinoTabScaffold` | MainTabScaffold | Hub central con 4 tabs |
| Tab 0 | `CupertinoTabView` | HomeScreen | Pantalla de inicio |
| Tab 1 | `CupertinoTabView` | ProductListScreen | Lista de productos |
| Tab 2 | `CupertinoTabView` | ProfileScreen | Perfil de usuario |
| Tab 3 | `CupertinoTabView` | SettingsScreen | Configuraciones |
| Modal | `CupertinoPageRoute` | RegisterProductScreen | Formulario de registro |

## 🎯 Casos de Uso

### 👤 Actor: Usuario de la Tienda

```mermaid
graph LR
    User([👤 Usuario]) --> Login[🔐 Iniciar Sesión]
    User --> Register[➕ Registrar Producto]
    User --> View[📋 Ver Productos]
    User --> Profile[👤 Gestionar Perfil]
    User --> Logout[🚪 Cerrar Sesión]
    
    Login --> Menu[🏠 Acceso al Menú]
    Register --> Form[📝 Llenar Formulario]
    View --> List[📋 Visualizar Lista]
    Profile --> Edit[✏️ Editar Datos]
    Logout --> Exit[🔚 Salir de App]
```

### 📋 Casos de Uso Detallados

1. **CU-001: Autenticación de Usuario**
   - **Precondición**: Usuario tiene credenciales
   - **Flujo**: Login → Validación → Acceso al menú
   - **Postcondición**: Usuario autenticado en el sistema

2. **CU-002: Registro de Producto**
   - **Precondición**: Usuario autenticado
   - **Flujo**: Menú → Formulario → Llenar 5 campos → Guardar
   - **Postcondición**: Producto registrado en el sistema

3. **CU-003: Visualización de Productos**
   - **Precondición**: Productos existentes en el sistema
   - **Flujo**: Menú → Lista → Ver detalles
   - **Postcondición**: Usuario visualiza inventario

4. **CU-004: Gestión de Perfil**
   - **Precondición**: Usuario autenticado
   - **Flujo**: Menú → Perfil → Editar → Guardar
   - **Postcondición**: Datos actualizados

## 💻 Tecnologías

### 🎨 Frontend
- **Framework**: Flutter 3.11.4+
- **Lenguaje**: Dart
- **UI Kit**: Cupertino (iOS Design System)
- **Navegación**: CupertinoTabScaffold + CupertinoPageRoute
- **Estado**: StatefulWidget

### 📦 Dependencias Principales
```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^6.0.0
```

### 🎨 Paleta de Colores (CupertinoColors)
- **Primario**: `CupertinoColors.systemBlue`
- **Fondo**: `CupertinoColors.systemBackground`
- **Texto**: `CupertinoColors.label` / `CupertinoColors.secondaryLabel`
- **Superficie**: `CupertinoColors.systemGrey6`
- **Separador**: `CupertinoColors.separator`

## 🧪 Datos de Prueba

### 👤 Usuario Principal: Rafael Chucco

Para probar la aplicación, se incluyen los siguientes datos pre-cargados:

#### Información Personal
| Campo | Valor |
|-------|-------|
| **Nombre** | Rafael |
| **Apellidos** | Chucco |
| **Fecha de Nacimiento** | 19/08/2006 (19 de agosto de 2006) |
| **Edad** | 19 años |

#### Información de Cuenta
| Campo | Valor |
|-------|-------|
| **Email** | rafael@gmail.com |
| **Miembro desde** | Febrero 2023 |
| **Productos Registrados** | 12 |
| **Estado** | Activo |

#### Acceso a la Aplicación
| Campo | Valor (Ej) |
|-------|-------|
| **Email de Login** | (Usar cualquier valor) |
| **Contraseña** | (Usar cualquier valor) |

**Nota**: Actualmente la aplicación no valida credenciales. El login redirige directamente al menú para fines de desarrollo.

### 📦 Productos de Ejemplo

En la pantalla de "Lista de Productos" encontrarás productos de ejemplo con la siguiente estructura:

```dart
{
  'name': 'Nombre del Producto',
  'price': 'Precio en moneda local',
  'description': 'Descripción del producto',
  'category': 'Categoría (Ej: Electrónica, Ropa, etc)',
}
```

**Total de productos de ejemplo**: 12 unidades

## 🗺️ Roadmap

### 📅 Versión 1.1.0 (Próxima)
- [ ] **Implementación de Base de Datos**
  - [ ] SQLite local para productos
  - [ ] Persistencia de datos de usuario
  - [ ] Sincronización offline

- [ ] **Autenticación Real**
  - [ ] Validación de credenciales
  - [ ] Registro de nuevos usuarios
  - [ ] Recuperación de contraseña

### 📅 Versión 1.2.0 (Futura)
- [ ] **Funcionalidades Avanzadas**
  - [ ] Búsqueda y filtros de productos
  - [ ] Categorías dinámicas
  - [ ] Imágenes de productos
  - [ ] Reportes y estadísticas

- [ ] **Mejoras de UX**
  - [ ] Animaciones y transiciones
  - [ ] Tema oscuro/claro
  - [ ] Notificaciones push
  - [ ] Internacionalización (i18n)

### 📅 Versión 2.0.0 (Visión)
- [ ] **Backend Integration**
  - [ ] API REST
  - [ ] Sincronización en la nube
  - [ ] Multi-usuario
  - [ ] Dashboard web administrativo

## 🤝 Contribución

¡Las contribuciones son bienvenidas! Sigue estos pasos:

### 🛠️ Configuración para Desarrollo

1. **Fork el proyecto**
2. **Crear rama de feature**
```bash
git checkout -b feature/nueva-funcionalidad
```

3. **Commit de cambios**
```bash
git commit -m 'Add: nueva funcionalidad increíble'
```

4. **Push a la rama**
```bash
git push origin feature/nueva-funcionalidad
```

5. **Abrir Pull Request**

### 📝 Estándares de Código
- **Dart Style Guide**: Seguir convenciones oficiales
- **Comentarios**: Documentar funciones complejas
- **Testing**: Incluir tests para nuevas funcionalidades
- **Commits**: Usar conventional commits

## 📄 Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para más detalles.

---

<div align="center">

### 🚀 ¿Listo para comenzar?

```bash
flutter run
```

**Desarrollado con ❤️ usando Flutter**

[🐛 Reportar Bug](https://github.com/tuusuario/tiendamovil/issues) | [💡 Solicitar Feature](https://github.com/tuusuario/tiendamovil/issues) | [📖 Documentación](https://github.com/tuusuario/tiendamovil/wiki)

</div>

---

**📅 Última actualización**: Mayo 2026  
**👨‍💻 Autor**: Tu Nombre  
**📧 Contacto**: tuemail@ejemplo.com