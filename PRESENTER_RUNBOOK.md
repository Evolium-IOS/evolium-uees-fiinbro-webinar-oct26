# Guía del Presentador

## Narrativa general

La sección práctica responde dos preguntas distintas.

### Experimento 01 — ¿Qué cambia cuando la IA trabaja dentro del entorno de ingeniería?

Compararemos el mismo problema en dos contextos:
1. cliente conversacional;
2. agente de código dentro de un repositorio con reglas, pruebas, Git y terminal.

Para una comparación metodológicamente limpia, la demostración principal recomendada es:

**Claude Desktop → Claude Code**

Así cambia principalmente el entorno de trabajo, no la familia de producto. Codex queda como alternativa o respaldo.

### Secuencia en vivo — Experimento 01
1. Abrir el cliente conversacional con una conversación nueva.
2. Usar el prompt preparado.
3. Señalar que el cliente solo conoce el contexto que le proporcionamos.
4. Cambiar a VS Code.
5. Mostrar `NEXT_TASK.md`, `AGENTS.md` / `CLAUDE.md`, código y pruebas.
6. Ejecutar la línea base: 7 pruebas pasan y 1 falla intencionalmente.
7. Ejecutar **un solo** harness en vivo: Claude Code o Codex.
8. Mostrar que las pruebas pasan.
9. Mostrar `git diff`.
10. No hacer commit durante la demo.

Frase clave:

> No es que el chat no pueda resolverlo. La diferencia es que aquí el contexto, las reglas, el código, las pruebas y la evidencia ya forman parte del entorno de trabajo.

No afirmar que un harness siempre usa menos tokens. Explicar:

> La eficiencia viene de reducir contexto repetido, reexplicación y trabajo que no podemos verificar.

---

### Experimento 02 — ¿Cómo una investigación técnica revela un problema operativo?

1. Tener la UI del extractor ya ejecutándose en localhost.
2. Usar únicamente un PDF de demostración seguro.
3. Preguntar al público qué campos espera obtener.
4. Ejecutar la extracción.
5. Mostrar el resultado estructurado.
6. Mostrar validación y reparación únicamente como existen realmente en el proyecto.
7. Volver a la presentación.
8. Hacer la transición: **“Extraer el dato era solo el comienzo.”**
9. Introducir reglas, contexto, revisión humana, flujo, decisiones y gobernanza.
10. Conectar con ORION sin afirmar que el extractor literalmente “se convirtió” en ORION.

Frase de transición recomendada:

> Este experimento resolvía una pregunta técnica. Pero al intentar llevar ese dato a una operación real aparecieron preguntas mucho más grandes.

## Tiempo objetivo

- Experimento 01: 4–5 min.
- Explicación del stack: 1–2 min.
- Experimento 02: 4–5 min.
- Transición a ORION: ~1 min.
