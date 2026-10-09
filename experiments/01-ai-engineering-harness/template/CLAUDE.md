# Instrucciones de ingeniería para Claude Code

Antes de modificar código, consulta `AGENTS.md`, `NEXT_TASK.md` y el contrato de negocio en `docs/CONTRATO_IDENTIFICADOR_CLIENTE.md`.

La función de `src/records.py` **depende del módulo `src/customer_policy.py` y de `config/customer_policy.json`**. Debes inspeccionar esas dependencias y conservarlas; no reemplazarlas por reglas asumidas ni código autosuficiente inventado.

Aplica un cambio mínimo, ejecuta las pruebas reales, revisa `git diff` y distingue lo verificado de lo pendiente. No hagas commit ni push.
