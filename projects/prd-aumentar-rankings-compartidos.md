# Aumentar rankings compartidos por parte de los usuarios - PRD

## 1. 📋 Introducción/Resumen

Actualmente, los usuarios de Billionhands tienen acceso a un menú de compartir rankings ubicado en el header de la página del ranking. Sin embargo, existe un problema crítico de accesibilidad: cuando el usuario hace scroll para explorar el contenido del ranking, el botón de compartir desaparece de la vista, quedando inaccesible. Esto resulta en porcentajes de uso extremadamente bajos: solo el 0,320% de los usuarios hacen clic en el botón de compartir, y de esos, únicamente el 0,0882% completa realmente el proceso de compartir. Esta baja tasa de conversión (27,6% de clicks a compartidos completados) indica problemas tanto de accesibilidad como de usabilidad del menú, limitando significativamente la capacidad de la plataforma para generar tráfico orgánico a través de compartidos de usuarios.

Este proyecto busca resolver este problema de accesibilidad y usabilidad mejorando la experiencia de compartir un ranking mediante tres mejoras clave: aumentar la visibilidad del botón de compartir, simplificar el flujo de acceso al menú, y mejorar la presentación de las opciones disponibles. El objetivo es aumentar significativamente tanto el porcentaje de clicks en el botón (desde el 0,320% actual) como el porcentaje de compartidos completados (desde el 0,0882% actual), mejorando también la tasa de conversión entre clicks y compartidos exitosos. Esto a su vez atraerá más usuarios orgánicos a la plataforma y contribuirá al objetivo de generar un 20% creciente de tráfico no pagado a los Billion Rankings.

## 2. 🎯 Objetivos

- Hacer el botón de compartir accesible durante todo el tiempo que el usuario está viendo el ranking, incluso cuando hace scroll
- Aumentar significativamente el porcentaje de clicks en el botón de compartir desde el 0,320% actual (objetivo: al menos triplicar a 0,96% o superior)
- Aumentar significativamente el porcentaje de compartidos completados desde el 0,0882% actual (objetivo: al menos triplicar a 0,26% o superior)
- Mejorar la tasa de conversión de clicks a compartidos completados desde el 27,6% actual
- Mejorar la visibilidad del botón de compartir para que sea más fácil de encontrar y reconocer
- Simplificar el flujo de acceso al menú de compartir reduciendo el número de pasos necesarios
- Mejorar la presentación de las opciones de compartir en el menú para que sean más claras e intuitivas y reduzcan el abandono
- Incrementar el número de acciones de compartir realizadas por usuario
- Atraer un mayor número de usuarios orgánicos a los rankings a través de compartidos

## 3. 👤 User Stories

- Como usuario de Billionhands, quiero poder acceder al botón de compartir en cualquier momento mientras estoy viendo un ranking, incluso después de hacer scroll, para no tener que volver arriba cuando decido compartirlo
- Como usuario de Billionhands, quiero encontrar fácilmente la opción de compartir un ranking sin tener que buscarla, para poder compartirlo rápidamente cuando encuentro algo interesante
- Como usuario de Billionhands, quiero acceder al menú de compartir de forma rápida y directa, sin pasos intermedios innecesarios, para no perder el impulso de compartir
- Como usuario de Billionhands, quiero ver claramente todas las opciones disponibles para compartir un ranking de forma organizada y comprensible, para elegir el método que prefiero usar sin confusión
- Como usuario de Billionhands, quiero compartir rankings de forma sencilla e intuitiva desde cualquier punto del ranking, para poder compartir contenido interesante con mi red social cuando lo descubro

## 4. 🚫 No-Goals (Fuera de Alcance)

- No se implementarán nuevas opciones de compartir en redes sociales específicas (más allá de las existentes)
- No se añadirán funcionalidades de gamificación o incentivos para compartir en esta versión
- No se modificarán los métodos de compartir existentes (Web Share API, copiar URL, descargar, embed)
- No se implementará tracking de conversión de compartidos a registros en esta versión
- No se incluirán mejoras en la página de destino para usuarios que llegan desde compartidos
- No se añadirán funcionalidades de compartir programado o compartir múltiples rankings a la vez

## 5. 🎨 Consideraciones de Diseño

### Narrativa del Flujo de Usuario

**Quién es el usuario**: Un usuario de Billionhands (registrado o no registrado) que está explorando un ranking y encuentra contenido interesante que quiere compartir.

**Desde dónde llega**: El usuario está navegando por la página de detalle de un ranking, haciendo scroll para ver los diferentes items del ranking. Ha llegado a través de búsqueda, navegación interna, o un enlace compartido.

**Qué ve primero**: El usuario ve el ranking con sus items ordenados. El botón de compartir está actualmente en el header, pero cuando hace scroll desaparece de la vista. En el momento en que decide compartir (después de ver varios items), el botón ya no está visible sin volver arriba.

**Qué decisiones toma**: El usuario decide que quiere compartir el ranking. Si el botón no está visible, debe decidir si vale la pena volver arriba para acceder a él, o simplemente abandonar la intención de compartir. Si accede al menú, debe elegir entre las opciones disponibles (copiar URL, Web Share API, descargar, embed).

