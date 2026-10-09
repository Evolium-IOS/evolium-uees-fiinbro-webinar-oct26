# Guía del presentador

El webinar trabaja con dos preguntas de investigación y demostraciones reproducibles.

## Experimento 01: qué añade el entorno de ingeniería

**Pregunta:** ¿qué aporta un entorno de ingeniería cuando dos interfaces de IA disponen de la misma tarea y documentación?

**Hipótesis:** el acceso operativo al proyecto, las pruebas y Git facilita generar evidencia verificable de un cambio.

### Protocolo en vivo

1. Presentar pregunta, hipótesis y variables controladas.
2. Abrir una conversación nueva en Claude Web, sin proyectos ni herramientas locales.
3. Adjuntar **prompts/contexto-web.md**. Contiene exactamente los cinco archivos iniciales del repositorio de práctica.
4. Pegar el mensaje de **prompts/mensaje-unico.md** y conservar respuesta.
5. Cambiar a VS Code, terminal en C:\Evolium\webinar-experiment-01-live, línea base limpia.
6. Mostrar que los cinco archivos iniciales son los mismos; ejecutar las pruebas: 7 pasan y una falla intencionalmente.
7. Abrir Claude Code en la terminal y pegar **el mismo mensaje sin alteraciones**.
8. Observar lectura de archivos, edición, pruebas y Git. No hacer commit.
9. Salir de Claude Code, ejecutar pruebas en PowerShell y mostrar git diff.
10. Comparar **propuesta de solución** y **evidencia de verificación** por separado.

No es válido afirmar que Claude Web falló solo por no haber ejecutado pruebas. Para comparar calidad de código, su propuesta tendría que aplicarse a otra copia idéntica del baseline y someterse a las mismas pruebas.

No afirmar que el experimento demuestra superioridad universal, ahorro de tokens o que ambos servicios usaron necesariamente el mismo modelo si no se confirmó.

**Mensaje final:** la IA puede generar una solución, pero ingeniería aporta criterios, validación, control de cambios y trazabilidad.

[Guía completa](experiments/01-ai-engineering-harness/README.md) | [Guion breve](experiments/01-ai-engineering-harness/STORY.md) | [Mensaje único](experiments/01-ai-engineering-harness/prompts/mensaje-unico.md)

## Experimento 02: extracción bancaria y flujo operativo

**Pregunta:** ¿cómo comprobamos que la extracción de un PDF produce datos confiables? ¿Qué falta después para que ese resultado sea útil en la operación?

1. Abrir antes de la sección la UI Streamlit en localhost.
2. Usar únicamente PDF de demostración sin datos privados.
3. Preguntar qué campos debería recuperar el sistema.
4. Mostrar decisión del router: TEXT o VISION.
5. Ejecutar extracción, observar tabla, validación y metadatos.
6. Explicar reparación acotada solo si existe evidencia en la ejecución.
7. Preguntar qué falta para procesar el dato: reglas, contexto, revisión humana, flujo, decisiones y gobernanza.
8. Introducir ORION como sistema relacionado con retos operativos, no como una transformación literal del extractor.

[Guía del Experimento 02](experiments/02-bank-document-to-orion/README.md)

## Tiempo

Experimento 01: 4 a 5 min.
Stack: 1 a 2 min.
Experimento 02: 4 a 5 min.
Transición a ORION: alrededor de 1 min.
