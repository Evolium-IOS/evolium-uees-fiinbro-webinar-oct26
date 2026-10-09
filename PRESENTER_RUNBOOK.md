# Guía del presentador

## Preparación del Experimento 01

- Proyecto principal actualizado con git pull.
- Copia temporal actualizada con **reset-demo.ps1 -ActualizarPlantilla** (descarta cambios de la práctica).
- Verificar que existen **src/customer_policy.py** y **config/customer_policy.json** en el repositorio temporal.
- Línea base: **14 pruebas, 9 PASS y 5 FAIL intencionales**.
- Claude Web: conversación nueva, sin adjuntos, proyectos ni accesos al repositorio.
- Claude Code: sesión nueva desde VS Code en C:\Evolium\webinar-experiment-01-live.
- Prompts preparados: prompts/claude-web.md y prompts/claude-code.md.
- Modelos equivalentes cuando estén disponibles. No mostrar la política al cliente web.
- Experimento 02 listo con Streamlit en ejecución, credenciales ocultas y PDF de prueba.

## Apertura

> "En una empresa, el código depende de contratos y archivos de configuración. ¿Puede una IA certificar una corrección sin disponer de ellos?"

## Claude Web: fragmento aislado

1. Pegar **todo** prompts/claude-web.md, incluido el import de un módulo que no se entregó.
2. No proporcionar archivos adicionales.
3. Mostrar si detecta la dependencia, si propone una implementación con supuestos y qué declara en **Estado, Evidencia y Pendientes**.
4. Si ejecuta tests en una reconstrucción propia, aclarar que **no son las pruebas del repositorio empresarial**.

## Claude Code: acceso a archivos reales

1. Abrir el repo temporal en VS Code y confirmar carpeta.
2. Mostrar línea base con fallos intencionales.
3. Pegar **todo** prompts/claude-code.md en una nueva sesión Claude Code.
4. Observar si consulta la política JSON, el módulo cargador, el contrato y las pruebas.
5. Permitir editar y probar; no commits ni pushes.
6. Salir y verificar independientemente con unittest y git diff.

## Revelación y conclusión

Abrir **config/customer_policy.json** y **docs/CONTRATO_IDENTIFICADOR_CLIENTE.md** solo tras mostrar las respuestas.

> "La diferencia no está en escribir una función. Está en conocer las dependencias reales y poder demostrar que el cambio respeta el sistema existente."

La dependencia empresarial es **ficticia**. No afirmar que Claude Web es incapaz de programar: sin ese archivo no puede comprobar la integración con el sistema real. Tampoco afirmar superioridad intrínseca o seguridad absoluta de Claude Code.

[Instrucciones](experiments/01-ai-engineering-harness/README.md) | [Bitácora](experiments/01-ai-engineering-harness/BITACORA.md)

## Experimento 02 (PDF bancario)

1. Abrir la aplicación Streamlit ya iniciada.
2. Cargar un PDF de prueba sin datos privados.
3. Mostrar TEXT o VISION.
4. Ejecutar extracción y validación; leer PASS/FAIL/UNCERTAIN y evidencias.
5. Conectar conceptualmente con ORION, sin afirmar que el extractor sea ORION.

No mostrar claves API, archivos .env ni datos reales durante el webinar.