**Qué obstáculos encuentra**: 
- El botón desaparece al hacer scroll, creando fricción para acceder a él
- Si accede al menú, la tasa de conversión actual del 27,6% (0,0882% de compartidos completados vs 0,320% de clicks) indica que el menú puede ser confuso o tener demasiadas opciones
- El usuario puede no entender qué opción elegir o puede abandonar el proceso por la complejidad

**Cómo sabe que ha terminado con éxito**: El usuario recibe feedback inmediato cuando completa el compartido (el sistema nativo confirma el compartido, o se muestra un mensaje de "URL copiada", etc.). El ranking se comparte exitosamente y el usuario puede continuar explorando.

### Estados del Sistema

**Estado inicial (botón visible)**: El botón de compartir debe estar siempre accesible, ya sea mediante un botón sticky que permanezca visible durante el scroll, duplicando el botón en una ubicación fija adicional, o cambiando su posición a un lugar que permanezca accesible durante toda la visualización del ranking.

**Estado de carga**: Si se genera una imagen para compartir (wrapped), debe mostrarse un indicador de carga claro. El usuario debe saber que el sistema está procesando su solicitud.

**Estado de éxito**: Cuando el compartido se completa exitosamente, debe haber feedback visual inmediato (mensaje de confirmación, snackbar, o confirmación del sistema nativo).

**Estado de error**: Si el compartido falla (por ejemplo, el Web Share API no está disponible o el usuario cancela), el sistema debe manejar el error de forma elegante, permitiendo al usuario intentar otra opción o cerrar el menú sin fricción.

**Estado de interacción**: Todas las interacciones (hover, click, apertura del menú) deben proporcionar feedback visual inmediato para confirmar que la acción se ha registrado.

### Criterios de Aceptación de Diseño

- El botón de compartir debe ser accesible desde cualquier punto del ranking sin requerir scroll hacia arriba
- El botón debe ser claramente visible y reconocible, utilizando iconografía y texto que comuniquen inmediatamente su función
- El flujo de compartir debe reducirse a un solo clic para acceder al menú nativo (según propuesta de producto)
- El diseño debe mantener la consistencia visual con el resto de Billionhands, utilizando componentes del Design System existente
- El botón debe adaptarse correctamente a diferentes tamaños de pantalla (móvil y desktop)
- El botón no debe ser intrusivo ni interrumpir la experiencia de lectura del ranking
- El usuario debe poder cerrar o cancelar el proceso de compartir fácilmente en cualquier momento

### Trazabilidad y Justificación

**Datos que justifican las decisiones de diseño**:
- **0,320% de clicks en botón**: Indica problema de accesibilidad/visibilidad (baseline: datos de analytics)
- **0,0882% de compartidos completados**: Indica problema de usabilidad en el menú (baseline: datos de analytics)
- **27,6% de tasa de conversión**: Indica que el menú actual tiene demasiada fricción o es confuso (cálculo: 0,0882% / 0,320%)

**Hipótesis de diseño**: Al eliminar el menú personalizado y usar directamente el Share nativo del sistema operativo, reducimos la fricción y mejoramos tanto la tasa de clicks como la tasa de conversión. El Share nativo ya incluye todas las opciones necesarias (copiar URL, compartir en apps) y es familiar para los usuarios.

**Cómo se va a testear**: 
- A/B test comparando el diseño actual (menú personalizado) vs nuevo diseño (Share nativo directo)
- Métricas a medir: tasa de clicks en botón, tasa de compartidos completados, tasa de conversión, tiempo hasta compartir
- Eventos en Amplitud: `SHARE_RANKING_CLICKED`, `RANKING_SHARED` con diferentes `sharing_method`

### Restricciones de Diseño

**Restricciones técnicas**:
- Debe utilizar componentes existentes del Design System de Billionhands cuando sea posible
- El Web Share API puede no estar disponible en todos los navegadores/contextos (ej: Instagram WebView Android), por lo que debe haber un fallback
- El botón sticky/duplicado no debe interferir con otros elementos de la interfaz (ads, navegación, etc.)

**Restricciones de alcance**:
- No se añadirán nuevas opciones de compartir más allá de las existentes
- El diseño debe limitarse a mejorar accesibilidad y simplificar el flujo, no expandir funcionalidades
- MVP: Implementar botón accesible + Share nativo directo. Iteraciones futuras podrían incluir mejoras adicionales basadas en datos

**Restricciones de timing**:
- El desarrollo está estimado en 1 semana, por lo que el diseño debe priorizar soluciones que utilicen componentes existentes
- No se incluirán animaciones complejas o efectos que requieran desarrollo adicional significativo

## 6. 📊 Métricas de Éxito

**Alineación con KPIs de la Iniciativa 3 (Canales de captación ORGÁNICA):**
- El objetivo general de la iniciativa es generar un 20% creciente de tráfico no pagado a los Billion Rankings. Las mejoras en el menú de compartir deben contribuir a este objetivo aumentando el número de compartidos y, por tanto, el tráfico orgánico.

**Métricas específicas del PRD:**

