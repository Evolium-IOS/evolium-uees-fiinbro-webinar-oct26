# Bitácora: contexto de ingeniería y agentes de IA

## Pregunta

¿Qué cambia cuando damos el mismo mensaje sin requisitos adjuntos a un cliente web y a un agente dentro de un repositorio con estándares y pruebas?

## Hipótesis

El acceso al repositorio permite al agente descubrir contexto persistente y verificar cambios directamente. Un cliente sin acceso debe pedir información, inferirla o declarar límites.

## Condiciones iniciales

- Fecha:
- Modelo utilizado en Claude Web:
- Modelo utilizado en Claude Code:
- ¿Se usó exactamente el mismo mensaje?: Sí / No
- ¿Claude Web estaba en una conversación nueva sin archivos ni proyecto conectado?: Sí / No
- ¿Claude Code inició sesión nueva dentro del repositorio temporal?: Sí / No
- ¿Partimos del commit demo: baseline?: Sí / No
- ¿Se dieron pistas adicionales a alguna condición?: Sí / No
- Desviaciones:

## Registro de observaciones

| Observación | Claude Web (sin contexto local) | Claude Code (con repositorio) |
| --- | --- | --- |
| ¿Pidió ver el código o preguntó por reglas? | | |
| ¿Formuló suposiciones? ¿Cuáles? | | |
| ¿Reconoció qué información le faltaba? | | |
| ¿Qué archivos leyó realmente? | No disponibles | |
| ¿Consultó AGENTS.md, CLAUDE.md y NEXT_TASK.md? | No disponibles | |
| ¿Qué cambio propuso o implementó? | | |
| ¿Ejecutó pruebas sobre qué archivos? | | |
| ¿Hubo diff contra el repositorio original? | | |
| ¿Qué intervención humana necesitó? | | |

## Evidencia independiente del repositorio

- Línea base: _____ pruebas correctas / _____ fallidas.
- Resultado después de Claude Code: _____ correctas / _____ fallidas.
- git diff --check: PASS / FAIL.
- Archivos modificados:
- ¿Cumple customer_id válido (existe, string, no vacío después de strip)?: Sí / No / No comprobado.
- ¿Se preservan firma, orden, datos originales y comportamiento válido?: Sí / No / No comprobado.
- ¿Se hicieron commits?: Sí / No.
- Captura o copia de salida real:

## Interpretación

1. ¿Qué pudo hacer Claude Web **sin recibir el código**? Si pidió más datos, ¿fue razonable?
2. ¿Claude Code encontró la información necesaria o también hizo suposiciones?
3. ¿Qué reglas empresariales habrían sido fáciles de pasar por alto sin documentación de proyecto?
4. ¿Qué aportaron los tests y Git para comprobar la corrección?
5. ¿Qué evidencia haría falta para afirmar que la IA mejoró seguridad, calidad o productividad?

## Conclusión

Formula una conclusión **sobre la diferencia de contexto disponible y el proceso de ingeniería**, no sobre la capacidad intrínseca del modelo. No afirmes que el código producido sin contexto necesariamente rompe sistemas.
