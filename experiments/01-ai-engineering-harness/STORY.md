# Guion del Experimento 01

La demostración tiene dos condiciones con **igual tarea, mensaje y material técnico inicial**. Cambia el acceso operativo al entorno del proyecto.

**Duración objetivo: 4 a 5 minutos.** Los estudiantes pueden repetir todos los pasos en [README.md](README.md).

## 0:00 a 0:45 | Pensar como investigador

**Pregunta:** ¿qué aporta un entorno de ingeniería si el asistente conoce la misma tarea y tiene disponible la misma documentación?

**Hipótesis:** el acceso a archivos, terminal, pruebas y Git facilita producir evidencia verificable, no solo código plausible.

> “No vamos a comparar cuál IA es más inteligente. Vamos a comparar qué sucede cuando la misma IA puede operar dentro del proyecto y demostrar su resultado.”

## 0:45 a 1:50 | Condición A: Claude Web

**Pantalla:** conversación nueva en Claude Web.

Adjunta [prompts/contexto-web.md](prompts/contexto-web.md), que reúne el contenido de los cinco archivos iniciales.

Envía el [mensaje único](prompts/mensaje-unico.md).

> “Ahora sí le dimos al chat las reglas, el código y las pruebas. No le estamos ocultando el criterio para que falle.”

Observa el resultado y pregunta:

> “¿La propuesta puede ser correcta? Sí. ¿Nos consta que se aplicó y pasó las pruebas locales? Todavía no.”

## 1:50 a 3:55 | Condición B: Claude Code en VS Code

**Pantalla:** VS Code con terminal en C:\Evolium\webinar-experiment-01-live.

1. Enseña los mismos archivos: NEXT_TASK.md, AGENTS.md, CLAUDE.md, src/records.py y tests/test_records.py.
2. Ejecuta línea base: 7 PASS, 1 FAIL intencional.
3. Inicia claude en esa misma terminal.
4. Pega el **mismo mensaje único**.
5. Observa que consulta documentos, modifica archivos y ejecuta pruebas.
6. Comprueba por separado los resultados y muestra git diff.

> “La tarea no cambió. Aquí el asistente pudo leer los documentos directamente desde el repositorio, intervenir sobre el código y mostrar evidencia del cambio.”

Si falla o tarda demasiado, no inventes una ejecución exitosa: explica lo observado y utiliza evidencia verificada de ensayo como respaldo, indicando que corresponde a un ensayo.

## 3:55 a 4:45 | Evidencia y conclusión

Compara el contenido de las respuestas y, por separado, la posibilidad de comprobarlas.

> “Ambos tienen la información del problema. Lo que cambia es la integración del trabajo con archivos, pruebas, herramientas y control de versiones.”

> “La ingeniería sigue siendo necesaria para establecer los criterios de aceptación, diseñar la validación y decidir si un cambio puede considerarse confiable.”

**Límite:** no afirmes superioridad universal, ahorro de tokens ni calidad funcional comparada si no se probó la propuesta web contra el mismo suite.

**Transición:** “Si esto es importante en una función pequeña, pensemos qué pasa cuando trabajamos con documentos bancarios y decisiones reales.”

## Después del webinar

Restablece el baseline con [reset-demo.ps1](scripts/reset-demo.ps1) y registra resultados en [BITACORA.md](BITACORA.md).
