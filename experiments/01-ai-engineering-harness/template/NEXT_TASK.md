# Tarea

Actualiza `select_processable_records` para que los registros sin un `customer_id` válido no lleguen al resultado.

## Criterios de aceptación

Un `customer_id` válido:
- existe;
- es un string;
- no queda vacío después de remover espacios al inicio/final.

Conserva:
- la firma pública;
- el comportamiento para registros `ready` válidos;
- el orden de entrada;
- los objetos de entrada sin mutarlos.

Ejecuta:

```text
python -m unittest discover -s tests -v
```

Todas las pruebas deben pasar.

Revisa `git diff` antes de declarar éxito.

No hagas commit.
