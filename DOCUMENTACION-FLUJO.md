# Cómo Funciona el Generador de PRDs

## ¿Qué es esto?

Imagina que tienes un proyecto en Linear y necesitas crear un documento PRD (Product Requirements Document) que explique claramente qué se va a construir, por qué y cómo. El generador de PRDs es un sistema que hace esto de forma automática, pero de manera inteligente: no solo copia información, sino que la entiende, la verifica y la estructura de forma profesional.

## El Proceso: De un Proyecto de Linear a un PRD Completo

### El Punto de Partida

Todo comienza cuando le das al sistema un proyecto de Linear. Puede ser una URL del proyecto, su nombre, o simplemente mencionar de qué proyecto se trata. El sistema lo primero que hace es encontrarlo en Linear para asegurarse de que estamos hablando del proyecto correcto.

### Recolectando el Contexto

Una vez que encuentra el proyecto, el sistema empieza a recopilar toda la información que necesita para entender de qué va el proyecto:

**1. El Project Brief**
El sistema busca el documento "Project Brief" asociado al proyecto en Linear. Este documento contiene la información clave: qué queremos hacer, para qué, qué hipótesis de valor tenemos, y qué recursos necesitamos. Es como la hoja de ruta inicial del proyecto.

**2. El Glosario de Términos**
Para asegurarse de usar la terminología correcta de la empresa, el sistema consulta el glosario de términos en Notion. Esto garantiza que cuando hable de "rankings", "items" o cualquier concepto específico, lo haga usando las palabras exactas que usa el equipo.

**3. Las Iniciativas y sus KPIs**
El sistema también lee el documento de iniciativas estratégicas de la empresa. Esto le permite entender en qué contexto más amplio se enmarca este proyecto y qué métricas de éxito están definidas a nivel estratégico. Más adelante, esto ayudará a alinear las métricas del PRD con los objetivos de la iniciativa.

**4. El Estado Real del Código**
Aquí viene una parte importante: el sistema no asume nada. Antes de escribir el PRD, actualiza su conocimiento del código del producto y luego verifica sistemáticamente cada cosa que menciona el Project Brief.

Por ejemplo, si el Project Brief dice "añadir un modal de registro", el sistema primero verifica:
- ¿Ya existe algún modal de registro?
- ¿Hay alguna funcionalidad relacionada?
- ¿Cuál es el estado actual de esta funcionalidad?

El sistema busca en el código, encuentra evidencia, y documenta lo que encuentra:
- ✅ Lo que sí existe (y dónde está)
- ❌ Lo que no existe (después de buscar exhaustivamente)
- ⚠️ Lo que existe parcialmente (y qué falta)

**5. Compartir Hallazgos**
Antes de continuar, el sistema comparte estos hallazgos contigo. Si encuentra discrepancias entre lo que dice el Project Brief y lo que realmente existe en el código, te pregunta para clarificar. Por ejemplo: "Veo que ya existe un modal de registro. ¿Quieres mejorarlo, reemplazarlo completamente, o añadir funcionalidad nueva?"

Esta verificación es crucial porque evita que el PRD se base en suposiciones incorrectas. El código es la fuente de verdad.

### Entendiendo el Producto

Mientras recopila información, el sistema también se sumerge en el código del producto para entender cómo funciona realmente. No busca entender la arquitectura técnica (cómo están organizados los archivos o qué tecnologías se usan), sino entender el producto desde la perspectiva de un Product Manager y de un usuario final:

- ¿Qué reglas de negocio existen? (Por ejemplo: "los usuarios pueden hacer 3 acciones sin registro antes de que se les pida registrarse")
- ¿Cómo fluye la experiencia del usuario?
- ¿Qué restricciones o condiciones especiales hay?
- ¿Cómo se comportan las funcionalidades existentes?

Este entendimiento le permite escribir un PRD que tenga sentido en el contexto real del producto, no solo en teoría.

### Haciendo Preguntas Inteligentes

Antes de escribir el PRD, el sistema te hace preguntas para entender mejor lo que necesitas. No son preguntas al azar, sino preguntas estratégicas:

**La Primera Pregunta (Obligatoria)**
"¿A qué iniciativa pertenece este PRD?" El sistema te presenta las 4 iniciativas estratégicas de la empresa (A, B, C, D) para que elijas. Esto ayuda a alinear las métricas del PRD con los objetivos de la iniciativa.

**Preguntas de Afinamiento**
Luego hace preguntas más específicas sobre el proyecto:
- ¿Qué problema resuelve esta funcionalidad para el usuario?
- ¿Quién es el usuario principal?
- ¿Cuáles son las acciones clave que debería poder realizar?
- ¿Cómo sabremos que está implementado exitosamente?
- ¿Qué NO debe hacer esta funcionalidad?
- ¿Hay casos límite o condiciones especiales?

**Pregunta Opcional**
"¿Te gustaría añadir una propuesta de producto a este PRD?" Si respondes que sí, te pide la propuesta. Esta propuesta se utilizará para enriquecer y valorar el contenido del PRD, integrándose en el contexto de las secciones existentes, pero no se creará una sección separada para ella.

### Generando el PRD

Con toda esta información recopilada, el sistema genera el PRD completo. Pero no lo hace de cualquier manera: sigue reglas específicas que combinan las perspectivas de Producto y Diseño.

**La Estructura del PRD**

Cada PRD tiene 8 secciones, cada una con un propósito específico:

1. **Introducción/Resumen** 📋
   Empieza explicando el problema que se resuelve y por qué es importante resolverlo ahora. Es conciso, 2-3 párrafos máximo.

