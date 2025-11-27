# How-to: PRD

## Descripción
Este documento contiene las reglas y guías para crear PRDs (Product Requirements Documents) de manera estructurada, orquestando las diferentes perspectivas del equipo.

## Regla Fundamental: No Asumir, Verificar

**ANTES de hacer cualquier asunción sobre el estado del código:**
1. Busca evidencia en el código
2. Verifica configuraciones
3. Confirma con el usuario si hay dudas
4. Documenta tus hallazgos

**Si el Project Brief dice "añadir X" pero encuentras que X ya existe:**
- NO asumas que hay que reemplazarlo
- NO asumas que está mal implementado
- PREGUNTA al usuario qué quiere hacer exactamente

**Si el Project Brief menciona "reemplazar X por Y":**
- Verifica que X realmente existe y está configurado
- Verifica el estado actual de Y
- Confirma con el usuario el estado real antes de proceder

## Documentos de Referencia

Para crear un PRD completo, se deben consultar y seguir las reglas definidas en los siguientes documentos:

- **`how-to/prd-prod.md`**: Reglas y guías desde la perspectiva de Producto (secciones 1, 2, 3, 4, 5, 6, 7, 8)
- **`how-to/prd-design.md`**: Reglas y guías desde la perspectiva de Diseño (sección 5)

## Proceso de Creación de PRD

### Paso 1: Obtener Contexto del Proyecto

Antes de comenzar a crear el PRD, debes obtener toda la información disponible:

1. **Obtener el Project Brief del proyecto de Linear:**
   - Sigue el proceso documentado en `../.prdCreatorRules` para obtener el Project Brief
   - El Project Brief contiene información clave sobre el proyecto: qué queremos hacer, para qué, hipótesis de valor, recursos necesarios

1.2. **Leer el Glosario de Términos de Notion:**
   - Acceder al glosario de términos de la empresa: `https://www.notion.so/nextchance/Glosario-de-T-rminos-2b79dea2e40980b5b778c96ca3f37da2`
   - Usar `mcp_Notion_notion-fetch` para obtener el contenido del documento
   - Este documento ayuda a:
     - Usar la terminología correcta de la empresa en el PRD
     - Tener mejor contexto sobre los términos específicos del negocio
     - Aunque te apoyes principalmente en el código de los dittos, las respuestas del usuario y el Project Brief, este glosario complementa y refuerza el uso de la terminología adecuada
   - **Nota:** Aunque el documento pueda estar vacío actualmente, es importante consultarlo para mantener consistencia en la terminología

1.5. **Leer Iniciativas y KPIs de Notion (OBLIGATORIO):**
   - Acceder al documento de Notion de iniciativas Q4 25 / Q1 26: `https://www.notion.so/nextchance/Iniciativas-Q4-25-Q1-26-2b79dea2e409805fb86ef4f4ff0d0587`
   - Usar `mcp_Notion_notion-fetch` para obtener el contenido del documento
   - Extraer la tabla con las iniciativas (1-4) y sus KPIs asociados
   - Guardar esta información para usarla posteriormente en:
     - La pregunta de selección de iniciativa (Paso 2)
     - La alineación de métricas en la Sección 6 del PRD (Paso 3)
   - **Nota:** Si el documento de Notion no está disponible, el flujo debe continuar sin bloquearse, pero se debe informar al usuario

2. **Revisar el código del repositorio de Billionhands:**
   - **Asegurar código actualizado:** Ejecuta `prd-creator/updateAll.sh` para actualizar los repositorios `ditto-webapp`, `ditto-api` y `ditto-infrastructure` a su última versión antes de comenzar la revisión
   - **Objetivo:** Revisa el código del repositorio de Billionhands para obtener un entendimiento completo de cómo funciona el producto actualmente desde la perspectiva de **Product Manager** y **Usuario final**
   - **Enfoque:** El objetivo NO es entender la arquitectura técnica (lambdas, separación de código, etc.), sino entender:
     - Reglas de negocio y lógica de producto
     - Flujos de usuario y experiencias de uso
     - Restricciones y condiciones especiales del producto (ej: usuarios pueden hacer 3 acciones sin registro antes de registro obligatorio)
     - Funcionalidades existentes y cómo se comportan desde el punto de vista del usuario
     - Contexto del producto para poder aplicarlo en el resto del proceso de pensamiento

