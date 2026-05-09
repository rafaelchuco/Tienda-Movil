#!/bin/bash

# 🔧 Script de desarrollo para Tienda Móvil
# Facilita tareas comunes de desarrollo
# Autor: Rafael
# Versión: 1.0.0

# Colores y emojis
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
PURPLE='\033[0;35m'
NC='\033[0m'

DEV="🔧"
ROCKET="🚀"
CHECK="✅"
ERROR="❌"
INFO="ℹ️"
CLEAN="🧹"
TEST="🧪"
BUILD="🏗️"
DEVICE="📱"
WEB="🌐"
ANALYZE="🔍"

# Función para mostrar ayuda
show_help() {
    echo -e "${BLUE}${DEV} Script de Desarrollo - Tienda Móvil${NC}"
    echo "============================================="
    echo "Uso: $0 [comando] [opciones]"
    echo ""
    echo "Comandos disponibles:"
    echo ""
    echo -e "${ROCKET} Ejecución:"
    echo "  run [device]     Ejecutar app en dispositivo/emulador"
    echo "  hot              Ejecutar con hot reload habilitado"
    echo "  web              Ejecutar en navegador web"
    echo "  profile          Ejecutar en modo profile (análisis de rendimiento)"
    echo ""
    echo -e "${TEST} Testing y Calidad:"
    echo "  test             Ejecutar todos los tests"
    echo "  test-watch       Ejecutar tests en modo watch"
    echo "  analyze          Analizar código con linter"
    echo "  format           Formatear código automáticamente"
    echo ""
    echo -e "${BUILD} Build y Distribución:"
    echo "  build-debug      Build de desarrollo"
    echo "  build-release    Build de producción"
    echo "  build-web        Build para web"
    echo "  apk              Generar APK (Android)"
    echo ""
    echo -e "${CLEAN} Mantenimiento:"
    echo "  clean            Limpiar caché y archivos temporales"
    echo "  reset            Reset completo del proyecto"
    echo "  deps             Actualizar dependencias"
    echo "  doctor           Verificar configuración de Flutter"
    echo ""
    echo -e "${DEVICE} Dispositivos:"
    echo "  devices          Listar dispositivos disponibles"
    echo "  emulators        Listar y gestionar emuladores"
    echo ""
    echo -e "${INFO} Información:"
    echo "  logs             Ver logs en tiempo real"
    echo "  size             Analizar tamaño del bundle"
    echo "  help             Mostrar esta ayuda"
    echo ""
    echo "Ejemplos:"
    echo "  $0 run android"
    echo "  $0 hot"
    echo "  $0 test"
    echo "  $0 build-release"
}

# Función para logging con timestamp
log() {
    echo -e "[$(date '+%H:%M:%S')] $1"
}

# Función para verificar si flutter está disponible
check_flutter() {
    if ! command -v flutter &> /dev/null; then
        log "${ERROR} Flutter no encontrado en PATH"
        exit 1
    fi
}

# Función para seleccionar dispositivo
select_device() {
    local devices=$(flutter devices --machine | jq -r '.[].id' 2>/dev/null)
    if [ -z "$devices" ]; then
        log "${ERROR} No hay dispositivos disponibles"
        log "${INFO} Ejecuta: $0 emulators para gestionar emuladores"
        exit 1
    fi
    
    echo -e "${DEVICE} Dispositivos disponibles:"
    flutter devices
}

