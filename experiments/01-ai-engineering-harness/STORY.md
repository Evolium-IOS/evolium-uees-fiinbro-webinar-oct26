# Guion — Experimento 01

## Apertura

> “Voy a darle exactamente el mismo problema a la IA de dos maneras distintas.”

## Parte A — Cliente conversacional

Usar `prompts/direct-client.md`.

Preguntar al público:

> “¿Qué necesita saber la IA antes de poder trabajar correctamente con este proyecto?”

Explicar que el cliente solo conoce el contexto que proporcionamos explícitamente. Eso no es un defecto; es el comportamiento esperado de un cliente sin acceso al repositorio y sus herramientas.

## Parte B — Harness de ingeniería

Mostrar en este orden:
1. `NEXT_TASK.md` — qué hay que resolver.
2. `AGENTS.md` / `CLAUDE.md` — reglas persistentes.
3. `src/records.py` — implementación.
4. `tests/test_records.py` — criterios ejecutables.
5. Ejecutar pruebas — una falla.
6. Abrir Claude Code **o** Codex.
7. Pegar el prompt corto.
8. Dejar que inspeccione, modifique y pruebe.
9. Mostrar todas las pruebas pasando.
10. Mostrar `git diff`.

## Frase clave

> “No es que el chat no pueda resolverlo. La diferencia es que aquí el contexto, las reglas, el código, las pruebas y la evidencia ya forman parte del entorno de trabajo.”

## Contexto y eficiencia

No decir que un harness siempre consume menos tokens.

Decir:

> “No estoy optimizando solo tokens. Estoy reduciendo contexto repetido, reexplicación y trabajo que no puedo comprobar.”

## Salida

> “Ya vimos cómo cambia la forma de construir. Ahora veamos cómo un experimento técnico puede revelar un problema operativo mucho más grande.”
