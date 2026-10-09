# Guía del presentador

El Experimento 01 reproduce dos flujos habituales: pegar código en un chat y pedir un cambio dentro de un repositorio que contiene estándares. El Experimento 02 presenta extracción y validación de datos bancarios.

## Antes de presentar

- Claude Web abierto en una conversación nueva sin proyecto, adjuntos ni repositorios conectados.
- Tener abierto el archivo **experiments/01-ai-engineering-harness/prompts/claude-web.md**.
- Tener abierto el archivo **experiments/01-ai-engineering-harness/prompts/claude-code.md**.
- Usar la misma familia y versión de modelo si está disponible; registrar cualquier diferencia.
- VS Code abierto en **C:\Evolium\webinar-experiment-01-live**.
- Git del experimento restaurado a **demo: baseline** (7 PASS y 1 FAIL).
- Claude Code preparado para nueva sesión en la terminal integrada.
- Streamlit del Experimento 02 iniciado antes del webinar.
- Ventanas y tamaños de fuente preparados. Credenciales ocultas.
- Respaldo de capturas/evidencias de un ensayo previo, claramente identificado.

## Experimento 01 (4 a 5 minutos)

### 1. Pregunta e hipótesis

**Pregunta:** ¿qué cambia si pedimos la misma corrección con código pegado, frente a trabajar en un proyecto con reglas, tests y Git?

**Hipótesis:** el entorno de ingeniería ayuda a descubrir requisitos y comprobar el cambio sobre el sistema existente.

> "En las empresas casi nunca empezamos de cero. Ya existen sistemas, estándares y comportamientos que debemos conservar."

### 2. Claude Web

1. Abrir nueva conversación.
2. Copiar **todo el contenido de prompts/claude-web.md**, que incluye la función Python.
3. Mostrar la respuesta y si asumió una definición de customer_id, solicitó aclaraciones o ejecutó pruebas en un entorno aislado.
4. No adjuntar requisitos internos; no transferir el parche al repo local.

> "El modelo recibió un código que parece sencillo, pero no conoce todavía las reglas de esta empresa."

### 3. Claude Code en terminal integrada de VS Code

1. Verificar ruta **C:\Evolium\webinar-experiment-01-live** y mostrar la línea base (7 PASS, 1 FAIL).
2. Iniciar una nueva sesión de Claude Code.
3. Copiar **todo el contenido de prompts/claude-code.md**. El prompt cambia el bloque de código pegado por la ruta del archivo.
4. Observar si consulta NEXT_TASK.md, AGENTS.md, CLAUDE.md y los tests existentes.
5. Permitir la corrección y ejecución de pruebas. Sin commits ni pushes.
6. Verificar por separado con unittest y git diff.

> "La tarea funcional es la misma, pero aquí el agente puede consultar el código y las reglas existentes. No le tuve que copiar manualmente cada documento."

### 4. Conclusión

> "La IA genera propuestas en ambos contextos. Lo que aporta el entorno de ingeniería es continuidad con el código existente, reglas persistentes y formas de verificar los cambios."

**Límites:** no son prompts textualmente idénticos ni contextos equivalentes, aunque la tarea es la misma. No afirmar que un modelo sea universalmente mejor, ni que el código del chat necesariamente habría roto algo.

[Guía paso a paso](experiments/01-ai-engineering-harness/README.md) | [Bitácora](experiments/01-ai-engineering-harness/BITACORA.md)

## Experimento 02 (4 a 5 minutos)

1. Formular la pregunta sobre confiabilidad de datos.
2. Abrir Streamlit previamente iniciado; cargar PDF de demostración.
3. Mostrar ruta TEXT o VISION.
4. Ejecutar extracción y validación.
5. Mostrar datos, evidencia, PASS/FAIL/UNCERTAIN y metadatos.
6. Explicar reparación solo si ocurrió en la ejecución.
7. Preguntar qué se necesitaría para utilizar estos datos en una operación real.

> "Extraer el dato era solo el comienzo. Una operación real requiere reglas, contexto, revisión humana, decisiones y gobernanza."

El vínculo con ORION es conceptual, no una transformación literal del extractor.

## Seguridad durante la demostración

- No mostrar API keys, archivos .env, credenciales ni documentos bancarios privados.
- No instalar dependencias en vivo ni escribir código manualmente.
- Si una ejecución falla, usar evidencia real de un ensayo y señalar que es un ensayo.
