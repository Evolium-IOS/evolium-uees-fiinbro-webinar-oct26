# Instrucciones de ingeniería para Claude Code

Antes de editar código, lee `AGENTS.md` y la tarea en `NEXT_TASK.md`.

Cuando una tarea involucre `customer_id`, consulta **`docs/CONTRATO_IDENTIFICADOR_CLIENTE.md`**: define los criterios de negocio que el código por sí solo no revela.

Inspecciona el código y las pruebas, aplica un cambio mínimo, ejecuta las pruebas y revisa `git diff`. No hagas commit ni push.
