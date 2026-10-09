# Presenter Runbook

## Story arc

### Experiment 01 — AI inside the engineering environment
Question: **What changes when AI works inside the project instead of only receiving pasted context in a chat?**

Recommended live pairing: **Claude Desktop → Claude Code**. This keeps the vendor/model family broadly consistent while changing the environment. **Codex is the alternate/fallback harness.**

Sequence:
1. Use the direct-client prompt in a fresh desktop chat.
2. Point out that only explicitly pasted context is available.
3. Open the prepared demo workspace in VS Code.
4. Show NEXT_TASK.md, AGENTS.md / CLAUDE.md, source, and tests.
5. Run the baseline tests: seven pass, one intentionally fails.
6. Run one coding harness live: Claude Code OR Codex.
7. Show passing tests and git diff.
8. Do not commit live.

Key line:
> No es que el chat no pueda resolverlo. La diferencia es que aquí el contexto, las reglas, el código, las pruebas y la evidencia ya forman parte del entorno de trabajo.

Do not claim harnesses always consume fewer tokens. Say:
> La eficiencia viene de reducir contexto repetido, reexplicación y trabajo que no podemos verificar.

### Experiment 02 — Research to operational system
1. Open the bank extractor UI, already running locally.
2. Use only a sanitized demo PDF.
3. Ask what fields the audience expects.
4. Run extraction and show the actual structured output.
5. Show validation/repair behavior only if supported by the uploaded source.
6. Return to the presentation.
7. Bridge: **“Extraer el dato era solo el comienzo.”**
8. Explain the larger operational questions: rules, context, review, workflow, decisions, governance.
9. Transition to ORION without claiming the extractor literally became ORION.
