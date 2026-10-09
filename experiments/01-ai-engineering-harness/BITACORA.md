# Experimento 01: observación y conclusión

**Pregunta:** ¿puede considerarse correcta una modificación generada por IA si no ha sido contrastada con la configuración y las pruebas reales del proyecto?

**Hipótesis:** el acceso al repositorio permite encontrar dependencias y criterios que no aparecen en el fragmento pegado a un chat.

## Evidencia disponible

| | Claude Web | Claude Code (versión con JSON obligatorio) |
| --- | --- | --- |
| Acceso al proyecto y `config/customer_policy.json` | No | Sí, si trabaja en la copia actualizada |
| Solución presentada | Aceptó strings no vacíos y enteros como IDs; omitió `load_customer_policy()` | Pendiente |
| Pruebas reportadas | 2 pruebas creadas en entorno aislado; ambas pasaron | Pendiente |
| Pruebas de este repositorio ejecutadas | No | Pendiente |
| Estado | Verificado solo en su entorno aislado; **no en el proyecto** | Pendiente |

**Nota de trazabilidad:** la respuesta de Claude Web fue compartida en la sesión de trabajo. No consta verificación independiente de que haya utilizado exactamente el último prompt publicado con el import de política; no se debe convertir esta observación en una afirmación de incumplimiento deliberado.

## Conclusión observada

**La solución web fue plausible, pero no estuvo validada contra las reglas del sistema.** El asistente declaró explícitamente que había supuesto qué era un identificador válido y que no conocía el código ni las pruebas reales.

El experimento muestra por qué **las dependencias, los contratos de negocio y las pruebas del proyecto son parte de la definición de “terminado”**. No demuestra inferioridad del modelo web ni, todavía, que Claude Code haya superado el ensayo actualizado.

## Verificación final pendiente

- Línea base esperada: **14 pruebas, 9 PASS y 5 FAIL** intencionales.
- Claude Code: _____ pruebas PASS / _____ FAIL.
- ¿Leyó `src/customer_policy.py` y `config/customer_policy.json`?: Sí / No.
- ¿Conservó la carga dinámica del JSON?: Sí / No.
- `git diff --check`: PASS / FAIL.
- Evidencia: salida real y diff.

[Guía y comandos](README.md)
