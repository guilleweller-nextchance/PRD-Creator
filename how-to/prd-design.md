# PRD Rules: Design

## Descripción
Este documento contiene las reglas y guías para la creación de PRDs desde la perspectiva de Diseño.
Proporciona guías de alto nivel (nivel CDO) sobre el "cómo" del diseño, que sirven como base para que diseñadores o herramientas como Figma Make desarrollen propuestas detalladas.

## Reglas

**1. Principios fundamentales de UX**

- Empieza por el problema, no por la solución: el diseño debe responder a una necesidad clara de usuario y negocio.
- Reduce fricción y elimina pasos irrelevantes; optimiza el esfuerzo total, no solo el número de pantallas.
- Minimiza la carga cognitiva: menos decisiones simultáneas, opciones claras y buenos “defaults”.
- Prioriza la claridad sobre la complejidad: un objetivo principal por pantalla y una acción primaria bien definida.
- Diseña primero para el caso de uso más común (happy path); aborda después variantes y edge cases relevantes.
- Considera el contexto de uso: dispositivo, origen del tráfico, nivel de conocimiento, posibles distracciones.
- Mantén la consistencia visual y de interacción respetando el Design System.
- Diseña con accesibilidad desde el inicio (contraste, tamaños táctiles, foco, lectura sin color, lector de pantalla).
- Facilita la reversibilidad de acciones cuando sea razonable (deshacer, editar, cancelar).
- Asegura feedback inmediato en todas las interacciones (estado de carga, confirmaciones, errores recuperables).

**2. Comunicación y UX Writing**

- Informa al usuario en todo momento para fomentar la confianza: qué ha pasado, qué está pasando y qué ocurrirá después.
- Usa lenguaje claro, conciso y no técnico; evita jerga interna o ambigua.
- Destaca explícitamente la acción principal que esperas del usuario en cada paso.
- Presenta las consideraciones de forma narrativa y natural, describiendo el flujo del usuario y su experiencia (no solo como lista de reglas o checklist):
    - Quién es el usuario
    - Desde dónde llega
    - Qué ve primero
    - Qué decisiones toma
    - Qué obstáculos encuentra
    - Cómo sabe que ha terminado con éxito

**3. Estados y contingencias**

- Plantea siempre empty states cuando sea necesario, dando contexto y una siguiente acción clara.
- Define los estados clave del sistema: empty, loading, success, error y cualquier estado intermedio relevante.
- Documenta cómo se comporta el sistema en edge cases importantes (sin datos, errores de integración, latencias altas, etc.).
- Si interviene IA, especifica qué pasa cuando el modelo falla, devuelve resultados pobres o no hay suficiente información (fallbacks).

**4. Métricas y evaluación**

- Define métricas de éxito de diseño (UX KPIs) vinculadas al PRD (ej.: conversión, completion rate, time on task, error rate, recurrencia, etc.).
- Incluye criterios de aceptación de diseño (Design Acceptance Criteria): cómo sabremos que el diseño cumple su función.
- Formula una hipótesis de diseño clara y cómo se va a testear (A/B test, test con usuarios, funnels, etc.).
- Siempre que sea posible, vincula los KPIs a eventos medibles en Amplitud.

**5. Priorización y alcance**

- Limita las propuestas de diseño al alcance establecido en el PRD; evita expandir el problema durante el diseño.
- Diferencia explícitamente entre requerimientos “must” y “nice to have”.
- Identifica qué entra en el MVP y qué se reserva para siguientes iteraciones.
- Señala los principales trade-offs de diseño cuando impacten en alcance, complejidad o performance.

**6. Trazabilidad y justificación**

- Cada decisión de diseño debe estar trazable a un insight, dato o requerimiento de negocio (research, entrevistas, métricas, benchmark, etc.).
- Evita decisiones apoyadas solo en opinión; indica siempre la fuente (documento, estudio, dashboard, experimento).
- El diseño debe reforzar la propuesta de valor y el comportamiento deseado del usuario (qué queremos que haga más o mejor).
- Cuando se use IA, especifica qué partes del flujo están automatizadas, qué decide el modelo y qué control mantiene el usuario.

**7. Restricciones**

- Establece de forma explícita las restricciones de diseño:
    - Técnicas (stack, componentes disponibles, dependencias entre equipos).
    - De datos e IA (disponibilidad, calidad, privacidad, latencia, límites del modelo).
    - Legales y de compliance (RGPD, términos de uso, consentimientos, etc.).
    - De capacidad, timing y performance (plazos, SLAs, tiempos máximos de respuesta).
- Indica qué restricciones son innegociables y cuáles se podrían revisar en futuras iteraciones.

