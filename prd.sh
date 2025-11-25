#!/bin/bash

# Script para gestionar el repositorio PRD-Creator
# Uso: ./prd.sh push|get

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$REPO_DIR"

# Verificar que estamos en el repo correcto de prd-creator
if [ ! -f ".prdCreatorRules" ]; then
    echo "❌ Error: Este script debe ejecutarse desde el directorio prd-creator"
    exit 1
fi

# Verificar que es un repo git
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "❌ Error: Este directorio no es un repositorio git"
    exit 1
fi

# Verificar que el remote es el correcto
EXPECTED_REMOTE="https://github.com/guilleweller-nextchance/PRD-Creator.git"
ACTUAL_REMOTE=$(git remote get-url origin 2>/dev/null || echo "")
if [ "$ACTUAL_REMOTE" != "$EXPECTED_REMOTE" ]; then
    echo "❌ Error: El remote no coincide con el repo PRD-Creator"
    echo "   Esperado: $EXPECTED_REMOTE"
    echo "   Actual: $ACTUAL_REMOTE"
    exit 1
fi

case "$1" in
    push)
        echo "📤 Subiendo cambios al repositorio PRD-Creator..."
        
        # Verificar si hay cambios usando git status --porcelain
        # Esto detecta: modificados, nuevos, borrados, renombrados, etc.
        # Es más confiable que múltiples verificaciones separadas
        CHANGES=$(git status --porcelain)
        if [ -z "$CHANGES" ]; then
            echo "ℹ️  No hay cambios para subir en el repositorio PRD-Creator."
            echo ""
            echo "💡 Nota: Si ves archivos marcados como modificados en tu IDE,"
            echo "   pueden pertenecer al repositorio padre (billionhands)."
            echo "   Este script solo gestiona el repositorio PRD-Creator."
            exit 0
        fi
        
        # Mostrar estado
        echo "📋 Estado actual del repositorio PRD-Creator:"
        git status --short
        
        # Agregar todos los cambios, incluyendo archivos borrados
        # -A (--all) agrega cambios, nuevos archivos y archivos borrados
        git add -A .
        
        # Verificar si hay algo en staging después de agregar
        if git diff --cached --quiet; then
            echo "ℹ️  No hay cambios para subir después de agregar archivos."
            exit 0
        fi
        
        # Pedir mensaje de commit si no se proporciona
        if [ -z "$2" ]; then
            echo ""
            read -p "💬 Mensaje de commit: " commit_message
            if [ -z "$commit_message" ]; then
                commit_message="Actualización automática"
            fi
        else
            commit_message="$2"
        fi
        
        # Hacer commit
        git commit -m "$commit_message"
        
        # Push
        git push
        
        echo "✅ Cambios subidos exitosamente!"
        ;;
        
    get)
        echo "📥 Obteniendo cambios del repositorio..."
        git pull
        echo "✅ Repositorio actualizado!"
        ;;
        
    status)
        echo "📊 Estado del repositorio:"
        git status
        echo ""
        echo "📋 Archivos borrados localmente (no rastreados por git):"
        deleted_files=$(git ls-files --deleted 2>/dev/null || true)
        if [ -z "$deleted_files" ]; then
            echo "   (ninguno)"
        else
            echo "$deleted_files" | sed 's/^/   - /'
            echo ""
            echo "💡 Tip: Ejecuta './prd.sh push' para sincronizar los archivos borrados con el remoto"
        fi
        ;;
        
    *)
        echo "Uso: $0 {push|get|status}"
        echo ""
        echo "Comandos:"
        echo "  push [mensaje]  - Sube cambios al repositorio (opcional: mensaje de commit)"
        echo "  get             - Obtiene cambios del repositorio"
        echo "  status          - Muestra el estado del repositorio"
        exit 1
        ;;
esac

