#!/bin/bash

# Script para gestionar el repositorio PRD-Creator
# Uso: ./prd.sh push|get

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$REPO_DIR"

case "$1" in
    push)
        echo "📤 Subiendo cambios al repositorio..."
        
        # Verificar si hay cambios
        if git diff --quiet && git diff --cached --quiet; then
            echo "ℹ️  No hay cambios para subir."
            exit 0
        fi
        
        # Mostrar estado
        echo "📋 Estado actual:"
        git status --short
        
        # Agregar todos los cambios
        git add .
        
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

