# Story — Experiment 01

## Opening
> “Voy a darle exactamente el mismo problema a la IA de dos maneras distintas.”

## A — Direct client
Use prompts/direct-client.md.

Ask:
> “¿Qué necesita saber la IA antes de poder tocar el proyecto?”

The client only knows what you paste or explain. That is expected behavior.

## B — Harness
Show, in order:
1. NEXT_TASK.md
2. AGENTS.md / CLAUDE.md
3. src/records.py
4. tests/test_records.py
5. baseline test run
6. one harness: Claude Code or Codex
7. passing test run
8. git diff

Key line:
> “No es que el chat no pueda resolverlo. La diferencia es que aquí el contexto, las reglas, el código, las pruebas y la evidencia ya forman parte del entorno de trabajo.”

Context lesson:
> “No estoy optimizando solo tokens. Estoy reduciendo contexto repetido, reexplicación y trabajo que no puedo comprobar.”

Exit:
> “Ya vimos cómo cambia la forma de construir. Ahora veamos cómo un experimento técnico puede revelar un problema operativo mucho más grande.”