3. **Verificación del Estado Actual (OBLIGATORIO):**

   Ahora que ya conoces el código en general, verifica sistemáticamente los conceptos específicos mencionados en el Project Brief:

   a. **Extraer conceptos clave del Project Brief:**
      - Tecnologías mencionadas (ej: "Seedtag", "GAM", "banner sticky")
      - Acciones mencionadas (ej: "añadir", "reemplazar", "mejorar")
      - Funcionalidades mencionadas

   b. **Para cada concepto clave, verificar en el código:**
      - Usar `grep` y `codebase_search` para buscar referencias
      - Verificar si hay componentes, composables, o configuraciones relacionadas
      - Verificar archivos de configuración (variables de entorno, configs)
      - **NUNCA asumir que algo no existe sin haberlo verificado**

   c. **Verificar el estado de tecnologías relacionadas:**
      - Si el proyecto menciona "reemplazar X por Y", verificar:
        - ¿X realmente existe y está configurado?
        - ¿Y ya existe parcialmente?
        - ¿Cuál es el estado real de ambos?

   d. **Documentar hallazgos antes de continuar:**
      - Crear una lista de "Hallazgos de Verificación" con:
        - ✅ Lo que SÍ existe (con evidencia: archivos, líneas de código, configuraciones)
        - ❌ Lo que NO existe (después de búsqueda exhaustiva)
        - ⚠️ Lo que existe parcialmente (con detalles de qué falta)
      - **Compartir estos hallazgos con el usuario antes de continuar**
      - Si encuentras discrepancias entre el Project Brief y el código, **DEBES preguntar al usuario** para clarificar

   e. **Regla crítica:** Si encuentras que algo mencionado en el Project Brief ya existe, DEBES preguntar al usuario si quiere:
      - Mejorar/iterar sobre lo existente
      - Reemplazarlo completamente
      - Añadir funcionalidad nueva relacionada

4. **Revisar información del proyecto en Linear:**
   - Obtén los detalles del proyecto usando `mcp_linear_get_project`
   - Revisa la descripción, estado, y cualquier información adicional del proyecto

### Paso 2: Checklist Pre-PRD y Hacer Preguntas Clarificadoras

**Checklist Pre-PRD (DEBE completarse antes de continuar):**

Antes de hacer preguntas clarificadoras o generar el PRD, verifica que tienes confirmación de:

- [ ] Estado actual de tecnologías mencionadas (¿existen? ¿están configuradas?)
- [ ] Si hay funcionalidad existente relacionada, ¿cuál es su estado?
- [ ] ¿El usuario quiere reemplazar, mejorar, o añadir nueva funcionalidad? (si aplica)
- [ ] Todas las asunciones técnicas han sido verificadas en el código
- [ ] Los "hechos" mencionados en el Project Brief están respaldados por evidencia del código
- [ ] Se han compartido los hallazgos de verificación con el usuario y se han resuelto discrepancias

**Si alguna casilla no está verificada, DEBES preguntar al usuario o verificar en el código antes de continuar.**

**IMPORTANTE:** Antes de escribir el PRD, **DEBES** hacer preguntas clarificadoras al usuario para recopilar suficiente detalle. El objetivo es entender el "qué" y el "por qué" de la funcionalidad, no necesariamente el "cómo" (que el desarrollador determinará).

**PRIMERA PREGUNTA OBLIGATORIA - Selección de Iniciativa:**
- **DEBES** hacer esta pregunta PRIMERO, antes que cualquier otra pregunta clarificadora
- Pregunta: "¿A qué iniciativa pertenece este PRD?"
- Formato: Presenta las 4 iniciativas extraídas de Notion con opciones A, B, C, D
  - Opción A: Iniciativa 1 - [Nombre y descripción breve]
  - Opción B: Iniciativa 2 - [Nombre y descripción breve]
  - Opción C: Iniciativa 3 - [Nombre y descripción breve]
  - Opción D: Iniciativa 4 - [Nombre y descripción breve]
- Guarda la iniciativa seleccionada por el usuario (esta información NO se guardará en Linear, solo se usará para contexto interno y alineación de métricas)
- Si no se pudieron leer las iniciativas de Notion, pregunta al usuario directamente qué iniciativa corresponde

