# Mensaje único para Claude Web y Claude Code

Copia **exactamente** el texto siguiente, sin añadir detalles ni adaptarlo al entorno. Se utiliza tanto en Claude Web como en Claude Code desde la terminal de VS Code.

~~~text
Implementa la tarea descrita en NEXT_TASK.md, respetando AGENTS.md y CLAUDE.md.
Examina src/records.py y tests/test_records.py antes de proponer cambios.
Realiza el cambio mínimo necesario y agrega pruebas para los casos que falten.
Usa únicamente las herramientas que realmente tengas disponibles para aplicar los cambios, ejecutar las pruebas y revisar git diff.
Si no puedes editar archivos, ejecutar pruebas o consultar Git, entrega un parche concreto e indica claramente qué acciones no pudiste verificar.
No hagas commit ni push.
En tu respuesta final, indica qué documentos consultaste, qué cambió y qué evidencia respalda el resultado.
~~~

## Condiciones

- **Claude Web:** crea una conversación nueva y adjunta primero [contexto-web.md](contexto-web.md), que contiene el contenido de todos los archivos iniciales. No habilites acceso al repositorio, terminal u otras herramientas de ejecución locales.
- **Claude Code:** inicia el agente desde la raíz del repositorio temporal con los mismos cinco archivos en la línea base. El agente podrá leerlos por su cuenta.
- Si puedes, selecciona la misma familia y versión de modelo en ambas interfaces. Registra el modelo utilizado en la bitácora.
- La tarea, los criterios, la implementación y las pruebas iniciales deben ser los mismos. La diferencia buscada es **cómo se accede al proyecto y qué acciones se pueden verificar dentro de su entorno**.
