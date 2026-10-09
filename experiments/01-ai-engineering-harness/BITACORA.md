# Bitácora del Experimento 01

Completa esta ficha después de ejecutar el cliente web y el agente en VS Code. Puedes copiarla a tu propio documento o completarla en tu fork.

## Pregunta

¿Qué cambia cuando usamos IA desde un cliente web sin acceso al repositorio frente a un agente que puede consultar instrucciones, ejecutar pruebas y revisar cambios?

## Hipótesis

Con contexto persistente y herramientas de validación, esperamos obtener **un proceso más verificable y reproducible**.

## Condiciones

- Fecha:
- Cliente web utilizado:
- Agente utilizado en VS Code:
- Proyecto Git (carpeta local):
- Versión de Python:
- ¿Se adjuntaron archivos al cliente web?: No
- ¿Se habilitó acceso al repositorio en el cliente web?: No

## Observaciones

| Pregunta | Cliente web | Agente en VS Code |
| --- | --- | --- |
| ¿Qué contexto recibió? | | |
| ¿Qué asumió que no estaba definido? | | |
| ¿Qué solución propuso o implementó? | | |
| ¿Qué archivos se modificaron? | No aplica, salvo acción manual | |
| ¿Se ejecutaron pruebas? | No, solo sugeridas, salvo herramientas habilitadas | |
| ¿Cuántas pruebas pasaron y fallaron? | No verificado en este entorno | |
| ¿Existe un diff revisable? | No, salvo trabajo manual | |
| ¿Qué evidencia conservarías? | | |

## Verificación técnica

- Pruebas en baseline: _____ pasan / _____ fallan.
- Pruebas después del agente: _____ pasan / _____ fallan.
- `git diff --check`: PASS / FAIL.
- ¿`customer_id` es un string no vacío?: Sí / No / Incierto.
- ¿Se conservó el orden?: Sí / No / Incierto.
- ¿Se conservaron los datos originales?: Sí / No / Incierto.
- ¿El alcance del diff fue apropiado?: Sí / No / Incierto.

## Interpretación

1. ¿Qué pudo resolver el cliente web?
2. ¿Qué criterios faltaban en el mensaje de la primera ejecución?
3. ¿Qué aportaron `NEXT_TASK.md`, `AGENTS.md` y las pruebas?
4. ¿Qué demostraría mejor la hipótesis? ¿Qué mediciones adicionales harían falta?
5. ¿Qué harías diferente si el proyecto fuera de producción?

## Conclusión

Escribe una conclusión basada en lo observado. No conviertas una sola ejecución en una afirmación universal sobre modelos, tokens o productividad.
