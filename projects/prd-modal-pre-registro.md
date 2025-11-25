# Modal pre registro - PRD

## 1. Introducción/Resumen

Los usuarios de Billionhands no se están registrando porque no ven claramente el valor de hacerlo. Actualmente, pueden usar la plataforma de forma limitada sin registro, pero no perciben los beneficios que obtendrían al crear una cuenta.

Este proyecto busca implementar un modal que aparezca estratégicamente después de que el usuario haya realizado ciertas acciones (como votar) sin estar registrado, mostrándole de forma clara y atractiva los beneficios del registro. El objetivo es aumentar la tasa de conversión a registro mostrando el valor que el usuario está perdiendo al no tener una cuenta.

## 2. Objetivos

- Aumentar la tasa de registro de usuarios que interactúan con la plataforma sin cuenta
- Comunicar claramente los beneficios del registro (guardar rankings favoritos, acumular puntos, personalizar experiencia)
- Reducir la fricción percibida del proceso de registro mediante un mensaje claro y directo
- Mejorar la comprensión del usuario sobre qué puede hacer una vez registrado

## 3. User Stories

- Como usuario no registrado, quiero ver los beneficios de registrarme después de haber votado varias veces, para entender qué valor obtendría al crear una cuenta
- Como usuario no registrado, quiero poder cerrar el modal fácilmente si no estoy interesado en registrarme en ese momento, para continuar usando la plataforma
- Como usuario no registrado, quiero que el modal aparezca solo una vez por sesión, para que no me interrumpa repetidamente
- Como usuario no registrado, quiero ver un mensaje claro sobre los beneficios del registro, para tomar una decisión informada sobre si registrarme

## 4. No-Goals (Fuera de Alcance)

- El modal no debe aparecer más de una vez por sesión de usuario
- El modal no debe bloquear completamente la navegación (debe poder cerrarse con X)
- No se incluirá funcionalidad de "No mostrar de nuevo" en esta versión
- No se implementarán animaciones complejas o efectos de partículas (solo animaciones sutiles)
- No se personalizará el contenido del modal según el contexto específico del usuario en esta versión

## 5. Consideraciones de Diseño

El modal debe aparecer de forma natural después de que el usuario haya votado varias veces, presentándose como el siguiente paso lógico en su experiencia, no como una interrupción. El usuario debe poder entender de un vistazo qué beneficios obtendrá al registrarse: guardar rankings favoritos, acumular puntos y personalizar su experiencia. Estos beneficios deben comunicarse de forma visual y textual clara, priorizando 2-3 beneficios clave para evitar sobrecargar al usuario.

El diseño debe optimizarse para el caso de uso más común: un usuario que ha demostrado interés votando sin registro. Toda la información necesaria debe estar visible en una sola vista, sin requerir pasos adicionales o navegación. El modal debe aparecer con una animación sutil que indique su presencia, y todas las interacciones (hover, clic, cierre) deben proporcionar feedback visual inmediato.

Si el usuario no está interesado en registrarse en ese momento, debe poder cerrar el modal fácilmente mediante un botón X claramente visible, permitiéndole continuar usando la plataforma sin fricción. El diseño debe mantener la consistencia visual y de interacción con el resto de Billionhands, usando componentes y estilos existentes cuando sea posible.

El alcance se limita a un modal simple con mensaje de beneficios y CTA de registro, sin variaciones personalizadas o funcionalidades adicionales fuera del scope definido.

## 6. Métricas de Éxito

- Aumento en la tasa de registro de usuarios que ven el modal vs usuarios que no lo ven
- Porcentaje de usuarios que hacen clic en "Registrarse" desde el modal
- Reducción en el tiempo promedio hasta el primer registro después de interactuar con la plataforma
- Tasa de cierre del modal (usuarios que lo cierran sin registrarse) para entender si el mensaje es efectivo

## 7. Riesgos y Mitigadores

- **Riesgo:** El modal puede ser percibido como intrusivo y generar fricción negativa
  - **Mitigador:** Aparecer solo después de que el usuario haya demostrado interés (votando varias veces) y permitir cierre fácil con X

- **Riesgo:** El mensaje puede no comunicar claramente los beneficios si es demasiado genérico
  - **Mitigador:** Enfocarse en beneficios concretos y medibles (guardar rankings, puntos, personalización)

- **Riesgo:** Los usuarios pueden cerrar el modal y nunca volver a ver la opción de registro
  - **Mitigador:** Aunque el modal solo aparece una vez por sesión, el usuario puede acceder al registro desde otros puntos de la aplicación

- **Riesgo:** La animación sutil puede no ser lo suficientemente llamativa para captar la atención
  - **Mitigador:** Asegurar que el diseño visual y el copy sean lo suficientemente atractivos incluso con animación sutil

## 8. Preguntas Abiertas

- ¿Cuál es el número exacto de acciones (votos) que debe realizar el usuario antes de que aparezca el modal?
- ¿Debe el modal aparecer en todas las páginas o solo en páginas específicas (ej: después de votar en un ranking)?
- ¿Qué beneficios específicos del registro deben destacarse en el mensaje? (guardar rankings, puntos, personalización, etc.)
- ¿Debe haber un delay entre la última acción del usuario y la aparición del modal, o debe aparecer inmediatamente?

