# Contexto del proyecto para Claude Web

Este archivo contiene **el mismo contenido inicial** de los cinco archivos que el agente encuentra en el repositorio local de práctica. Son archivos de una plantilla de demostración, no datos privados.

**Instrucciones de uso:** adjunta este archivo completo a una conversación nueva de Claude Web. Luego envía el mensaje de [mensaje-unico.md](mensaje-unico.md) sin alterarlo. No conectes Claude Web a archivos locales, Git, terminal ni proyectos adicionales.

Esta copia corresponde a la línea base del experimento. Si editas la plantilla, tendrás que actualizar también este documento para conservar la igualdad de contexto.

## Archivo: NEXT_TASK.md

~~~markdown
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
~~~

## Archivo: AGENTS.md

~~~markdown
# Instrucciones del repositorio

- Conserva la firma pública de la función.
- Usa solamente la biblioteca estándar de Python.
- No mutes los registros de entrada.
- Conserva el orden de los registros devueltos.
- Mantén los cambios limitados al comportamiento solicitado.
- No elimines ni debilites pruebas no relacionadas.
- Ejecuta:
  `python -m unittest discover -s tests -v`
- Revisa `git diff` antes de declarar éxito.
- No hagas commit salvo instrucción explícita.
~~~

## Archivo: CLAUDE.md

~~~markdown
# Instrucciones para Claude Code

Lee `AGENTS.md` y `NEXT_TASK.md` antes de modificar archivos.

La tarea es intencionalmente pequeña. Mantén la implementación mínima, conserva el comportamiento existente, ejecuta todas las pruebas y revisa `git diff` antes de reportar finalización.

No hagas commit.
~~~

## Archivo: src/records.py

~~~python
def select_processable_records(records):
    """Return ready records as detached dictionaries, preserving input order."""
    return [
        dict(record)
        for record in records
        if record.get("status") == "ready"
    ]
~~~

## Archivo: tests/test_records.py

~~~python
import unittest

from src.records import select_processable_records


class SelectProcessableRecordsTests(unittest.TestCase):
    def test_returns_ready_record(self):
        rows = [{"customer_id": "C-001", "email": "a@example.com", "amount": 25, "status": "ready"}]
        self.assertEqual(select_processable_records(rows), rows)

    def test_excludes_pending_record(self):
        rows = [{"customer_id": "C-001", "email": "a@example.com", "amount": 25, "status": "pending"}]
        self.assertEqual(select_processable_records(rows), [])

    def test_preserves_order(self):
        rows = [
            {"customer_id": "C-002", "status": "ready"},
            {"customer_id": "C-001", "status": "ready"},
        ]
        self.assertEqual(
            [row["customer_id"] for row in select_processable_records(rows)],
            ["C-002", "C-001"],
        )

    def test_returns_detached_dicts(self):
        rows = [{"customer_id": "C-001", "status": "ready"}]
        result = select_processable_records(rows)
        self.assertIsNot(result[0], rows[0])

    def test_does_not_mutate_input(self):
        rows = [{"customer_id": "C-001", "status": "ready"}]
        snapshot = [dict(row) for row in rows]
        select_processable_records(rows)
        self.assertEqual(rows, snapshot)

    def test_preserves_zero_amount(self):
        rows = [{"customer_id": "C-001", "amount": 0, "status": "ready"}]
        self.assertEqual(select_processable_records(rows)[0]["amount"], 0)

    def test_handles_empty_input(self):
        self.assertEqual(select_processable_records([]), [])

    def test_excludes_missing_customer_id(self):
        rows = [{"email": "missing@example.com", "amount": 50, "status": "ready"}]
        self.assertEqual(select_processable_records(rows), [])


if __name__ == "__main__":
    unittest.main()
~~~
