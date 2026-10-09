# Bitácora: experimento controlado de IA e ingeniería

## Pregunta e hipótesis

**Pregunta:** ¿qué aporta un entorno de ingeniería cuando dos asistentes reciben la misma tarea y documentación técnica?

**Hipótesis:** con acceso operativo a repositorio, pruebas y Git se facilita la verificación directa de cambios.

## Control inicial

- Fecha:
- Modelo de Claude Web (nombre/versión visible):
- Modelo de Claude Code (nombre/versión visible):
- ¿Se utilizó el mismo mensaje de prompts/mensaje-unico.md?: Sí / No
- ¿Se adjuntó contexto-web.md completo a Claude Web?: Sí / No
- ¿El agente partió del tag demo-baseline?: Sí / No
- ¿Se habilitaron herramientas de ejecución adicionales en Claude Web?: Sí / No
- Desviaciones del procedimiento:

## Observaciones

| Pregunta | Claude Web | Claude Code |
| --- | --- | --- |
| ¿Qué archivos o instrucciones consultó? | | |
| ¿Cumplió el criterio de customer_id? | | |
| ¿Qué cambio propuso o aplicó? | | |
| ¿Añadió pruebas? | | |
| ¿Editó el proyecto local? | | |
| ¿Ejecutó las pruebas del repositorio? | | |
| ¿Mostró un diff real? | | |
| ¿Qué verificó efectivamente? | | |
| ¿Qué intervención manual fue necesaria? | | |

## Evidencia técnica

- Línea base: _____ pruebas pasan, _____ fallan.
- Después de Claude Code: _____ pruebas pasan, _____ fallan.
- Revisión independiente de git diff --check: PASS / FAIL.
- ¿Claude Web entregó un parche aplicable?: Sí / No.
- ¿Se aplicó ese parche a una copia limpia y se ejecutó la misma suite?: Sí / No.
- Si se ejecutó, resultado: _____ pasan, _____ fallan.
- Archivos cambiados:
- Capturas o registro de salida:

## Interpretación

1. ¿En cuál condición se observó lectura efectiva de las instrucciones de proyecto?
2. ¿La calidad funcional del código pudo compararse con las mismas pruebas? ¿Por qué?
3. ¿Qué parte del proceso exigió intervención manual?
4. ¿Qué evidencias permiten afirmar que un cambio fue comprobado?
5. ¿Qué resultados **no** podemos concluir a partir de una sola demostración?

## Conclusión basada en datos

Describe lo observado sin afirmar que un modelo es universalmente superior o que la ingeniería garantiza resultados correctos.
