#!/bin/bash

# 🏗️ Script de build para todas las plataformas - Tienda Móvil
# Autor: Rafael
# Versión: 1.0.0

# Colores y emojis
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
PURPLE='\033[0;35m'
NC='\033[0m'

BUILD="🏗️"
CHECK="✅"
ERROR="❌"
ANDROID="🤖"
APPLE="🍎"
WEB="🌐"
DESKTOP="🖥️"
PACKAGE="📦"
ROCKET="🚀"

echo -e "${BLUE}${BUILD} Building Tienda Móvil para todas las plataformas...${NC}"
echo "================================================="

# Variables de configuración
BUILD_MODE="release"
VERBOSE=false
SKIP_TESTS=false
OUTPUT_DIR="build"

# Parsear argumentos
while [[ $# -gt 0 ]]; do
    case $1 in
        --debug)
            BUILD_MODE="debug"
            shift
            ;;
        --verbose)
            VERBOSE=true
            shift
            ;;
        --skip-tests)
            SKIP_TESTS=true
            shift
            ;;
        --output-dir)
            OUTPUT_DIR="$2"
            shift 2
            ;;
        --help|-h)
            echo "Uso: $0 [opciones]"
            echo "Opciones:"
            echo "  --debug       Build en modo debug (default: release)"
            echo "  --verbose     Output detallado"
            echo "  --skip-tests  Omitir tests"
            echo "  --output-dir  Directorio de salida (default: build)"
            echo "  --help, -h    Mostrar esta ayuda"
            exit 0
            ;;
        *)
            echo "Opción desconocida: $1"
            echo "Use --help para ver opciones disponibles"
            exit 1
            ;;
    esac
done

# Función para logging
log() {
    echo -e "$1"
    if [ "$VERBOSE" = true ]; then
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] $2" >> build.log
    fi
}

# Función para verificar éxito de comando
check_success() {
    if [ $? -eq 0 ]; then
        log "${CHECK} $1 completado exitosamente" "$1 SUCCESS"
        return 0
    else
        log "${ERROR} Error en $1" "$1 FAILED"
        return 1
    fi
}

# Crear directorio de salida
mkdir -p "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR/logs"

# Iniciar log
if [ "$VERBOSE" = true ]; then
    echo "Build iniciado en $(date)" > build.log
    echo "Modo: $BUILD_MODE" >> build.log
    echo "Directorio de salida: $OUTPUT_DIR" >> build.log
fi

# 1. Limpiar builds anteriores
log "\n🧹 Limpiando builds anteriores..." "CLEAN START"
flutter clean
check_success "Limpieza"

# 2. Obtener dependencias
log "\n${PACKAGE} Obteniendo dependencias..." "PUB GET START"
flutter pub get
check_success "Obtención de dependencias"

# 3. Ejecutar tests (si no se omiten)
if [ "$SKIP_TESTS" = false ]; then
    log "\n🧪 Ejecutando tests..." "TESTS START"
    flutter test
    check_success "Tests"
else
    log "\n⏭️ Omitiendo tests..." "TESTS SKIPPED"
fi

# 4. Verificar análisis de código
log "\n🔍 Analizando código..." "ANALYZE START"
flutter analyze
check_success "Análisis de código"

# 5. Build Android
log "\n${ANDROID} Building para Android..." "ANDROID BUILD START"
if [ "$BUILD_MODE" = "release" ]; then
    flutter build apk --release
    if check_success "Android APK Release"; then
        # Mover APK al directorio de salida
        cp build/app/outputs/flutter-apk/app-release.apk "$OUTPUT_DIR/tiendamovil-android.apk" 2>/dev/null
        
        # También generar App Bundle
        log "📱 Generando Android App Bundle..." "ANDROID AAB START"
        flutter build appbundle --release
        check_success "Android App Bundle"
        cp build/app/outputs/bundle/release/app-release.aab "$OUTPUT_DIR/tiendamovil-android.aab" 2>/dev/null
    fi
else
    flutter build apk --debug
    check_success "Android APK Debug"
    cp build/app/outputs/flutter-apk/app-debug.apk "$OUTPUT_DIR/tiendamovil-android-debug.apk" 2>/dev/null
fi

# 6. Build Web
log "\n${WEB} Building para Web..." "WEB BUILD START"
if [ "$BUILD_MODE" = "release" ]; then
    flutter build web --release
else
    flutter build web --debug
fi
if check_success "Web Build"; then
    # Comprimir build web
    if command -v tar &> /dev/null; then
        tar -czf "$OUTPUT_DIR/tiendamovil-web.tar.gz" -C build web
        log "📦 Web build comprimido en tiendamovil-web.tar.gz" "WEB COMPRESS"
    fi
fi

# 7. Build Desktop según la plataforma
log "\n${DESKTOP} Building para Desktop..." "DESKTOP BUILD START"

