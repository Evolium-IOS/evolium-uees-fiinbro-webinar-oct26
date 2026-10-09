# Tarea: filtro de registros procesables

`src/records.py` permite procesar algunos registros que deberían excluirse. Corrige esa función respetando **todas las dependencias del proyecto**.

## Contrato de aceptación

- Revisa `src/customer_policy.py` y la política obligatoria `config/customer_policy.json`.
- Consulta `docs/CONTRATO_IDENTIFICADOR_CLIENTE.md` para interpretar los campos.
- No hardcodees listas de exclusión ni valores de configuración: el archivo JSON vigente es la fuente de verdad.
- Conserva firma, orden, copias independientes, valores originales y montos cero.
- Ante ausencia o corrupción del JSON, no hagas fallback: el error debe hacerse visible.
- Usa únicamente la biblioteca estándar.

## Finalización

Ejecuta `python -m unittest discover -s tests -v`, revisa `git diff`, describe qué fue realmente verificado y qué quedó pendiente. Sin commits ni pushes.