**PREGUNTA OPCIONAL - Propuesta de Producto:**
- **OPCIONAL:** Después de la pregunta de iniciativa y las preguntas de afinamiento, pregunta al usuario: "¿Te gustaría añadir una propuesta de producto a este PRD?"
- Si el usuario responde afirmativamente, solicita la propuesta de producto
- Guarda la propuesta proporcionada para usarla como contexto y valoración al generar el PRD
- **IMPORTANTE:** La propuesta se utilizará para enriquecer y valorar el contenido del PRD (secciones 1-8), pero NO se creará una sección 9 separada. La propuesta debe integrarse en el contexto y consideración del PRD, no copiarse literalmente. Úsala para mejorar la calidad y profundidad de las secciones existentes

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

El PRD generado debe incluir las siguientes 8 secciones. **Cada sección debe seguir las reglas definidas en su documento de referencia correspondiente:**

**IMPORTANTE:** Si el usuario proporcionó una propuesta de producto durante las preguntas clarificadoras, úsala como contexto y valoración para enriquecer las secciones 1-8, pero NO crees una sección 9 separada. La propuesta debe integrarse en el contexto y consideración del PRD.

### Formato Markdown del PRD

El PRD debe seguir esta estructura de formato Markdown:

```markdown
# [Nombre del Proyecto] - PRD

## 1. 📋 Introducción/Resumen

[Contenido de la introducción]

## 2. 🎯 Objetivos

[Contenido de los objetivos]

## 3. 👤 User Stories

[Contenido de las user stories]

## 4. 🚫 No-Goals (Fuera de Alcance)

[Contenido de los no-goals]

## 5. 🎨 Consideraciones de Diseño

[Contenido de las consideraciones de diseño]

## 6. 📊 Métricas de Éxito

[Contenido de las métricas de éxito]

## 7. ⚠️ Riesgos y Mitigadores

- ⚠️ **Riesgo**: [Descripción del riesgo]
  - ✅ **Mitigador**: [Descripción del mitigador]

## 8. ❓ Preguntas Abiertas

[Contenido de preguntas abiertas]
```

**Reglas de formato:**
- Usa `#` para el título principal del PRD
- Usa `##` para cada sección numerada (1-8)
- Usa listas con viñetas (`-`) o numeradas (`1.`) según corresponda
- Usa **negrita** para énfasis en términos importantes
- Usa `código` para referencias técnicas, nombres de archivos, o comandos
- Mantén una estructura jerárquica clara y consistente
- **IMPORTANTE - Emojis consistentes:** Cada sección debe incluir un emoji específico y consistente. **NUNCA cambies los emojis entre diferentes PRDs**. Los emojis a usar son:
  - `## 1. 📋 Introducción/Resumen` - Para la sección de introducción
  - `## 2. 🎯 Objetivos` - Para la sección de objetivos
  - `## 3. 👤 User Stories` - Para la sección de user stories
  - `## 4. 🚫 No-Goals (Fuera de Alcance)` - Para la sección de no-goals
  - `## 5. 🎨 Consideraciones de Diseño` - Para la sección de diseño
  - `## 6. 📊 Métricas de Éxito` - Para la sección de métricas
  - `## 7. ⚠️ Riesgos y Mitigadores` - Para la sección de riesgos (usa ⚠️ antes de cada riesgo, ✅ antes de cada mitigador)
  - `## 8. ❓ Preguntas Abiertas` - Para la sección de preguntas abiertas

### 1. Introducción/Resumen
- **Documento de referencia:** `prd-prod.md`
- **Formato:** Sección con `## 1. 📋 Introducción/Resumen`
- Describe brevemente la funcionalidad y el problema que resuelve
- Indica el objetivo principal

### 2. Objetivos
- **Documento de referencia:** `prd-prod.md`
- **Formato:** Sección con `## 2. 🎯 Objetivos`
- Lista los objetivos específicos y medibles para esta funcionalidad
- Usa listas con viñetas o numeradas según corresponda

### 3. User Stories
- **Documento de referencia:** `prd-prod.md`
- **Formato:** Sección con `## 3. 👤 User Stories`
- Detalla las narrativas de usuario que describen el uso de la funcionalidad y sus beneficios
- Formato sugerido: "Como [tipo de usuario], quiero [acción] para [beneficio]"

