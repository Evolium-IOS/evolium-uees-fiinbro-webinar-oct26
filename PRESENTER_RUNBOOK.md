# Guía del presentador y lista de ensayo

El repositorio contiene dos guías para que los asistentes puedan reproducir los experimentos. Este archivo es solo para preparar la presentación.

## Antes de iniciar

- Presentación abierta y ventanas organizadas.
- Claude Web en conversación **nueva** sin proyecto, repositorio, adjuntos ni instrucciones de proyecto.
- [Mensaje único](experiments/01-ai-engineering-harness/prompts/mensaje-unico.md) listo para copiar en ambos clientes.
- Modelos de la misma familia y versión si es posible; registrar cualquier diferencia.
- VS Code abierto solo en C:\Evolium\webinar-experiment-01-live.
- Proyecto restaurado al commit demo: baseline, sin cambios de código previos.
- Línea base comprobada: 7 PASS, 1 FAIL intencional.
- Terminal integrada en carpeta correcta, Claude Code disponible para una **sesión nueva**.
- Aplicación Streamlit del Experimento 02 iniciada antes de comenzar.
- PDF seguro, credenciales ocultas, notificaciones desactivadas y evidencia de ensayo preparada.

## Experimento 01 (4 a 5 minutos)

### Apertura

**Pregunta:** ¿qué cambia cuando dos interfaces de IA reciben la misma instrucción breve, pero solo una está situada dentro de un repositorio con reglas y pruebas?

**Hipótesis:** un agente puede descubrir el contexto empresarial existente y verificar su trabajo; un cliente sin acceso debe solicitar información o limitar su respuesta.

> "Ambos reciben exactamente la misma tarea, sin código ni requisitos pegados. La diferencia es que uno está dentro de un proyecto que ya contiene reglas y pruebas."

### Claude Web, sin acceso al proyecto

1. Abrir una conversación nueva.
2. **No adjuntar archivos ni seleccionar proyectos.**
3. Pegar todo el contenido de prompts/mensaje-unico.md.
4. Esperar respuesta, guardar preguntas y suposiciones. Si solicita código, no entregarlo durante la prueba.

> "Pedir más contexto puede ser lo correcto. Lo importante es observar que un asistente no puede conocer reglas de una empresa que nunca recibió."

### Claude Code en la terminal de VS Code

1. Confirmar que la terminal apunta a C:\Evolium\webinar-experiment-01-live.
2. Mostrar línea base: una prueba falla.
3. Iniciar **nueva sesión** con claude.
4. Pegar exactamente el mismo mensaje, sin mencionar archivos ni reglas.
5. Observar si encuentra y consulta las instrucciones, el código y las pruebas que ya existen.
6. Permitir cambios en la copia temporal y pruebas; **no autorizar commits ni pushes**.
7. Salir, comprobar con unittest y mostrar git diff.

> "No le dicté las reglas en el prompt. Las encontró, o debía encontrarlas, como parte de su trabajo dentro del proyecto."

### Interpretación

> "La IA no sustituye la responsabilidad de ingeniería: alguien debe definir requisitos, preservar compatibilidad, diseñar pruebas y revisar la evidencia."

**Límites:** aquí los asistentes no reciben el mismo contexto. Esa diferencia es intencional: evaluamos cómo cambia el flujo cuando existe acceso al proyecto. No es un benchmark de capacidades, ni demuestra que el chat habría roto código, ni garantiza que el agente acertará siempre.

[Guía completa](experiments/01-ai-engineering-harness/README.md) | [Bitácora](experiments/01-ai-engineering-harness/BITACORA.md)

## Experimento 02 (4 a 5 minutos)

1. Explicar la pregunta: ¿cómo comprobamos que una extracción de PDF es confiable?
2. Abrir Streamlit ya iniciado y cargar un PDF de demostración.
3. Mostrar enrutamiento TEXT o VISION.
4. Ejecutar extracción y validación.
5. Mostrar datos, evidencia, PASS/FAIL/UNCERTAIN y metadatos reales.
6. Explicar reparación solo si realmente ocurre.
7. Preguntar qué falta para llevar el resultado a una operación.

> "Extraer el dato era solo el comienzo. Una operación real requiere reglas, contexto, revisión humana, decisiones y gobernanza."

El enlace con ORION es conceptual; este extractor no es ORION.

## Seguridad en vivo

- No mostrar claves API, archivos .env, documentos privados ni credenciales.
- No hacer instalaciones en vivo.
- No escribir manualmente código ni habilitar dos agentes a la vez.
- Si una ejecución falla, mostrar evidencia previa **identificada como ensayo**, no como resultado de la ejecución actual.
