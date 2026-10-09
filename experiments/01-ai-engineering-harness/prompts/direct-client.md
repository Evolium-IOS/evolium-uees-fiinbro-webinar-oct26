# Direct-client prompt

Tengo esta función:

```python
def select_processable_records(records):
    return [
        dict(record)
        for record in records
        if record.get("status") == "ready"
    ]
```

Cada registro puede tener customer_id, email, amount y status.

Necesito que los registros sin un customer_id válido no lleguen al resultado.

Restricciones:
- conserva la firma pública;
- conserva el orden;
- no mutes los registros de entrada;
- conserva el comportamiento existente para registros válidos;
- usa solo la biblioteca estándar de Python.

Propón el cambio y las pruebas que agregarías.

Presenter note: do not give the direct client repository or terminal access. The point is to show that its context is exactly what you supplied.
