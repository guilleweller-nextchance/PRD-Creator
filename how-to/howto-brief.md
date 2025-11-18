# How-to: Brief

## Descripción
Este documento contiene las reglas y guías para crear y gestionar briefs en el proyecto.

## Reglas

### Creación del Project Brief

1. **Identifica el proyecto**: Si no está claro cuál es el proyecto en cuestión, pregunta al usuario

2. **Pregunta al usuario cada campo en orden** (espera la respuesta antes de continuar al siguiente):

   a. **Propósito del proyecto**
      - **Pregunta**: "¿Para qué hacemos el proyecto? ¿Cuál es el objetivo principal que queremos alcanzar?"
      - **Descripción para el usuario**: "Queremos entender la razón de ser del proyecto. ¿Qué problema resuelve o qué oportunidad aprovecha?"
      - **Ejemplo**: "Mejorar la experiencia de onboarding de nuevos usuarios para reducir la tasa de abandono en los primeros 7 días"

   b. **Breve descripción del qué**
      - **Pregunta**: "¿Qué vamos a construir exactamente? Describe de forma breve y clara qué entregable o solución vamos a desarrollar."
      - **Descripción para el usuario**: "Necesitamos una descripción concisa de lo que se va a crear. Piensa en qué entregarás al final del proyecto."
      - **Ejemplo**: "Un flujo de onboarding interactivo con tutoriales paso a paso y verificación de email optimizada"

   c. **Hipótesis de valor**
      - **Pregunta**: "¿Qué valor esperamos generar? ¿Qué impacto positivo tendrá este proyecto para nuestros usuarios o para el negocio?"
      - **Descripción para el usuario**: "Define el valor que este proyecto aportará. Puede ser para los usuarios finales, para el negocio, o para ambos."
      - **Ejemplo**: "Reducir el tiempo de activación de nuevos usuarios de 15 minutos a 5 minutos, mejorando su primera impresión y aumentando la retención a 30 días en un 25%"

   d. **Recursos necesarios**
      - **Pregunta**: "¿Qué recursos necesitamos para llevar a cabo este proyecto? (equipo, herramientas, presupuesto, tiempo, etc.)"
      - **Descripción para el usuario**: "Identifica todos los recursos que serán necesarios para completar el proyecto exitosamente."
      - **Ejemplo**: "1 diseñador UX (2 semanas), 2 desarrolladores frontend (3 semanas), acceso a herramientas de analytics, y 1 QA para testing (1 semana)"

3. **Crea el archivo del brief en la carpeta del proyecto**:
   - Crea un archivo Markdown en `projects/{nombre-del-proyecto}/brief/brief.md`
   - Si la carpeta `brief` no existe, créala
   - Guarda el contenido del brief en este archivo con el siguiente formato:

```
# Project Brief

## ¿Para qué hacemos el proyecto?

[aquí la respuesta del usuario sobre el propósito]

## Breve descripción del qué

[aquí la respuesta del usuario sobre qué se va a construir]

## Hipótesis de valor

[aquí la respuesta del usuario sobre el valor esperado]

## Recursos necesarios

[aquí la respuesta del usuario sobre los recursos requeridos]
```

4. **Actualiza la descripción del proyecto en Linear**:
   - Ve al proyecto correspondiente en Linear
   - Actualiza la descripción del proyecto con el mismo contenido del brief (en formato Markdown):

```
# Project Brief

## ¿Para qué hacemos el proyecto?

[aquí la respuesta del usuario sobre el propósito]

## Breve descripción del qué

[aquí la respuesta del usuario sobre qué se va a construir]

## Hipótesis de valor

[aquí la respuesta del usuario sobre el valor esperado]

## Recursos necesarios

[aquí la respuesta del usuario sobre los recursos requeridos]
```
