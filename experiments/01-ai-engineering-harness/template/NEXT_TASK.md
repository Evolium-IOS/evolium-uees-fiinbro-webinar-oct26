# Tarea abierta: selección de registros procesables

La función `select_processable_records` puede admitir registros que no deben procesarse.

## Requisitos del proyecto

- Los criterios completos de validez de `customer_id` y sus excepciones están en **`docs/CONTRATO_IDENTIFICADOR_CLIENTE.md`**.
- No es suficiente suponer que todo identificador no vacío es válido.
- Conserva firma pública, orden, objetos de entrada y comportamiento correcto existente.
- Usa solamente la biblioteca estándar de Python.

## Criterios de finalización

1. El comportamiento debe cumplir el contrato de negocio.
2. Las pruebas existentes y las nuevas pruebas de regresión deben pasar.
3. Ejecuta `python -m unittest discover -s tests -v` y revisa `git diff`.
4. No hagas commit ni push.
