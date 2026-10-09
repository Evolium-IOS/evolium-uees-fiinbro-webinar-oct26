# Experimentos prácticos del webinar UEES y FIINBRO

**De Ingenieros a Investigadores: cómo la IA está redefiniendo el futuro de los datos y el desarrollo de software.**

Dos experimentos reproducibles: cada guía presenta la pregunta, una hipótesis, las acciones y la verificación.

## [Experimento 01: la IA dentro de un entorno de ingeniería](experiments/01-ai-engineering-harness/README.md)

**Pregunta:** ¿qué cambia cuando Claude Web y Claude Code reciben el mismo mensaje breve, sin código ni requisitos adjuntos, pero solo Claude Code tiene acceso a un repositorio que ya contiene reglas, código y pruebas?

Claude Web recibe **solo el prompt**. Claude Code recibe **el mismo prompt** desde la terminal de VS Code, donde puede descubrir las instrucciones y el código del proyecto. Comparamos las suposiciones, las preguntas, los cambios y la evidencia realmente producida. No es una prueba de superioridad entre modelos.

[Reproducir Experimento 01](experiments/01-ai-engineering-harness/README.md)

## [Experimento 02: extraer y validar datos de un PDF bancario](experiments/02-bank-document-to-orion/README.md)

**Pregunta:** ¿cómo sabemos que un dato extraído de un documento es suficientemente confiable para utilizarlo en una operación?

Se ejecuta una aplicación Streamlit con PDFs de demostración, rutas TEXT y VISION, extracción, evidencia y validación. Luego se identifican los controles adicionales que necesitaría una operación real.

[Reproducir Experimento 02](experiments/02-bank-document-to-orion/README.md)

## Requisitos

- Windows con PowerShell, Git, Python y VS Code.
- Experimento 01: Claude Web y Claude Code desde la terminal (Codex como respaldo, no como condición principal).
- Experimento 02: clave válida y facturación de OpenAI API. Una suscripción de ChatGPT no cubre necesariamente el consumo API.

No publiques claves, archivos `.env`, credenciales ni documentos bancarios privados.

**Para el presentador:** [guion y comprobaciones](PRESENTER_RUNBOOK.md).
