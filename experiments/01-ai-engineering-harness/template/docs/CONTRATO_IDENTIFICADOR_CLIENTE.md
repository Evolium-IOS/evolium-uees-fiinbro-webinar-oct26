# Contrato empresarial CL-014: selección de registros

Esta política es **ficticia** y existe para demostrar un sistema con reglas internas que no se pueden inferir de una función aislada.

## Dependencia obligatoria

**La fuente de verdad operativa es `config/customer_policy.json`**. El módulo `src/customer_policy.py` lo carga durante la ejecución de `select_processable_records`. El programa no debe inventar valores predeterminados si falta ese archivo: debe fallar explícitamente.

El formato del JSON indica:

- `processable_status`: estado exacto que se permite procesar.
- `customer_id_regex`: expresión regular que debe coincidir con **todo** el identificador validado; usa `re.fullmatch`.
- `reserved_customer_ids`: identificadores que se excluyen aunque coincidan con el patrón.
- `policy_revision`: identificador documental de esta versión de política.

No copies una lista fija de exclusiones al código. La política puede cambiar entre ejecuciones; las pruebas verifican que se consulte el archivo activo.

## Compatibilidad y validación

1. `customer_id` debe existir y ser `str`.
2. Se utiliza `strip()` **solo para validar**, no para modificar ni normalizar el valor devuelto.
3. El identificador validado debe coincidir por completo con `customer_id_regex` y no pertenecer a `reserved_customer_ids`.
4. Mantén la firma pública `select_processable_records(records)`, el orden, las copias independientes `dict(record)` y la entrada sin mutaciones.
5. No se filtra por `amount`; el monto cero es válido.
6. Biblioteca estándar de Python exclusivamente.
7. Ejecuta las pruebas y revisa `git diff` antes de confirmar la corrección.

La documentación describe el **significado de los campos**; los valores autorizados provienen exclusivamente del JSON local.
