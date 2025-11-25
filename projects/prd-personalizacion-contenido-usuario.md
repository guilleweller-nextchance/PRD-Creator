# Personalización de contenido para el usuario - PRD

## 1. 📋 Introducción/Resumen

Actualmente, Billionhands muestra contenido (rankings) a los usuarios de forma genérica, sin considerar sus intereses o comportamiento previo. El contenido se ordena principalmente por popularidad global (votos totales, trending, anuncios), lo que significa que usuarios con intereses específicos pueden tener dificultades para encontrar contenido relevante para ellos.

Esta funcionalidad busca personalizar el contenido mostrado a cada usuario basándose en su comportamiento: las categorías que visita, los rankings específicos que consulta y los votos que realiza. El objetivo es que cada usuario vea contenido más alineado con sus intereses, lo que debería aumentar su engagement, tiempo en la plataforma y participación activa (votos).

**Importante**: Cuando un usuario no tiene suficiente historial de interacciones (nuevos usuarios o usuarios con pocas visitas), el sistema debe mostrar un fallback que combine contenido trending y contenido popular general. Esto garantiza que todos los usuarios, independientemente de su historial, tengan una experiencia de calidad desde el primer uso.

## 2. 🎯 Objetivos

- Implementar un sistema de personalización que priorice contenido relevante para cada usuario basándose en su historial de interacciones
- Aumentar el tiempo de sesión promedio de los usuarios mediante contenido más relevante
- Incrementar el número de rankings visitados por usuario
- Mejorar la recurrencia de usuarios mediante una experiencia más personalizada
- Aplicar personalización tanto para usuarios registrados como para usuarios anónimos (usando el sistema de usuarios temporales existente)
- Garantizar una experiencia de calidad para todos los usuarios mediante un sistema de fallback que muestre contenido trending y popular cuando no hay suficiente historial de interacciones

## 3. 👤 User Stories

- Como usuario de Billionhands, quiero ver rankings de categorías que me interesan en mi feed principal, para encontrar contenido relevante más rápido
- Como usuario que visita frecuentemente rankings de tecnología, quiero que el sistema priorice rankings similares o de la misma categoría, para descubrir más contenido de mi interés
- Como usuario que vota en rankings específicos, quiero que el sistema aprenda de mis preferencias y me muestre contenido relacionado, para tener una experiencia más personalizada
- Como usuario anónimo, quiero que el sistema recuerde mis intereses durante mi sesión, para ver contenido relevante sin necesidad de registrarme
- Como usuario anónimo que se registra, quiero que el sistema transfiera mi historial de personalización al nuevo usuario registrado, para mantener la consistencia en mi experiencia y no perder mis preferencias aprendidas
- Como usuario que visita múltiples categorías, quiero que el sistema combine mis intereses para mostrarme una mezcla personalizada de contenido, para tener una experiencia equilibrada y variada
- Como nuevo usuario o usuario con poco historial, quiero ver contenido trending y popular de calidad aunque el sistema aún no conozca mis preferencias, para tener una buena experiencia desde el primer uso

## 4. 🚫 No-Goals (Fuera de Alcance)

- Implementar un sistema de recomendación basado en machine learning avanzado o algoritmos complejos de filtrado colaborativo
- Personalización basada en datos demográficos o información de perfil del usuario (edad, ubicación, etc.)
- Sistema de notificaciones push para contenido personalizado
- Personalización de contenido en widgets externos o embeds
- Modificar el algoritmo de trending global (solo se personaliza el orden para cada usuario)
- Sistema de "me gusta" o favoritos explícitos (se usa solo el comportamiento implícito: visitas y votos)

## 5. 🎨 Consideraciones de Diseño

La personalización debe ser transparente y no intrusiva para el usuario. El contenido personalizado debe integrarse de forma natural en los feeds existentes, manteniendo la misma estructura visual y de navegación que los usuarios ya conocen.

