# Prompt para cliente conversacional

Usar en una conversación nueva.

---

Tengo esta función:

```python
def select_processable_records(records):
    return [
        dict(record)
        for record in records
        if record.get("status") == "ready"
    ]
```

Cada registro puede contener `customer_id`, `email`, `amount` y `status`.

Necesito que los registros sin un `customer_id` válido no lleguen al resultado.

Restricciones:
- conserva la firma pública;
- conserva el orden;
- no mutes los registros de entrada;
- conserva el comportamiento existente para registros válidos;
- usa solamente la biblioteca estándar de Python.

Propone el cambio y las pruebas que agregarías.

---

## Nota para la presentación

No dar acceso secreto al repositorio o terminal. El objetivo es mostrar que el contexto disponible es exactamente el que se proporcionó.
