# How-to: PRD

## Descripción
Este documento contiene las reglas y guías para crear PRDs (Product Requirements Documents) de manera estructurada, orquestando las diferentes perspectivas del equipo.

## Documentos de Referencia

Para crear un PRD completo, se deben consultar y seguir las reglas definidas en los siguientes documentos:

- **`how-to/prd-prod.md`**: Reglas y guías desde la perspectiva de Producto (secciones 1, 2, 3, 4, 5, 6, 7, 8)
- **`how-to/prd-design.md`**: Reglas y guías desde la perspectiva de Diseño (sección 5)

## Proceso de Creación de PRD

### Paso 1: Obtener Contexto del Proyecto

Antes de comenzar a crear el PRD, debes obtener toda la información disponible:

1. **Obtener el Project Brief del proyecto de Linear:**
   - Sigue el proceso documentado en `.cursorrules` para obtener el Project Brief
   - El Project Brief contiene información clave sobre el proyecto: qué queremos hacer, para qué, hipótesis de valor, recursos necesarios

2. **Revisar el código del repositorio de Billionhands:**
   - Revisa el código del repositorio de Billionhands para obtener un entendimiento completo de cómo funciona el proyecto actualmente, tanto desde el punto de vista técnico como de usuario
   - Esto incluye entender reglas de negocio, flujos de usuario, restricciones técnicas, y cualquier condición especial (ej: usuarios pueden hacer 3 acciones sin registro antes de registro obligatorio)
   - **Nota:** El método de acceso al repositorio está por definir (TBD) por el equipo técnico

3. **Revisar información del proyecto en Linear:**
   - Obtén los detalles del proyecto usando `mcp_linear_get_project`
   - Revisa la descripción, estado, y cualquier información adicional del proyecto

### Paso 2: Hacer Preguntas Clarificadoras

**IMPORTANTE:** Antes de escribir el PRD, **DEBES** hacer preguntas clarificadoras al usuario para recopilar suficiente detalle. El objetivo es entender el "qué" y el "por qué" de la funcionalidad, no necesariamente el "cómo" (que el desarrollador determinará).

**Formato de preguntas:**
- Proporciona opciones en listas con letras/números para que el usuario pueda responder fácilmente con sus selecciones
- Adapta las preguntas según el prompt inicial y el Project Brief obtenido

**Áreas comunes a explorar (consulta `prd-prod.md` para reglas específicas):**
- **Problema/Objetivo:** "¿Qué problema resuelve esta funcionalidad para el usuario?" o "¿Cuál es el objetivo principal que queremos lograr?"
- **Usuario objetivo:** "¿Quién es el usuario principal de esta funcionalidad?"
- **Funcionalidad principal:** "¿Puedes describir las acciones clave que un usuario debería poder realizar con esta funcionalidad?"
- **User Stories:** "¿Podrías proporcionar algunas user stories? (ej: Como [tipo de usuario], quiero [realizar una acción] para [beneficio])"
- **Criterios de aceptación:** "¿Cómo sabremos que esta funcionalidad está implementada exitosamente? ¿Cuáles son los criterios clave de éxito?"
- **Alcance/Límites:** "¿Hay algo específico que esta funcionalidad NO debe hacer (no-goals)?"
- **Requisitos de datos:** "¿Qué tipo de datos necesita esta funcionalidad para mostrar o manipular?"
- **Casos límite:** "¿Hay casos límite o condiciones de error que deberíamos considerar?"

### Paso 3: Generar el PRD

Basándote en:
- El Project Brief obtenido
- Las respuestas del usuario a las preguntas clarificadoras
- El entendimiento del código del repositorio de Billionhands
- Las reglas de los 2 documentos de referencia

Genera un PRD completo usando la estructura definida a continuación.

## Estructura del PRD

El PRD generado debe incluir las siguientes secciones. **Cada sección debe seguir las reglas definidas en su documento de referencia correspondiente:**

### Formato Markdown del PRD

El PRD debe seguir esta estructura de formato Markdown:

```markdown
# [Nombre del Proyecto] - PRD

## 1. Introducción/Resumen

[Contenido de la introducción]

## 2. Objetivos

[Contenido de los objetivos]

## 3. User Stories

[Contenido de las user stories]

## 4. No-Goals (Fuera de Alcance)

[Contenido de los no-goals]

## 5. Consideraciones de Diseño

[Contenido de las consideraciones de diseño]

## 6. Métricas de Éxito

[Contenido de las métricas de éxito]

## 7. Riesgos y Mitigadores

[Contenido de riesgos y mitigadores]

## 8. Preguntas Abiertas

[Contenido de preguntas abiertas]
```