- **Métrica principal 1 - Clicks en botón**: Aumentar el porcentaje de clicks en el botón de compartir desde el 0,320% actual (baseline) a al menos 0,96% (triplicar) o superior
- **Métrica principal 2 - Compartidos completados**: Aumentar el porcentaje de compartidos completados desde el 0,0882% actual (baseline) a al menos 0,26% (triplicar) o superior
- **Métrica principal 3 - Tasa de conversión**: Mejorar la tasa de conversión de clicks a compartidos completados desde el 27,6% actual (objetivo: al menos 35% o superior)
- Incremento del número total de acciones de compartir realizadas por ranking
- Reducción del porcentaje de abandono del menú de compartir (usuarios que abren el menú pero no completan ningún compartido)
- Incremento del tráfico orgánico a rankings proveniente de compartidos de usuarios
- Reducción del tiempo promedio desde que el usuario decide compartir hasta que accede al menú de compartir
- Medición del uso del botón de compartir en diferentes puntos del ranking (header vs sticky/duplicado) para entender qué ubicación es más efectiva
- Análisis de qué método de compartir tiene mayor tasa de conversión (copiar URL, Web Share API, descargar, embed) para optimizar la presentación

## 7. ⚠️ Riesgos y Mitigadores

- ⚠️ **Riesgo**: Las mejoras en usabilidad pueden no ser suficientes para aumentar significativamente el número de compartidos si los usuarios no tienen motivación intrínseca para compartir
  - ✅ **Mitigador**: Asegurar que las mejoras sean realmente significativas en términos de accesibilidad y claridad, haciendo que compartir sea tan fácil que los usuarios lo hagan sin pensarlo mucho

- ⚠️ **Riesgo**: Implementar un botón sticky o duplicado puede ser percibido como intrusivo o molesto si no está bien diseñado
  - ✅ **Mitigador**: Diseñar el botón sticky/duplicado de forma discreta pero visible, permitiendo que se pueda minimizar o cerrar si el usuario no lo necesita, y probar diferentes posiciones y tamaños para encontrar el equilibrio óptimo

- ⚠️ **Riesgo**: Mejorar la accesibilidad puede aumentar los clicks en compartir pero no necesariamente los compartidos completados, si el menú sigue siendo confuso. La tasa de conversión actual del 27,6% indica que hay un problema de usabilidad en el menú
  - ✅ **Mitigador**: Mejorar tanto el acceso al menú como la claridad de las opciones dentro del menú, asegurando que cada opción sea clara y fácil de usar. Analizar qué métodos de compartir tienen mejor conversión y darles mayor prominencia. Simplificar el flujo para reducir pasos intermedios que puedan causar abandono

- ⚠️ **Riesgo**: El aumento de compartidos puede no traducirse en aumento de tráfico orgánico si los compartidos no llegan a usuarios relevantes o si la experiencia de llegada no es buena
  - ✅ **Mitigador**: Aunque la experiencia de llegada está fuera del alcance de este PRD, asegurar que los compartidos incluyan información clara y atractiva del ranking para aumentar la probabilidad de clicks

- ⚠️ **Riesgo**: Los cambios pueden requerir más tiempo de desarrollo del estimado (1 semana) si se descubren problemas técnicos inesperados
  - ✅ **Mitigador**: Priorizar mejoras que utilicen componentes y patrones existentes en el código, minimizando cambios arquitectónicos complejos

## 8. ❓ Preguntas Abiertas

- ¿Qué método de compartir tiene mayor tasa de conversión entre el 0,0882% de usuarios que completan el compartido? (copiar URL, Web Share API, descargar imagen, embed, etc.) Esto ayudará a priorizar qué opciones deben tener mayor prominencia en el menú
- ¿Debemos implementar un botón sticky que permanezca visible durante el scroll, duplicar el botón en una ubicación fija adicional, o cambiar completamente su posición?
- Si se implementa un botón sticky o duplicado, ¿en qué posición de la pantalla debería ubicarse? (esquina inferior derecha, barra flotante, etc.)
- ¿Hay diferencias en el comportamiento de compartir entre usuarios registrados y no registrados que debamos considerar en el diseño?
- ¿Qué opciones de compartir deberían tener mayor prominencia en el menú basándose en el uso actual o en el potencial de generar tráfico orgánico?

## 9. 💡 Propuesta de Producto

Desde producto, proponemos cargarnos todas las opciones de compartir, dejando solo el Share nativo. Así tendríamos el share a un primer nivel sin necesidad de un menú. Dentro de este Share nativo, ya tenemos diferentes opciones como copiar URL y compartir en diferentes aplicaciones, que son las que el sistema operativo del usuario pone a su disposición.

Esta propuesta simplifica significativamente el flujo de compartir: el usuario hace clic directamente en el botón de compartir y se abre el menú nativo del sistema operativo (Web Share API), que ya incluye todas las opciones disponibles (copiar URL, compartir en aplicaciones instaladas, etc.). Esto elimina un paso intermedio (el menú personalizado) y reduce la fricción, lo que debería mejorar tanto la tasa de clicks como la tasa de conversión a compartidos completados.
