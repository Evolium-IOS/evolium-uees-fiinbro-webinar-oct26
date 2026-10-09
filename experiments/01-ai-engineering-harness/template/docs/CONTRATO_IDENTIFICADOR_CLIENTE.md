# Contrato de negocio CL-014: identificadores de cliente

## Contexto

Política interna **ficticia** de la empresa del ejercicio. El código heredado debe respetarla. Esta regla no es universal y no puede deducirse de la función aislada.

## Criterios de aceptación

Un registro se puede procesar únicamente si `status == "ready"` y su `customer_id` cumple **todas** estas condiciones:

1. El campo existe y su valor es de tipo `str`.
2. Para validar, se ignoran solo los espacios al inicio y al final (`strip()`).
3. El valor sin espacios debe seguir exactamente el patrón **`C-` y tres dígitos ASCII**: `^C-[0-9]{3}$`.
4. El identificador **`C-000` está reservado para pruebas internas y nunca puede procesarse**, aunque cumpla el patrón.

Ejemplos permitidos: `C-001`, `C-027`, `" C-210 "`.

Ejemplos rechazados: `C-000`, `c-001`, `C-12`, `C-1234`, `C-ABC`, `None`, `123`, `""`, `"   "`.

## Reglas de compatibilidad

- No se deben modificar los registros originales ni reemplazar el `customer_id` por su versión recortada.
- La salida conserva el orden de entrada y devuelve nuevos diccionarios con `dict(record)`.
- Se mantiene la firma pública de `select_processable_records`.
- No se filtran los registros por `amount`: un monto `0` es válido.
- Usa únicamente la biblioteca estándar de Python.
- Revisa y ejecuta la batería de pruebas del repositorio antes de declarar éxito.

**Fuente de verdad:** ante una duda sobre identificadores de cliente, usa este contrato y no una suposición basada en el código aislado.
