# Guía del presentador

El Experimento 01 compara trabajar con una función pegada en el chat frente a trabajar con la misma función dentro de un repositorio con un **contrato de negocio documentado**. El Experimento 02 presenta extracción y validación de PDF bancarios.

## Preparación

- Claude Web en conversación nueva, sin proyecto ni adjuntos.
- Abrir prompts/claude-web.md y prompts/claude-code.md.
- Modelos de la misma familia y versión, si está disponible.
- VS Code abierto en C:\Evolium\webinar-experiment-01-live.
- Copia de práctica actualizada con \`reset-demo.ps1 -ActualizarPlantilla\` si fue creada antes de la actualización.
- Línea base verificada: **11 pruebas, 8 PASS y 3 FAIL intencionales**.
- Una sesión nueva de Claude Code lista desde la terminal integrada.
- Streamlit del Experimento 02 iniciado antes del webinar.
- Credenciales ocultas y evidencia del ensayo disponible como respaldo.

## Experimento 01 (4 a 5 minutos)

### Pregunta

> "¿Qué ocurre si pedimos a la IA que corrija un fragmento de código, pero la empresa tiene reglas que el código por sí solo no puede explicar?"

**Hipótesis:** el repositorio permite descubrir criterios que no figuran en el código pegado y comprobarlos antes de declarar una corrección.

### Claude Web

1. Iniciar conversación nueva.
2. Pegar el contenido de **prompts/claude-web.md**, incluido el código.
3. Mostrar la propuesta o la solicitud de aclaraciones.
4. No adjuntar ni explicar el contrato interno de negocio.

> "Esta solución podría parecer correcta. ¿Pero conoce nuestras excepciones empresariales? No se las dimos."

### Claude Code en VS Code

1. Confirmar carpeta de práctica y mostrar línea base (8 PASS, 3 FAIL).
2. Abrir sesión nueva con \`claude\`.
3. Pegar **prompts/claude-code.md**. Incluye la ruta al archivo Python, no el código.
4. Observar si el agente consulta AGENTS.md, CLAUDE.md, NEXT_TASK.md y el contrato en \`docs/\`.
5. Dejar que modifique y ejecute las pruebas. No hacer commits ni pushes.
6. Ejecutar pruebas y revisar \`git diff\` de forma independiente.

### Revelación del contrato y conclusión

Mostrar **docs/CONTRATO_IDENTIFICADOR_CLIENTE.md** después de la ejecución. Explicar que la empresa tiene una norma concreta sobre formato y exclusiones que no estaba en el mensaje de Claude Web.

> "La diferencia no es que el chat no pueda programar. Es que una empresa tiene requisitos, excepciones y pruebas. Un cambio solo es confiable cuando los respeta y podemos comprobarlo."

**Importante:** la documentación de negocio es ficticia y solo existe para el ejercicio; no representa políticas universales. Sin probar la solución web en otra copia del repositorio, no se puede afirmar que habría fallado en producción.

[Guía paso a paso](experiments/01-ai-engineering-harness/README.md) | [Bitácora](experiments/01-ai-engineering-harness/BITACORA.md)

## Experimento 02 (4 a 5 minutos)

1. Formular la pregunta sobre datos confiables.
2. Abrir Streamlit y cargar un PDF de demostración.
3. Mostrar routing TEXT o VISION.
4. Ejecutar extracción y validación.
5. Mostrar datos, evidencia, PASS/FAIL/UNCERTAIN y metadatos.
6. Explicar la reparación solo si fue observada.
7. Relacionar con reglas, contexto, revisión humana y decisiones.

> "Extraer el dato era solo el comienzo."

ORION es un ejemplo de sistemas que enfrentan retos operativos más amplios; el extractor no es literalmente ORION.

## Seguridad

- No mostrar claves, archivos \`.env\`, credenciales ni documentos privados.
- No instalar dependencias en vivo.
- No escribir manualmente código de la demo.
- Si falla una ejecución, usar material verificado de ensayo y aclararlo.
