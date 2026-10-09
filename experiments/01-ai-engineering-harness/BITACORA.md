# Bitácora del Experimento 01

## Pregunta

¿Qué cambia entre pedir una corrección sobre un fragmento pegado en Claude Web y trabajar dentro del repositorio con Claude Code?

## Hipótesis

La integración al repositorio permite consultar reglas, detectar requisitos existentes, ejecutar pruebas y revisar cambios sobre el código real.

## Condiciones

- Fecha:
- Claude Web (modelo visible):
- Claude Code (modelo visible):
- ¿Se enviaron exactamente los prompts incluidos en este repositorio?: Sí / No
- ¿Claude Web recibió solo el fragmento de código del prompt, sin otros archivos?: Sí / No
- ¿Claude Code inició nueva sesión en el repo temporal limpio?: Sí / No
- ¿Se suministraron aclaraciones adicionales durante la prueba?: Sí / No
- Observaciones:

## Resultados

| Evidencia | Claude Web | Claude Code |
| --- | --- | --- |
| ¿Qué información recibió al comenzar? | Función pegada | Archivo Python local |
| ¿Consultó o solicitó criterios faltantes? | | |
| ¿Qué supuso sobre customer_id válido? | | |
| ¿Qué solución propuso o aplicó? | | |
| ¿Consultó código existente y reglas? | | |
| ¿Agregó pruebas? | | |
| ¿Ejecutó pruebas? ¿Dónde? | | |
| ¿Qué archivos locales cambiaron? | | |
| ¿Existe diff verificable contra Git local? | | |
| ¿Cuánta intervención humana fue necesaria? | | |

## Verificación de Claude Code

- Línea base: ____ PASS y ____ FAIL.
- Resultado posterior: ____ PASS y ____ FAIL.
- git diff --check: PASS / FAIL.
- ¿Se conservaron orden, firma y entradas?: Sí / No / No verificado.
- ¿Se aplicó el criterio de customer_id del repositorio?: Sí / No / No verificado.
- ¿Se hicieron commits o pushes?: Sí / No.
- Capturas o salidas relevantes:

## Conclusión

Separa **capacidad de generar código**, **acceso al contexto del proyecto** y **evidencia de verificación**. No afirmes que el cliente web falló solo porque pidió aclaraciones, ni que su solución habría roto un sistema real sin haberla probado.