case "$OSTYPE" in
    darwin*)  
        # macOS
        log "${APPLE} Building para macOS..." "MACOS BUILD START"
        if [ "$BUILD_MODE" = "release" ]; then
            flutter build macos --release
        else
            flutter build macos --debug
        fi
        if check_success "macOS Build"; then
            # Crear DMG si es posible
            if [ -d "build/macos/Build/Products/Release/tiendamovil.app" ]; then
                log "📦 Copiando app de macOS..." "MACOS COPY"
                cp -r "build/macos/Build/Products/Release/tiendamovil.app" "$OUTPUT_DIR/" 2>/dev/null
            fi
        fi
        ;;
    linux*)   
        # Linux
        log "🐧 Building para Linux..." "LINUX BUILD START"
        if [ "$BUILD_MODE" = "release" ]; then
            flutter build linux --release
        else
            flutter build linux --debug
        fi
        if check_success "Linux Build"; then
            # Comprimir binarios de Linux
            if [ -d "build/linux/x64/release/bundle" ]; then
                tar -czf "$OUTPUT_DIR/tiendamovil-linux.tar.gz" -C build/linux/x64/release bundle
                log "📦 Linux build comprimido en tiendamovil-linux.tar.gz" "LINUX COMPRESS"
            fi
        fi
        ;;
    msys*|cygwin*)    
        # Windows
        log "🪟 Building para Windows..." "WINDOWS BUILD START"
        if [ "$BUILD_MODE" = "release" ]; then
            flutter build windows --release
        else
            flutter build windows --debug
        fi
        if check_success "Windows Build"; then
            # Comprimir ejecutable de Windows
            if [ -d "build/windows/runner/Release" ]; then
                if command -v zip &> /dev/null; then
                    cd build/windows/runner/Release
                    zip -r "../../../../$OUTPUT_DIR/tiendamovil-windows.zip" .
                    cd ../../../../
                    log "📦 Windows build comprimido en tiendamovil-windows.zip" "WINDOWS COMPRESS"
                fi
            fi
        fi
        ;;
esac

# 8. Generar información de build
log "\n📋 Generando información de build..." "BUILD INFO START"
cat > "$OUTPUT_DIR/build-info.txt" << EOF
Tienda Móvil - Información de Build
=====================================

Fecha: $(date)
Modo: $BUILD_MODE
Git Commit: $(git rev-parse --short HEAD 2>/dev/null || echo "N/A")
Git Branch: $(git branch --show-current 2>/dev/null || echo "N/A")
Flutter Version: $(flutter --version | head -n 1)
Dart Version: $(dart --version | head -n 1)

Archivos generados:
EOF

# Listar archivos generados
for file in "$OUTPUT_DIR"/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        size=$(du -h "$file" | cut -f1)
        echo "- $filename ($size)" >> "$OUTPUT_DIR/build-info.txt"
    fi
done

# 9. Generar checksums
log "\n🔐 Generando checksums..." "CHECKSUM START"
if command -v sha256sum &> /dev/null; then
    cd "$OUTPUT_DIR"
    sha256sum *.apk *.aab *.tar.gz *.zip 2>/dev/null > checksums.txt
    cd ..
    log "${CHECK} Checksums generados" "CHECKSUM SUCCESS"
elif command -v shasum &> /dev/null; then
    cd "$OUTPUT_DIR"
    shasum -a 256 *.apk *.aab *.tar.gz *.zip 2>/dev/null > checksums.txt
    cd ..
    log "${CHECK} Checksums generados (shasum)" "CHECKSUM SUCCESS"
fi

# 10. Resumen final
log "\n=================================================" "BUILD SUMMARY"
log "${CHECK} ${GREEN}¡Build completado exitosamente!${NC}" "BUILD COMPLETE"

echo -e "\n📁 Archivos generados en directorio '${OUTPUT_DIR}':"
ls -la "$OUTPUT_DIR" | grep -v "^d" | awk '{print "  " $9 " (" $5 " bytes)"}'

echo -e "\n🚀 Distribución:"
echo -e "• ${ANDROID} Android: APK y/o AAB listos para distribución"
echo -e "• ${WEB} Web: Archivos listos para hosting"
echo -e "• ${DESKTOP} Desktop: Ejecutables para la plataforma actual"

echo -e "\n📊 Información adicional:"
echo -e "• build-info.txt: Detalles del build"
echo -e "• checksums.txt: Verificación de integridad"
if [ "$VERBOSE" = true ]; then
    echo -e "• build.log: Log detallado del proceso"
fi

echo -e "\n💡 Próximos pasos:"
echo -e "1. Probar builds en dispositivos/plataformas objetivo"
echo -e "2. Subir a stores/repositorios correspondientes"
echo -e "3. Actualizar documentación de releases"

if [ "$BUILD_MODE" = "debug" ]; then
    echo -e "\n⚠️  ${YELLOW}Nota: Builds en modo DEBUG. Para producción usa modo RELEASE${NC}"
fi

echo -e "\n${ROCKET} ${GREEN}¡Happy deploying! 🎉${NC}"