# Guía del presentador y lista de ensayo

**Uso:** este archivo reúne el orden de exposición y el checklist. Los participantes solo necesitan las guías README de cada experimento.

## Antes de iniciar

- Presentación del webinar abierta.
- Claude Web con conversación nueva, sin proyecto ni herramientas locales.
- Archivo **experiments/01-ai-engineering-harness/prompts/contexto-web.md** listo para adjuntar.
- **prompts/mensaje-unico.md** abierto para copiar exactamente el mismo mensaje en ambas interfaces.
- En la medida de lo posible, misma familia y versión de modelo en Claude Web y Claude Code.
- VS Code abierto exclusivamente en **C:\Evolium\webinar-experiment-01-live**.
- Terminal integrada ubicada en esa misma carpeta.
- Experimento 01 restaurado al tag demo-baseline (7 pruebas pasan, 1 falla intencional).
- Experimento 02 iniciado previamente y disponible en http://localhost:8501.
- Un PDF de muestra sin datos privados preparado para carga.
- Clave API configurada pero nunca visible durante la presentación.
- Ventanas listas, fuente grande, notificaciones desactivadas.
- Evidencia real del ensayo preparada como respaldo si una ejecución falla o tarda.

## Experimento 01 (4 a 5 minutos)

### Apertura: pregunta e hipótesis

> "Como investigadores, preguntamos qué añade un entorno de ingeniería si un asistente conoce los mismos requisitos y la misma documentación. Nuestra hipótesis es que la integración con pruebas, archivos y Git hace más verificable el cambio."

### Condición A: Claude Web

1. Abrir conversación nueva.
2. Adjuntar **experiments/01-ai-engineering-harness/prompts/contexto-web.md**.
3. Enviar el texto exacto de **experiments/01-ai-engineering-harness/prompts/mensaje-unico.md**.
4. Mostrar la propuesta sin afirmar que sus pruebas pasaron en local.

> "En el chat están las reglas y la implementación inicial. ¿Nos ha entregado una solución? Puede ser. ¿La hemos ejecutado en el proyecto? Todavía no."

### Condición B: Claude Code desde VS Code

1. Mostrar que terminal y Git apuntan a C:\Evolium\webinar-experiment-01-live.
2. Ejecutar la línea base: 7 PASS, 1 FAIL intencional.
3. Enseñar NEXT_TASK.md, AGENTS.md, CLAUDE.md, src/records.py y tests/test_records.py.
4. Ejecutar claude desde terminal integrada.
5. Pegar **el mismo mensaje** que recibió Claude Web.
6. Observar lectura de archivos, edición y ejecución de pruebas.
7. Salir del agente; ejecutar unittest y git diff de forma independiente.
8. No hacer commit ni push.

### Conclusión y límites

> "Ambas condiciones disponían del contenido técnico inicial. La diferencia que estudiamos fue cómo se integró la respuesta con el repositorio, las pruebas y el control de cambios."

Una sola ejecución no demuestra superioridad universal, ahorro de tokens ni mayor precisión del código. Para comparar calidad de soluciones, habría que aplicar el parche de Claude Web a una copia limpia independiente y someterlo a las mismas pruebas.

[Guía de reproducción](experiments/01-ai-engineering-harness/README.md) | [Bitácora](experiments/01-ai-engineering-harness/BITACORA.md)

## Experimento 02 (4 a 5 minutos)

### Apertura

> "Ahora cambiamos de problema: ¿cómo sabemos si un dato extraído de un PDF es suficientemente confiable para utilizarlo?"

1. Abrir la interfaz Streamlit ya iniciada.
2. Cargar un PDF de demostración aprobado.
3. Mostrar ruta TEXT o VISION.
4. Ejecutar "Extraer y validar".
5. Mostrar tabla, evidencias, estados PASS/FAIL/UNCERTAIN y metadatos reales.
6. Señalar cualquier reparación únicamente si la ejecución realmente la hizo.
7. Preguntar qué ocurre ante una excepción, una contradicción o una validación fallida.

### Transición a ORION

> "Extraer el dato era solo el comienzo. Una operación real necesita reglas, contexto, revisión, decisiones y gobernanza."

Aclarar que el extractor **no es** ORION y que el vínculo es conceptual.

[Guía de reproducción](experiments/02-bank-document-to-orion/README.md)

## Seguridad en vivo

- No mostrar claves API, archivos .env, datos bancarios privados ni rutas personales sensibles.
- No instalar dependencias durante la presentación.
- No cambiar manualmente el código ni ejecutar dos agentes a la vez.
- Si algo falla, mostrar solo evidencia de ensayos realizados y distinguirla de la ejecución actual.
