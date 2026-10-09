# Guía del presentador

## Propósito

El objetivo es mostrar dos experimentos breves, formulados como preguntas de investigación y resueltos con herramientas reales de ingeniería.

La documentación de cada experimento es una **guía que el estudiante puede seguir después del webinar**.

## Experimento 01: cliente web frente a agente en VS Code

**Pregunta:** ¿qué cambia cuando la IA recibe contexto manualmente en un chat frente a cuando trabaja dentro de un repositorio con instrucciones, código y pruebas?

**Hipótesis:** un entorno con reglas persistentes y validación ejecutable facilita producir evidencia revisable y resultados reproducibles.

### Secuencia en vivo

1. Presentar pregunta, hipótesis y qué observaremos.
2. Abrir **Claude Web en el navegador**, con una conversación nueva y sin repositorio conectado.
3. Enviar el prompt preparado en `experiments/01-ai-engineering-harness/prompts/direct-client.md`.
4. Observar qué supuso el cliente web sobre `customer_id` válido.
5. Cambiar a **VS Code** con terminal en `C:\Evolium\webinar-experiment-01-live`.
6. Verificar el directorio, mostrar `NEXT_TASK.md`, `AGENTS.md` / `CLAUDE.md` y las pruebas.
7. Ejecutar línea base: 7 pruebas pasan y una falla intencionalmente.
8. Ejecutar **Claude Code desde la terminal integrada de VS Code**. Codex es la alternativa o respaldo.
9. Mostrar pruebas posteriores y `git diff`. No hacer commit.
10. Explicar las diferencias de contexto y herramientas, sin afirmar causalidad universal ni ahorro de tokens no medido.

Frase clave:

> No es que el chat no pueda resolver el problema. Aquí el contexto, las reglas, el código, las pruebas y la evidencia ya forman parte del entorno de trabajo.

[Guía completa del Experimento 01](experiments/01-ai-engineering-harness/README.md) | [Guion cronometrado](experiments/01-ai-engineering-harness/STORY.md)

## Experimento 02: extracción bancaria y el camino hacia sistemas operativos

**Pregunta:** ¿cómo comprobamos que la extracción de un PDF produce datos confiables? ¿Qué falta después para que ese resultado sea útil dentro de una operación?

1. Tener la UI Streamlit iniciada localmente antes de la sección.
2. Usar únicamente PDF de demostración sin datos privados.
3. Preguntar al público qué campos debería devolver el sistema.
4. Mostrar la decisión del router: TEXT o VISION.
5. Ejecutar extracción y observar tabla, reporte de validación y metadata.
6. Explicar la reparación acotada solo si el resultado real la muestra.
7. Volver a la presentación y plantear: **“Extraer el dato era solo el comienzo.”**
8. Conectar reglas, contexto, revisión humana, flujo, decisiones y gobernanza.
9. Introducir ORION como sistema que aborda problemas operativos relacionados, no como si el extractor se hubiera convertido literalmente en ORION.

[Guía del Experimento 02](experiments/02-bank-document-to-orion/README.md)

## Tiempo objetivo

- Experimento 01: 4 a 5 minutos.
- Explicación del stack: 1 a 2 minutos.
- Experimento 02: 4 a 5 minutos.
- Transición hacia ORION: alrededor de 1 minuto.