2. **Objetivos** 🎯
   Lista objetivos específicos, medibles y alcanzables. Cada objetivo es claro y directo, sin ambigüedades.

3. **User Stories** 👤
   Describe las narrativas de usuario en formato "Como [tipo de usuario], quiero [acción] para [beneficio]". Se enfoca en el valor para el usuario, no en características técnicas.

4. **No-Goals (Fuera de Alcance)** 🚫
   Indica claramente qué NO se incluirá. Esto ayuda a gestionar expectativas y mantener el foco del proyecto.

5. **Consideraciones de Diseño** 🎨
   Describe los requisitos de diseño desde la perspectiva de UX. No es solo una lista de reglas, sino una narrativa que explica el flujo del usuario: quién es, desde dónde llega, qué ve primero, qué decisiones toma, qué obstáculos encuentra, y cómo sabe que ha terminado con éxito.

6. **Métricas de Éxito** 📊
   Define métricas específicas y medibles. Si seleccionaste una iniciativa, incluye los KPIs de esa iniciativa como referencia y alinea las métricas del PRD con ellos cuando sea posible.

7. **Riesgos y Mitigadores** ⚠️
   Identifica riesgos reales (no hipotéticos) y propone mitigadores concretos para cada uno. Es honesto sobre los riesgos técnicos y de negocio.

8. **Preguntas Abiertas** ❓
   Lista solo las preguntas críticas que necesitan respuesta antes de comenzar la implementación. Evita preguntas obvias o que ya tienen respuesta.

**Las Reglas que Sigue**

El sistema no escribe el PRD de forma arbitraria. Sigue reglas específicas:

- **Perspectiva de Producto**: Las secciones 1, 2, 3, 4, 6, 7, 8 siguen principios de Product Management estilo Marty Cagan: simple, directo, sin florituras. Prioriza claridad sobre elegancia, se enfoca en el problema antes que en la solución, y basa decisiones en evidencia. Si proporcionaste una propuesta de producto, esta se integra en el contexto y valoración de estas secciones para enriquecerlas.

- **Perspectiva de Diseño**: La sección 5 sigue principios fundamentales de UX: reduce fricción, minimiza carga cognitiva, prioriza claridad, diseña para el caso de uso más común, considera el contexto de uso, mantiene consistencia, y asegura accesibilidad.

- **Audiencia**: El PRD está escrito asumiendo que el lector principal es un desarrollador junior. Por eso es explícito, sin ambigüedades, evita jerga cuando es posible, y proporciona suficiente detalle para entender el propósito y la lógica principal.

- **Consistencia**: Cada sección tiene un emoji específico que nunca cambia entre PRDs. El formato es consistente y profesional.

### Guardando y Actualizando

Una vez generado el PRD completo, el sistema:

1. **Lo guarda localmente** en un formato estándar (Markdown) con un nombre descriptivo basado en el nombre del proyecto.

2. **Te pide confirmación** antes de hacer cualquier cambio en Linear. Te muestra un resumen de lo que se va a subir y espera tu confirmación explícita.

3. **Actualiza el proyecto en Linear** con el contenido completo del PRD en la descripción del proyecto, solo después de que confirmes.

## ¿Por Qué Este Proceso?

Este proceso puede parecer largo, pero cada paso tiene un propósito:

- **Verificar antes de asumir** evita que el PRD se base en información incorrecta
- **Recopilar contexto de múltiples fuentes** asegura que el PRD esté alineado con la estrategia y use la terminología correcta
- **Hacer preguntas clarificadoras** garantiza que el PRD capture lo que realmente necesitas, no solo lo que dice el Project Brief
- **Seguir reglas específicas** asegura que cada PRD sea consistente, profesional y útil
- **Pedir confirmaciones** evita cambios no deseados en Linear

## El Resultado Final

Al final del proceso, tienes un PRD completo que:

- ✅ Está basado en información verificada, no en suposiciones
- ✅ Está alineado con la estrategia de la empresa (iniciativas y KPIs)
- ✅ Usa la terminología correcta de la empresa
- ✅ Tiene en cuenta el estado real del producto
- ✅ Incluye las perspectivas de Producto y Diseño
- ✅ Está escrito de forma clara y accesible
- ✅ Está guardado localmente y actualizado en Linear

## Un Ejemplo Práctico

Imagina que tienes un proyecto llamado "Modal de Pre-registro" en Linear. El proceso sería así:

1. Le das al sistema la URL o el nombre del proyecto
2. El sistema encuentra el proyecto en Linear y obtiene su Project Brief
3. Lee el glosario de términos y las iniciativas de Notion
4. Actualiza su conocimiento del código y verifica: ¿existe ya algún modal de registro? ¿Cómo funciona el registro actual?
5. Te comparte lo que encontró: "Veo que ya existe un sistema de registro. ¿Quieres mejorar el modal existente o crear uno nuevo para pre-registro?"
6. Te pregunta a qué iniciativa pertenece (A, B, C o D)
7. Te hace preguntas adicionales sobre el problema, los usuarios, las funcionalidades clave
8. Genera el PRD completo con todas las secciones, siguiendo las reglas de Producto y Diseño
9. Te muestra el PRD y te pide confirmación
10. Una vez confirmado, actualiza el proyecto en Linear con el PRD completo

El resultado es un documento profesional que cualquier desarrollador puede leer y entender, que está basado en información real y verificada, y que está alineado con la estrategia de la empresa.

---

**En resumen**: El generador de PRDs no es solo un copiador de texto. Es un sistema que entiende el contexto, verifica la información, hace preguntas inteligentes, y genera documentos profesionales siguiendo reglas específicas que combinan las mejores prácticas de Product Management y Diseño UX.
