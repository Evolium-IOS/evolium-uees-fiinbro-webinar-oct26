# Bitácora del Experimento 01

## Pregunta

¿Permite el contexto documentado de un repositorio identificar y respetar normas que no aparecen en una función de Python aislada?

## Hipótesis

El agente dentro del repositorio puede consultar el contrato de negocio y verificar sus cambios; el cliente web que solo recibe un fragmento no conoce los criterios empresariales específicos.

## Condiciones

- Fecha:
- Modelo Claude Web:
- Modelo Claude Code:
- ¿Se usaron los dos prompts documentados, sin modificaciones?: Sí / No
- ¿Claude Web estaba en una conversación nueva sin archivos adjuntos?: Sí / No
- ¿Claude Code inició una sesión nueva con la línea base actualizada?: Sí / No
- ¿Se dieron aclaraciones o pistas adicionales?: Sí / No
- Desviaciones:

## Evidencia por condición

| Observación | Claude Web | Claude Code |
| --- | --- | --- |
| ¿Qué información tuvo disponible? | Código pegado | Repositorio completo |
| ¿Preguntó por reglas de negocio? | | |
| ¿Qué supuso sobre identificadores válidos? | | |
| ¿Consultó el contrato empresarial? | No disponible | |
| ¿Qué propuso o modificó? | | |
| ¿Ejecutó pruebas? ¿Dónde? | | |
| ¿Probó formatos específicos y el ID reservado? | No se informaron en el prompt | |
| ¿Revisó un diff del Git local? | | |
| ¿Qué intervención humana hizo falta? | | |

## Verificación independiente del proyecto

- Línea base esperada: 8 PASS y 3 FAIL (11 pruebas).
- Resultado después del agente: ____ PASS y ____ FAIL.
- git diff --check: PASS / FAIL.
- ¿La solución respeta docs/CONTRATO_IDENTIFICADOR_CLIENTE.md?: Sí / No / No comprobado.
- ¿Se preservan firma, orden, datos de entrada y montos cero?: Sí / No / No comprobado.
- ¿Se hizo commit de la solución?: Sí / No.
- Evidencia o capturas:

## Interpretación

1. ¿Claude Web pidió las reglas que no recibió o las supuso?
2. ¿Claude Code encontró y utilizó la documentación del negocio antes de editar?
3. ¿Qué pruebas habrían quedado fuera de una solución basada únicamente en el fragmento pegado?
4. ¿Cuál es la diferencia entre una función plausible y un cambio verificable en un proyecto?
5. ¿Qué conclusiones no se pueden extraer de una sola ejecución?

## Conclusión

Atribuye las diferencias al contexto y las herramientas disponibles **solo en la medida en que las observaciones lo respalden**. No afirmes que el cliente web necesariamente falló sin haber probado su solución contra el contrato.
