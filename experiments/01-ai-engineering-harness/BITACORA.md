# Bitácora: dependencia obligatoria y contexto de ingeniería

## Pregunta e hipótesis

**Pregunta:** ¿qué ocurre cuando una función necesita un archivo de política local que Claude Web no recibe y Claude Code sí puede consultar?

**Hipótesis:** el acceso a los archivos reales permite resolver y verificar la tarea dentro del proyecto; sin ellos el resultado integrado no es verificable.

## Condiciones iniciales

- Fecha:
- Modelo Claude Web:
- Modelo Claude Code:
- ¿Web inició conversación nueva sin proyecto ni archivos adicionales?: Sí / No
- ¿Code inició sesión nueva dentro de la copia temporal?: Sí / No
- ¿Ambos recibieron los prompts del repositorio sin pistas extras?: Sí / No
- ¿La copia temporal partió de la última plantilla?: Sí / No

## Resultados

| Evidencia | Claude Web | Claude Code |
| --- | --- | --- |
| ¿Detectó dependencia en src/customer_policy.py? | | |
| ¿Tuvo acceso al JSON config/customer_policy.json? | No | |
| ¿Tuvo acceso al contrato de negocio? | No | |
| ¿Inventó reglas o solicitó los archivos faltantes? | | |
| ¿Trabajó con el código real o con una reconstrucción aislada? | | |
| ¿El archivo de política se usó durante la ejecución? | | |
| ¿Qué pruebas ejecutó y en qué entorno? | | |
| ¿Cuál fue su estado final declarado? | | |
| ¿Qué evidencia y qué pendientes reconoció? | | |
| ¿Cambió el Git local de práctica? | No | |

## Verificación independiente

- Línea base: **14 pruebas: 9 PASS / 5 FAIL intencionales**.
- Pruebas posteriores a Claude Code: _____ PASS / _____ FAIL.
- ¿La política ausente produce FileNotFoundError?: Sí / No.
- ¿La lista de exclusiones se lee del JSON vigente?: Sí / No.
- ¿El diff preserva las dependencias del proyecto?: Sí / No.
- git diff --check: PASS / FAIL.
- ¿Se realizaron commits o pushes de la solución?: Sí / No.

## Conclusión

No equipares tests ejecutados contra stubs creados por un asistente a tests ejecutados contra el proyecto real. No afirmes que el cliente web no puede escribir código: sin la política, no puede demostrar compatibilidad con estas reglas locales.
