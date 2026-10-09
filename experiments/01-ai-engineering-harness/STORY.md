# Guion para presentar el Experimento 01

Este archivo es una guía de exposición. Para reproducir el ejercicio desde cero, sigue [README.md](README.md).

**Duración objetivo: 4 a 5 minutos.**

## 0:00 a 0:40 | Pregunta e hipótesis

**Pantalla:** presentación del webinar con la pregunta del experimento.

> “Como investigadores, primero vamos a plantear una pregunta: ¿qué cambia cuando usamos una IA en un chat y cuando la integramos a nuestro entorno de ingeniería?”

> “Mi hipótesis no es que un modelo sea más inteligente. Es que al darle reglas persistentes, acceso al proyecto, pruebas y control de versiones, podemos comprobar mejor lo que realmente hizo.”

## 0:40 a 1:40 | Cliente web

**Pantalla:** Claude Web, conversación nueva, sin archivos ni repositorio conectado.

Usa [prompts/direct-client.md](prompts/direct-client.md).

> “Este es un problema sencillo. Tengo una función que filtra registros, pero deja pasar uno sin identificador válido.”

Después de mostrar la propuesta:

> “Observemos algo: ¿tuvo que asumir qué era un identificador válido? Aquí el modelo solo conoce lo que yo decidí compartir.”

No critiques la respuesta como incorrecta solo por hacer una suposición. Señala la ambigüedad del contexto.

## 1:40 a 3:50 | Harness en VS Code

**Pantalla:** VS Code, terminal dentro de `C:\Evolium\webinar-experiment-01-live`.

Mostrar:
1. `NEXT_TASK.md`: objetivo.
2. `AGENTS.md` y `CLAUDE.md`: reglas.
3. `tests/test_records.py`: qué vamos a comprobar.

Ejecutar las pruebas de línea base para mostrar **7 PASS y 1 FAIL intencional**.

Abrir Claude Code en esa misma terminal, dar la instrucción de [prompts/claude-code.md](prompts/claude-code.md), y mostrar la ejecución.

> “No le di código pegado en un chat. Le di una tarea y acceso controlado a un repositorio que ya tiene reglas y pruebas.”

Cuando termine, mostrar resultado real de las pruebas y `git diff`.

Si la respuesta tarda o falla, no improvises: muestra los criterios y la evidencia de una ejecución previamente preparada, y continúa.

## 3:50 a 4:40 | Resultado y límites

**Pantalla:** presentación o terminal con resumen de pruebas.

> “El chat puede proponer la misma solución. La diferencia que estamos observando es el entorno: instrucciones, código, validación y evidencia.”

> “Esto no prueba que automáticamente gastemos menos tokens. Muestra cómo dejar menos decisiones ambiguas y cómo comprobar resultados con el proyecto real.”

**Transición:**

> “Ya vimos cómo cambia la forma de construir. Ahora vamos a ver qué ocurre cuando un experimento técnico revela un problema operativo más grande.”

## Después del webinar

Los estudiantes pueden repetir el ejercicio usando la [guía paso a paso](README.md), registrar sus resultados en [BITACORA.md](BITACORA.md) y restaurar el estado inicial con el script de reset.
