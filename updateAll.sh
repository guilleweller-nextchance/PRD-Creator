#!/bin/bash

# Script para actualizar todos los repositorios de Ditto
# Uso: ./updateAll.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PARENT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

# Colores para output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Repositorios a actualizar (en el directorio padre)
REPOS=(
    "ditto-api"
    "ditto-infrastructure"
    "ditto-webapp"
)

echo -e "${BLUE}🔄 Actualizando todos los repositorios de Ditto...${NC}"
echo ""

SUCCESS_COUNT=0
FAIL_COUNT=0

for repo in "${REPOS[@]}"; do
    REPO_PATH="$PARENT_DIR/$repo"
    
    if [ ! -d "$REPO_PATH" ]; then
        echo -e "${RED}❌ Carpeta '$repo' no encontrada en $PARENT_DIR${NC}"
        FAIL_COUNT=$((FAIL_COUNT + 1))
        continue
    fi
    
    echo -e "${BLUE}📦 Actualizando $repo...${NC}"
    cd "$REPO_PATH"
    
    # Verificar si es un repositorio git
    if [ ! -d ".git" ]; then
        echo -e "${YELLOW}⚠️  '$repo' no es un repositorio git, saltando...${NC}"
        continue
    fi
    
    # Ejecutar git pull
    if git pull origin main; then
        echo -e "${GREEN}✅ $repo actualizado exitosamente${NC}"
        SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
    else
        echo -e "${RED}❌ Error al actualizar $repo${NC}"
        FAIL_COUNT=$((FAIL_COUNT + 1))
    fi
    
    echo ""
done

# Volver al directorio del script
cd "$SCRIPT_DIR"

# Resumen
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}✅ Exitosos: $SUCCESS_COUNT${NC}"
if [ $FAIL_COUNT -gt 0 ]; then
    echo -e "${RED}❌ Fallidos: $FAIL_COUNT${NC}"
fi
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

if [ $FAIL_COUNT -eq 0 ]; then
    echo -e "${GREEN}🎉 Todos los repositorios actualizados correctamente!${NC}"
    exit 0
else
    echo -e "${RED}⚠️  Algunos repositorios fallaron al actualizar${NC}"
    exit 1
fi