**Reglas de formato:**
- Usa `#` para el título principal del PRD
- Usa `##` para cada sección numerada (1-8)
- Usa listas con viñetas (`-`) o numeradas (`1.`) según corresponda
- Usa **negrita** para énfasis en términos importantes
- Usa `código` para referencias técnicas, nombres de archivos, o comandos
- Mantén una estructura jerárquica clara y consistente

### 1. Introducción/Resumen
- **Documento de referencia:** `prd-prod.md`
- **Formato:** Sección con `## 1. Introducción/Resumen`
- Describe brevemente la funcionalidad y el problema que resuelve
- Indica el objetivo principal

### 2. Objetivos
- **Documento de referencia:** `prd-prod.md`
- **Formato:** Sección con `## 2. Objetivos`
- Lista los objetivos específicos y medibles para esta funcionalidad
- Usa listas con viñetas o numeradas según corresponda

### 3. User Stories
- **Documento de referencia:** `prd-prod.md`
- **Formato:** Sección con `## 3. User Stories`
- Detalla las narrativas de usuario que describen el uso de la funcionalidad y sus beneficios
- Formato sugerido: "Como [tipo de usuario], quiero [acción] para [beneficio]"

### 4. No-Goals (Fuera de Alcance)
- **Documento de referencia:** `prd-prod.md`
- **Formato:** Sección con `## 4. No-Goals (Fuera de Alcance)`
- Indica claramente qué NO incluirá esta funcionalidad para gestionar el alcance
- Usa listas con viñetas para cada no-goal

### 5. Consideraciones de Diseño
- **Documento de referencia:** `prd-design.md`
- **Formato:** Sección con `## 5. Consideraciones de Diseño`
- Enlaces a mockups, descripción de requisitos UI/UX, o mención de componentes/estilos relevantes si aplica
- Usa formato de enlaces Markdown: `[texto del enlace](URL)`

### 6. Métricas de Éxito
- **Documento de referencia:** `prd-prod.md`
- **Formato:** Sección con `## 6. Métricas de Éxito`
- ¿Cómo se medirá el éxito de esta funcionalidad? (ej: "Aumentar el engagement de usuarios en un 10%", "Reducir tickets de soporte relacionados con X")
- Usa listas con viñetas para cada métrica

### 7. Riesgos y Mitigadores
- **Documento de referencia:** `prd-prod.md`
- **Formato:** Sección con `## 7. Riesgos y Mitigadores`
- Lista cualquier riesgo relevante, ya sea de valor, usabilidad, técnico o de negocio, y sus mitigadores
- Formato sugerido: Para cada riesgo, incluye el riesgo y su mitigador correspondiente

### 8. Preguntas Abiertas
- **Documento de referencia:** `prd-prod.md`
- **Formato:** Sección con `## 8. Preguntas Abiertas`
- Lista cualquier pregunta pendiente o área que necesite mayor clarificación
- Usa listas con viñetas para cada pregunta

## Audiencia Objetivo

Asume que el lector principal del PRD es un **desarrollador junior**. Por lo tanto, los requisitos deben ser:
- Explícitos
- Sin ambigüedades
- Evitar jerga cuando sea posible
- Proporcionar suficiente detalle para que entiendan el propósito de la funcionalidad y la lógica principal

## Guardar el PRD

### Formato y Ubicación
- **Formato:** Markdown (`.md`)
- **Ubicación:** `projects/` (directamente en la carpeta projects)
- **Nombre del archivo:** `prd-{nombre-proyecto-resumido}.md` (ej: `prd-modal-pre-registro.md`)

### Estructura de Archivos
- El nombre del proyecto debe estar resumido y en minúsculas con guiones
- Ejemplos:
  - `modal-pre-registro` → `prd-modal-pre-registro.md`
  - `programa-de-puntos-v1` → `prd-programa-de-puntos-v1.md`
  - `dashboard-agencias` → `prd-dashboard-agencias.md`

## Instrucciones Finales

1. **NO** comiences a implementar el PRD
2. **Asegúrate** de hacer preguntas clarificadoras al usuario antes de generar el PRD
3. **Toma** las respuestas del usuario a las preguntas clarificadoras y mejora el PRD con esa información
4. **Consulta siempre** los 2 documentos de referencia (`prd-prod.md`, `prd-design.md`) para seguir las reglas específicas de cada sección
5. **Usa** el entendimiento del código del repositorio de Billionhands como referencia principal para el contexto del producto
6. **Mantén** un formato consistente y profesional
7. **Escribe** todos los documentos en español