Cuando un usuario no tiene suficiente historial de interacciones, el sistema debe mostrar un fallback que combine contenido trending y contenido popular general, asegurando que siempre haya contenido relevante disponible. Esto es especialmente importante para nuevos usuarios o usuarios que exploran categorías nuevas.

El sistema debe proporcionar feedback inmediato al usuario cuando interactúa con contenido, pero sin mostrar explícitamente que el contenido está siendo personalizado (evitar mensajes como "Basado en tus intereses"). La personalización debe sentirse natural y no como un filtro restrictivo.

Para usuarios anónimos, la experiencia debe ser idéntica a la de usuarios registrados en términos de personalización, aprovechando el sistema de usuarios temporales existente que se gestiona mediante cookies. Esto permite que usuarios no registrados también se beneficien de la personalización durante su sesión.

Cuando un usuario anónimo se registra, el sistema debe transferir automáticamente el historial de personalización (categorías visitadas, rankings visitados, votos) del usuario temporal al nuevo usuario registrado. Esto garantiza la consistencia en la experiencia del usuario y evita que se pierdan las preferencias aprendidas durante la sesión anónima.

## 6. 📊 Métricas de Éxito

- **Tiempo de sesión**: Aumentar el tiempo promedio de sesión en un 15% comparado con el baseline actual
- **Rankings visitados**: Aumentar el número promedio de rankings visitados por sesión en un 20%
- **Tasa de recurrencia**: Aumentar el porcentaje de usuarios que regresan a la plataforma en los siguientes 7 días en un 10%
- **Engagement con contenido personalizado**: Medir el porcentaje de rankings visitados que provienen de categorías previamente visitadas por el usuario (objetivo: >40% del contenido visitado debe ser de categorías de interés previo)

## 7. ⚠️ Riesgos y Mitigadores

- ⚠️ **Riesgo**: La personalización puede crear "burbujas de filtro" donde los usuarios solo ven contenido de categorías que ya conocen, limitando el descubrimiento de nuevo contenido.
  - ✅ **Mitigador**: Combinar personalización con contenido trending y popular (fallback), asegurando que siempre haya un porcentaje de contenido diverso en el feed.

- ⚠️ **Riesgo**: Usuarios con poco historial pueden no ver beneficios inmediatos de la personalización.
  - ✅ **Mitigador**: Implementar un sistema de fallback robusto que muestre contenido trending y popular cuando no hay suficiente historial, garantizando una buena experiencia desde el primer uso.

- ⚠️ **Riesgo**: El rendimiento de las consultas puede degradarse al tener que calcular personalización para cada usuario en tiempo real.
  - ✅ **Mitigador**: Implementar caché de preferencias de usuario y pre-calcular rankings personalizados cuando sea posible, optimizando las consultas a la base de datos.

- ⚠️ **Riesgo**: La personalización para usuarios anónimos puede no persistir correctamente si las cookies se eliminan o el usuario cambia de dispositivo.
  - ✅ **Mitigador**: Aprovechar el sistema existente de usuarios anónimos que ya maneja cookies de forma robusta, y aceptar que la personalización para usuarios anónimos es por sesión únicamente.

- ⚠️ **Riesgo**: Cambios en el algoritmo de personalización pueden afectar negativamente métricas existentes si no se implementa correctamente.
  - ✅ **Mitigador**: Implementar la funcionalidad de forma gradual con feature flags, permitiendo A/B testing y rollback rápido si es necesario.

## 8. ❓ Preguntas Abiertas

- ¿Cuál es el peso relativo de cada señal de personalización? (categorías visitadas vs rankings visitados vs votos dados)
- ¿Cuánto historial de interacciones se necesita como mínimo para activar la personalización? (ej: mínimo 3 rankings visitados, mínimo 2 categorías diferentes)
- ¿Debe haber un límite temporal para el historial considerado? (ej: solo interacciones de los últimos 30 días)
- ¿Qué porcentaje del feed debe ser contenido personalizado vs contenido trending/popular general? (ej: 60% personalizado, 40% trending/popular)

