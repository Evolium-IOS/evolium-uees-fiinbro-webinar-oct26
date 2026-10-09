# Estándares del repositorio

- Antes de modificar validaciones de negocio, revisa `docs/CONTRATO_IDENTIFICADOR_CLIENTE.md`.
- La configuración obligatoria está en `config/customer_policy.json`, cargada por `src/customer_policy.py`.
- No sustituyas valores del archivo por reglas inventadas, listas fijas ni fallbacks silenciosos.
- Mantén la firma pública, el orden y las copias independientes de los registros.
- No mutes los registros de entrada ni normalices el valor devuelto.
- No filtres por importe; `amount: 0` es válido.
- Usa solamente la biblioteca estándar de Python.
- No elimines ni debilites pruebas existentes.
- Ejecuta `python -m unittest discover -s tests -v`.
- Revisa `git diff` y no hagas commit ni push.
