# 🛠️ Guía de Instalación Completa - Tienda Móvil

## 📋 Tabla de Contenidos
- [Requisitos del Sistema](#-requisitos-del-sistema)
- [Instalación de Dependencias](#-instalación-de-dependencias)
- [Configuración del Proyecto](#-configuración-del-proyecto)
- [Ejecución por Plataforma](#-ejecución-por-plataforma)
- [Configuración del IDE](#-configuración-del-ide)
- [Resolución de Problemas](#-resolución-de-problemas)
- [Scripts de Automatización](#-scripts-de-automatización)

## 💻 Requisitos del Sistema

### 🖥️ Requisitos Mínimos

| Componente | Windows | macOS | Linux |
|------------|---------|-------|-------|
| **OS** | Windows 10+ | macOS 10.14+ | Ubuntu 18.04+ |
| **RAM** | 8 GB | 8 GB | 8 GB |
| **Espacio** | 10 GB | 10 GB | 10 GB |
| **Procesador** | x64 | Intel/Apple Silicon | x64 |

### 🖥️ Requisitos Recomendados

| Componente | Especificación |
|------------|----------------|
| **RAM** | 16 GB o más |
| **SSD** | 500 GB+ para mejor rendimiento |
| **Conexión** | Internet estable para descargas |
| **Resolución** | 1920x1080 o superior |

## 📦 Instalación de Dependencias

### 1. 🎯 Instalación de Flutter SDK

#### Windows:
```powershell
# Opción 1: Descarga directa
# 1. Descarga Flutter desde https://flutter.dev/docs/get-started/install/windows
# 2. Extrae a C:\development\flutter
# 3. Añade C:\development\flutter\bin al PATH

# Opción 2: Con Chocolatey
choco install flutter

# Opción 3: Con Scoop
scoop bucket add extras
scoop install flutter
```

#### macOS:
```bash
# Opción 1: Descarga directa
# Descarga desde https://flutter.dev/docs/get-started/install/macos

# Opción 2: Con Homebrew
brew install --cask flutter

# Añadir al PATH (en ~/.zshrc o ~/.bash_profile)
export PATH="$PATH:/opt/homebrew/bin/flutter/bin"
```

#### Linux (Ubuntu/Debian):
```bash
# Instalar dependencias
sudo apt update
sudo apt install curl git unzip xz-utils zip libglu1-mesa

# Descargar Flutter
cd ~/development
git clone https://github.com/flutter/flutter.git -b stable

# Añadir al PATH (en ~/.bashrc)
export PATH="$PATH:$HOME/development/flutter/bin"

# Recargar terminal
source ~/.bashrc
```

### 2. 🔧 Configuración de Android Studio

#### Instalación:
```bash
# Descarga desde https://developer.android.com/studio
# O usa tu package manager favorito:

# Windows (Chocolatey)
choco install androidstudio

# macOS (Homebrew)
brew install --cask android-studio

# Linux (Snap)
sudo snap install android-studio --classic
```

#### Configuración:
1. **Abre Android Studio**
2. **Configure > SDK Manager**
3. **Instala Android SDK (API 30+)**
4. **Tools > AVD Manager > Create Virtual Device**

### 3. 🍎 Configuración para iOS (Solo macOS)

```bash
# Instalar Xcode desde App Store o:
mas install 497799835  # Xcode

# Instalar Xcode Command Line Tools
xcode-select --install

# Aceptar licencias
sudo xcodebuild -license accept

# Configurar iOS Simulator
open -a Simulator
```

### 4. 🌐 Configuración para Web

```bash
# Habilitar soporte web
flutter config --enable-web

# Verificar Chrome está instalado
google-chrome --version  # Linux
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --version  # macOS
```

### 5. 🖥️ Configuración para Desktop

#### Windows:
```powershell
# Habilitar soporte desktop
flutter config --enable-windows-desktop

# Instalar Visual Studio 2022 (Community es suficiente)
# Incluir: "Desktop development with C++"
```

#### macOS:
```bash
# Habilitar soporte desktop
flutter config --enable-macos-desktop

# Xcode ya instalado sirve para desktop
```

#### Linux:
```bash
# Habilitar soporte desktop
flutter config --enable-linux-desktop

# Instalar dependencias
sudo apt install clang cmake ninja-build pkg-config libgtk-3-dev
```

## 🚀 Configuración del Proyecto

### 1. 📥 Clonar el Repositorio

```bash
# HTTPS
git clone https://github.com/tuusuario/tiendamovil.git

# SSH (si tienes configurado)
git clone git@github.com:tuusuario/tiendamovil.git

# Navegar al proyecto
cd tiendamovil
```

### 2. 🔍 Verificar Instalación

```bash
# Verificar Flutter
flutter doctor -v

# Resultado esperado:
[✓] Flutter (Channel stable, 3.11.4)
[✓] Android toolchain - develop for Android devices
[✓] Xcode - develop for iOS and macOS (macOS only)
[✓] Chrome - develop for the web
[✓] Android Studio (version 2023.1)
[✓] VS Code (version 1.85)
[✓] Connected device (3 available)
```

### 3. 📦 Instalar Dependencias del Proyecto

```bash
# Instalar packages
flutter pub get

# Verificar que no hay errores
flutter pub deps
```

### 4. 🧹 Limpieza Inicial (Opcional)

```bash
# Limpiar caché
flutter clean

# Reinstalar dependencias
flutter pub get

# Pre-compilar para mejor rendimiento
flutter precache
```

## 📱 Ejecución por Plataforma

### 🤖 Android

#### Configuración inicial:
```bash
# Ver dispositivos disponibles
flutter devices

# Crear y ejecutar AVD si no hay dispositivo físico
flutter emulators
flutter emulators --launch <emulator_id>
```

#### Ejecución:
```bash
# Modo desarrollo
flutter run

# Modo release (optimizado)
flutter run --release

# Dispositivo específico
flutter run -d <device_id>

# Con hot reload habilitado
flutter run --hot
```

#### Build APK:
```bash
# APK de desarrollo
flutter build apk

# APK de producción
flutter build apk --release

# App Bundle (recomendado para Play Store)
flutter build appbundle --release
```

### 🍎 iOS (Solo macOS)

#### Configuración inicial:
```bash
# Abrir proyecto iOS en Xcode
open ios/Runner.xcworkspace

# Configurar Team y Bundle ID en Xcode
# Build Settings > Signing & Capabilities
```

#### Ejecución:
```bash
# En simulador
flutter run

# En dispositivo físico (necesita certificados)
flutter run --device-id <iphone_id>

# Modo release
flutter run --release
```

#### Build para distribución:
```bash
# Build iOS
flutter build ios --release

# Crear IPA (desde Xcode)
# Product > Archive > Distribute App
```

### 🌐 Web

#### Configuración inicial:
```bash
# Verificar soporte web
flutter config --enable-web
flutter devices  # Debe aparecer Chrome
```

#### Ejecución:
```bash
# Servidor de desarrollo
flutter run -d chrome

# Puerto específico
flutter run -d chrome --web-port 8080

# Modo release
flutter run -d chrome --release
```

#### Build para producción:
```bash
# Build web
flutter build web

# Servir localmente para probar
cd build/web
python -m http.server 8000  # Python
# O
npx serve .  # Node.js
```

### 🖥️ Desktop

#### Windows:
```bash
# Ejecutar
flutter run -d windows

# Build ejecutable
flutter build windows

# Ejecutable en: build\windows\runner\Release\
```

#### macOS:
```bash
# Ejecutar
flutter run -d macos

# Build app
flutter build macos

# App en: build/macos/Build/Products/Release/
```

#### Linux:
```bash
# Ejecutar
flutter run -d linux

# Build
flutter build linux

# Ejecutable en: build/linux/x64/release/bundle/
```

## 🛠️ Configuración del IDE

### 📝 Visual Studio Code

#### Extensiones necesarias:
```bash
# Instalar extensiones
code --install-extension Dart-Code.dart-code
code --install-extension Dart-Code.flutter
code --install-extension ms-vscode.vscode-json
```

#### Configuración `.vscode/settings.json`:
```json
{
  "dart.flutterSdkPath": "/path/to/flutter",
  "dart.debugExternalLibraries": false,
  "dart.debugSdkLibraries": false,
  "[dart]": {
    "editor.formatOnSave": true,
    "editor.formatOnType": true,
    "editor.rulers": [80],
    "editor.selectionHighlight": false,
    "editor.suggest.snippetsPreventQuickSuggestions": false,
    "editor.suggestSelection": "first",
    "editor.tabCompletion": "onlySnippets",
    "editor.wordBasedSuggestions": false
  }
}
```

#### Configuración `.vscode/launch.json`:
```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "tiendamovil",
      "request": "launch",
      "type": "dart",
      "program": "lib/main.dart"
    },
    {
      "name": "tiendamovil (profile mode)",
      "request": "launch", 
      "type": "dart",
      "flutterMode": "profile",
      "program": "lib/main.dart"
    }
  ]
}
```

### 🎯 Android Studio

#### Plugins necesarios:
1. **Flutter** (incluye Dart)
2. **Git** 
3. **Markdown** (para documentación)

#### Configuración:
1. **File > Settings > Languages & Frameworks > Flutter**
2. **Configurar Flutter SDK Path**
3. **File > Settings > Editor > Code Style > Dart**
4. **Establecer line length a 80**

### ⚡ IntelliJ IDEA

Misma configuración que Android Studio, pero en:
**File > Settings > Languages & Frameworks > Flutter**

## 🔧 Resolución de Problemas

### ❗ Problemas Comunes

#### 1. Flutter Doctor Issues

```bash
# Problema: Android licenses not accepted
flutter doctor --android-licenses

# Problema: Xcode not configured  
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer

# Problema: Chrome not found
# Instalar Google Chrome manualmente
```

#### 2. Problemas de Dependencias

```bash
# Limpiar y reinstalar
flutter clean
flutter pub get

# Problemas de caché
flutter pub cache repair

# Problema de versiones
flutter pub upgrade
```

#### 3. Problemas de Build

```bash
# Android build issues
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get

# iOS build issues (macOS)
cd ios
rm -rf Pods/
rm Podfile.lock
pod install
cd ..
flutter clean
```

#### 4. Problemas de Rendimiento

```bash
# Modo profile para debugging
flutter run --profile

# Analizar bundle size
flutter build apk --analyze-size
flutter build web --analyze-size

# Verificar memoria
flutter run --enable-asserts
```

### 🐛 Debug Tips

#### Logs y Debugging:
```bash
# Ver logs en tiempo real
flutter logs

# Debug específico de dispositivo
flutter logs -d <device_id>

# Inspector de widgets
flutter inspector
```

#### Performance Analysis:
```bash
# Timeline performance
flutter run --trace-startup

# Memory usage
flutter run --enable-vm-service
# Luego abre DevTools en el enlace mostrado
```

## 🤖 Scripts de Automatización

### 📄 Crear `scripts/setup.sh` (macOS/Linux):

```bash
#!/bin/bash
echo "🚀 Configurando Tienda Móvil..."

# Verificar Flutter
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter no encontrado. Por favor instálalo primero."
    exit 1
fi

# Verificar doctor
echo "🔍 Verificando instalación..."
flutter doctor

# Instalar dependencias
echo "📦 Instalando dependencias..."
flutter pub get

# Verificar dispositivos
echo "📱 Dispositivos disponibles:"
flutter devices

# Pre-compilar
echo "⚡ Pre-compilando para mejor rendimiento..."
flutter precache

echo "✅ ¡Configuración completada!"
echo "🏃 Ejecuta: flutter run"
```

### 📄 Crear `scripts/setup.bat` (Windows):

```batch
@echo off
echo 🚀 Configurando Tienda Móvil...

REM Verificar Flutter
flutter --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Flutter no encontrado. Por favor instálalo primero.
    pause
    exit /b 1
)

REM Verificar doctor
echo 🔍 Verificando instalación...
flutter doctor

REM Instalar dependencias
echo 📦 Instalando dependencias...
flutter pub get

REM Verificar dispositivos
echo 📱 Dispositivos disponibles:
flutter devices

REM Pre-compilar
echo ⚡ Pre-compilando para mejor rendimiento...
flutter precache

echo ✅ ¡Configuración completada!
echo 🏃 Ejecuta: flutter run
pause
```

### 📄 Crear `scripts/build-all.sh`:

```bash
#!/bin/bash
echo "🏗️ Building para todas las plataformas..."

# Android
echo "🤖 Building Android..."
flutter build apk --release

# Web  
echo "🌐 Building Web..."
flutter build web

# Desktop (según OS)
case "$OSTYPE" in
  darwin*)  
    echo "🍎 Building macOS..."
    flutter build macos
    ;;
  linux*)   
    echo "🐧 Building Linux..."
    flutter build linux
    ;;
  msys*)    
    echo "🪟 Building Windows..."
    flutter build windows
    ;;
esac

echo "✅ ¡Todos los builds completados!"
echo "📁 Revisa la carpeta build/ para los archivos"
```

### 🚀 Uso de Scripts:

```bash
# Dar permisos (macOS/Linux)
chmod +x scripts/setup.sh
chmod +x scripts/build-all.sh

# Ejecutar
./scripts/setup.sh
./scripts/build-all.sh

# Windows
scripts\setup.bat
```

## 📋 Checklist Final

### ✅ Verificación Pre-Desarrollo

- [ ] Flutter SDK instalado y en PATH
- [ ] `flutter doctor` sin errores críticos
- [ ] IDE configurado con plugins
- [ ] Al menos un dispositivo/emulador disponible
- [ ] Dependencias del proyecto instaladas
- [ ] Proyecto ejecuta sin errores

### ✅ Verificación Post-Instalación

```bash
# Tests básicos
flutter test

# Build de prueba
flutter build apk --debug

# Ejecutar en dispositivo
flutter run

# Verificar hot reload funciona
# (hacer cambio en UI y guardar)
```

---

<div align="center">

### 🎉 ¡Instalación Completada!

**Tu entorno de desarrollo está listo para Tienda Móvil**

Siguiente paso: Lee la [Guía de Usuario](USER_GUIDE.md) para conocer todas las funcionalidades

[🏠 Volver al README](../README.md) | [📚 Ver Arquitectura](ARCHITECTURE.md) | [👤 Guía de Usuario](USER_GUIDE.md)

</div>