### 4. No-Goals (Fuera de Alcance)
- **Documento de referencia:** `prd-prod.md`
- **Formato:** Sección con `## 4. 🚫 No-Goals (Fuera de Alcance)`
- Indica claramente qué NO incluirá esta funcionalidad para gestionar el alcance
- Usa listas con viñetas para cada no-goal

### 5. Consideraciones de Diseño
- **Documento de referencia:** `prd-design.md`
- **Formato:** Sección con `## 5. 🎨 Consideraciones de Diseño`
- Enlaces a mockups, descripción de requisitos UI/UX, o mención de componentes/estilos relevantes si aplica
- Usa formato de enlaces Markdown: `[texto del enlace](URL)`

### 6. Métricas de Éxito
- **Documento de referencia:** `prd-prod.md`
- **Formato:** Sección con `## 6. 📊 Métricas de Éxito`
- ¿Cómo se medirá el éxito de esta funcionalidad? (ej: "Aumentar el engagement de usuarios en un 10%", "Reducir tickets de soporte relacionados con X")
- Usa listas con viñetas para cada métrica
- **Alineación con KPIs de la Iniciativa (opcional pero recomendado):**
  - Si el usuario seleccionó una iniciativa en el Paso 2, incluye los KPIs de esa iniciativa como referencia
  - Las métricas propuestas deben alinearse (no obligatorio) con los KPIs de la iniciativa seleccionada cuando sea posible
  - Mantén flexibilidad para incluir métricas específicas del PRD que puedan no estar directamente en los KPIs de la iniciativa
  - Formato sugerido: Incluir una subsección o nota que mencione la alineación con los KPIs de la iniciativa, seguida de las métricas específicas del PRD

### 7. Riesgos y Mitigadores
- **Documento de referencia:** `prd-prod.md`
- **Formato:** Sección con `## 7. ⚠️ Riesgos y Mitigadores`
- Lista cualquier riesgo relevante, ya sea de valor, usabilidad, técnico o de negocio, y sus mitigadores
- **Formato obligatorio:** 
  - Usa `- ⚠️ **Riesgo**:` antes de cada riesgo
  - Usa `  - ✅ **Mitigador**:` antes de cada mitigador (con indentación de 2 espacios)
- Ejemplo:
  ```markdown
  - ⚠️ **Riesgo**: Descripción del riesgo
    - ✅ **Mitigador**: Descripción del mitigador
  ```

### 8. Preguntas Abiertas
- **Documento de referencia:** `prd-prod.md`
- **Formato:** Sección con `## 8. ❓ Preguntas Abiertas`
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

## Template de Verificación Pre-PRD

Antes de generar el PRD, completa este template y compártelo con el usuario si hay discrepancias:

### Tecnologías/Conceptos del Project Brief:
- [Concepto 1]: [Estado encontrado] - [Evidencia: archivos, líneas de código, configuraciones]
- [Concepto 2]: [Estado encontrado] - [Evidencia: archivos, líneas de código, configuraciones]

### Funcionalidades mencionadas:
- [Funcionalidad 1]: [¿Existe?] - [Ubicación en código si existe]
- [Funcionalidad 2]: [¿Existe?] - [Ubicación en código si existe]

### Discrepancias encontradas:
- [Lista de discrepancias entre Project Brief y código real]

### Preguntas para el usuario:
- [Lista de preguntas antes de continuar]

## Instrucciones Finales

1. **NO** comiences a implementar el PRD
2. **SIEMPRE** verifica el estado actual del código antes de hacer asunciones
3. **SIEMPRE** comparte hallazgos de verificación con el usuario si hay discrepancias
4. **Asegúrate** de hacer preguntas clarificadoras al usuario antes de generar el PRD
5. **Toma** las respuestas del usuario a las preguntas clarificadoras y mejora el PRD con esa información
6. **Consulta siempre** los 2 documentos de referencia (`prd-prod.md`, `prd-design.md`) para seguir las reglas específicas de cada sección
7. **Usa** el entendimiento del código del repositorio de Billionhands como referencia principal para el contexto del producto
8. **Mantén** un formato consistente y profesional
9. **Escribe** todos los documentos en español
