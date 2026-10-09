# Estándares del repositorio

- Antes de modificar validaciones de negocio, identifica y consulta la documentación de `docs/`.
- La política de identificadores de cliente se define en `docs/CONTRATO_IDENTIFICADOR_CLIENTE.md`; no inventes el formato ni excepciones.
- Conserva la firma pública, el orden y el comportamiento existente de los registros válidos.
- Usa solamente la biblioteca estándar de Python.
- No modifiques los diccionarios de entrada ni normalices sus valores.
- Limita los cambios al comportamiento solicitado.
- No elimines ni debilites pruebas existentes.
- Ejecuta `python -m unittest discover -s tests -v`.
- Revisa `git diff` antes de declarar éxito.
- No hagas commit ni push salvo autorización explícita.
