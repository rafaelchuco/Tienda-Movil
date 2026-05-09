#!/bin/bash

# 🚀 Script de configuración automática para Tienda Móvil
# Autor: Rafael
# Versión: 1.0.0

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

# Emojis para mejor UX
ROCKET="🚀"
CHECK="✅"
ERROR="❌"
INFO="ℹ️"
PACKAGE="📦"
DEVICE="📱"
LIGHTNING="⚡"
MAGNIFIER="🔍"

echo -e "${BLUE}${ROCKET} Configurando Tienda Móvil...${NC}"
echo "================================================="

# 1. Verificar Flutter
echo -e "\n${MAGNIFIER} Verificando instalación de Flutter..."
if ! command -v flutter &> /dev/null; then
    echo -e "${ERROR} Flutter no encontrado. Por favor instálalo primero."
    echo "Visita: https://flutter.dev/docs/get-started/install"
    exit 1
else
    echo -e "${CHECK} Flutter encontrado"
    flutter --version | head -n 1
fi

# 2. Verificar Flutter Doctor
echo -e "\n${MAGNIFIER} Ejecutando Flutter Doctor..."
flutter doctor

# Preguntar si continuar si hay problemas
echo -e "\n${INFO} ¿Los resultados de Flutter Doctor son aceptables? (y/N)"
read -r response
if [[ ! "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    echo -e "${ERROR} Por favor resuelve los problemas de Flutter Doctor antes de continuar."
    exit 1
fi

# 3. Limpiar caché anterior (si existe)
echo -e "\n${LIGHTNING} Limpiando caché anterior..."
flutter clean
echo -e "${CHECK} Caché limpiado"

# 4. Instalar dependencias
echo -e "\n${PACKAGE} Instalando dependencias del proyecto..."
flutter pub get

if [ $? -eq 0 ]; then
    echo -e "${CHECK} Dependencias instaladas correctamente"
else
    echo -e "${ERROR} Error al instalar dependencias"
    exit 1
fi

# 5. Verificar dependencias
echo -e "\n${MAGNIFIER} Verificando dependencias..."
flutter pub deps

# 6. Pre-compilar para mejor rendimiento
echo -e "\n${LIGHTNING} Pre-compilando para mejor rendimiento..."
flutter precache --android --ios --web

# 7. Verificar dispositivos disponibles
echo -e "\n${DEVICE} Dispositivos disponibles:"
flutter devices

# 8. Crear directorios adicionales si no existen
echo -e "\n${INFO} Creando estructura de carpetas..."
mkdir -p assets/images
mkdir -p assets/icons
mkdir -p assets/fonts
mkdir -p lib/widgets
mkdir -p lib/models
mkdir -p lib/services
mkdir -p lib/utils
mkdir -p lib/themes
echo -e "${CHECK} Estructura de carpetas creada"

# 9. Crear archivos de configuración adicionales si no existen
echo -e "\n${INFO} Creando archivos de configuración..."

# .gitignore adicional para Flutter
if [ ! -f .gitignore ]; then
    cat > .gitignore << EOF
# Miscellaneous
*.class
*.log
*.pyc
*.swp
.DS_Store
.atom/
.buildlog/
.history
.svn/

# IntelliJ related
*.iml
*.ipr
*.iws
.idea/

# The .vscode folder contains launch configuration and tasks you configure in
# VS Code which you may wish to be included in version control, so this line
# is commented out by default.
#.vscode/

# Flutter/Dart/Pub related
**/doc/api/
**/ios/Flutter/.last_build_id
.dart_tool/
.flutter-plugins
.flutter-plugins-dependencies
.packages
.pub-cache/
.pub/
/build/

# Web related
lib/generated_plugin_registrant.dart

# Symbolication related
app.*.symbols

# Obfuscation related
app.*.map.json

# Android Studio will place build artifacts here
/android/app/debug
/android/app/profile
/android/app/release
EOF
    echo -e "${CHECK} .gitignore creado"
fi

# analysis_options.yaml
if [ ! -f analysis_options.yaml ]; then
    cat > analysis_options.yaml << EOF
include: package:flutter_lints/flutter.yaml

analyzer:
  exclude:
    - "**/*.g.dart"
    - "**/*.freezed.dart"

linter:
  rules:
    prefer_single_quotes: true
    sort_constructors_first: true
    sort_unnamed_constructors_first: true
EOF
    echo -e "${CHECK} analysis_options.yaml creado"
fi

# 10. Verificar que todo funciona
echo -e "\n${MAGNIFIER} Verificando que la aplicación compile..."
flutter build apk --debug > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo -e "${CHECK} La aplicación compila correctamente"
else
    echo -e "${YELLOW} Advertencia: Problemas al compilar. Revisa las dependencias."
fi

# 11. Resumen final
echo -e "\n================================================="
echo -e "${CHECK} ${GREEN}¡Configuración completada exitosamente!${NC}"
echo -e "\n${ROCKET} Próximos pasos:"
echo -e "1. ${DEVICE} Conecta tu dispositivo o inicia un emulador"
echo -e "2. ${LIGHTNING} Ejecuta: ${BLUE}flutter run${NC}"
echo -e "3. ${INFO} Para hot reload durante desarrollo: presiona ${YELLOW}'r'${NC}"
echo -e "4. ${INFO} Para hot restart: presiona ${YELLOW}'R'${NC}"
echo -e "5. ${INFO} Para salir: presiona ${YELLOW}'q'${NC}"

echo -e "\n${INFO} Comandos útiles:"
echo -e "• ${BLUE}flutter run --debug${NC} - Modo desarrollo con debugging"
echo -e "• ${BLUE}flutter run --release${NC} - Modo optimizado"
echo -e "• ${BLUE}flutter build apk${NC} - Generar APK"
echo -e "• ${BLUE}flutter build web${NC} - Generar para web"
echo -e "• ${BLUE}flutter doctor${NC} - Verificar configuración"

echo -e "\n${ROCKET} Documentación disponible en:"
echo -e "• README.md - Documentación principal"
echo -e "• docs/ARCHITECTURE.md - Arquitectura del proyecto"
echo -e "• docs/USER_GUIDE.md - Guía de usuario"
echo -e "• docs/INSTALLATION.md - Guía de instalación detallada"
echo -e "• docs/API_REFERENCE.md - Referencia de API"

echo -e "\n${GREEN}¡Feliz desarrollo! 🎉${NC}"