# Procesar comando
case "$1" in
    # Comandos de ejecución
    "run")
        check_flutter
        log "${ROCKET} Ejecutando Tienda Móvil..."
        if [ -n "$2" ]; then
            flutter run -d "$2"
        else
            flutter run
        fi
        ;;
    
    "hot")
        check_flutter
        log "${ROCKET} Ejecutando con hot reload..."
        flutter run --hot
        ;;
    
    "web")
        check_flutter
        log "${WEB} Ejecutando en web..."
        flutter run -d chrome --web-port 8080
        ;;
    
    "profile")
        check_flutter
        log "${ANALYZE} Ejecutando en modo profile..."
        flutter run --profile
        ;;
    
    # Comandos de testing
    "test")
        check_flutter
        log "${TEST} Ejecutando tests..."
        flutter test --coverage
        if [ $? -eq 0 ]; then
            log "${CHECK} Todos los tests pasaron"
        else
            log "${ERROR} Algunos tests fallaron"
        fi
        ;;
    
    "test-watch")
        check_flutter
        log "${TEST} Ejecutando tests en modo watch..."
        # Nota: Flutter no tiene --watch nativo, simulamos con entr si está disponible
        if command -v entr &> /dev/null; then
            find lib test -name "*.dart" | entr -c flutter test
        else
            log "${INFO} Para modo watch, instala 'entr' o usa tu IDE"
            flutter test
        fi
        ;;
    
    "analyze")
        check_flutter
        log "${ANALYZE} Analizando código..."
        flutter analyze
        ;;
    
    "format")
        check_flutter
        log "🎨 Formateando código..."
        dart format lib/ test/
        log "${CHECK} Código formateado"
        ;;
    
    # Comandos de build
    "build-debug")
        check_flutter
        log "${BUILD} Building en modo debug..."
        flutter build apk --debug
        log "${CHECK} APK debug generado en: build/app/outputs/flutter-apk/"
        ;;
    
    "build-release")
        check_flutter
        log "${BUILD} Building en modo release..."
        flutter build apk --release
        log "${CHECK} APK release generado en: build/app/outputs/flutter-apk/"
        ;;
    
    "build-web")
        check_flutter
        log "${WEB} Building para web..."
        flutter build web --release
        log "${CHECK} Build web generado en: build/web/"
        log "${INFO} Para servir localmente: cd build/web && python -m http.server 8000"
        ;;
    
    "apk")
        check_flutter
        log "${BUILD} Generando APK..."
        flutter build apk --release --split-per-abi
        log "${CHECK} APKs generados en: build/app/outputs/flutter-apk/"
        ls -la build/app/outputs/flutter-apk/*.apk 2>/dev/null || log "${ERROR} No se encontraron APKs"
        ;;
    
    # Comandos de mantenimiento
    "clean")
        check_flutter
        log "${CLEAN} Limpiando proyecto..."
        flutter clean
        flutter pub get
        log "${CHECK} Proyecto limpiado y dependencias reinstaladas"
        ;;
    
    "reset")
        check_flutter
        log "${CLEAN} Reset completo del proyecto..."
        flutter clean
        rm -rf .dart_tool/
        rm -rf build/
        rm -rf .packages
        rm -rf pubspec.lock
        flutter pub get
        log "${CHECK} Reset completo realizado"
        ;;
    
    "deps")
        check_flutter
        log "📦 Actualizando dependencias..."
        flutter pub upgrade
        flutter pub deps
        log "${CHECK} Dependencias actualizadas"
        ;;
    
    "doctor")
        check_flutter
        log "${ANALYZE} Verificando configuración de Flutter..."
        flutter doctor -v
        ;;
    
    # Comandos de dispositivos
    "devices")
        check_flutter
        log "${DEVICE} Dispositivos disponibles:"
        flutter devices
        ;;
    
    "emulators")
        check_flutter
        log "${DEVICE} Emuladores disponibles:"
        flutter emulators
        echo ""
        log "${INFO} Para iniciar un emulador: flutter emulators --launch <emulator_id>"
        ;;
    
    # Comandos de información
    "logs")
        check_flutter
        log "${INFO} Mostrando logs en tiempo real..."
        log "${INFO} Presiona Ctrl+C para salir"
        flutter logs
        ;;
    
    "size")
        check_flutter
        log "${ANALYZE} Analizando tamaño del bundle..."
        flutter build apk --analyze-size
        ;;
    
    # Comandos especiales
    "setup")
        log "${ROCKET} Ejecutando configuración inicial..."
        ./scripts/setup.sh
        ;;
    
    "build-all")
        log "${BUILD} Ejecutando build para todas las plataformas..."
        ./scripts/build-all.sh
        ;;
    
    # Ayuda y comandos desconocidos
    "help"|"--help"|"-h"|"")
        show_help
        ;;
    
    *)
        log "${ERROR} Comando desconocido: $1"
        echo ""
        show_help
        exit 1
        ;;
esac