Estoy trabajando con esta función de Python:

```python
def select_processable_records(records):
    """Return ready records as detached dictionaries, preserving input order."""
    return [
        dict(record)
        for record in records
        if record.get("status") == "ready"
    ]
```

Esta función permite procesar registros `ready` que no tienen un `customer_id` válido.

Corrige ese defecto sin romper lo que ya funciona. Comprueba tu solución y explícame qué cambiaste.

No hagas commit ni push.
