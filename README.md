# Experimentos prácticos del webinar UEES y FIINBRO

**De Ingenieros a Investigadores: cómo la IA está redefiniendo el futuro de los datos y el desarrollo de software.**

Dos experimentos reproducibles, con preguntas de investigación, instrucciones, evidencias y conclusiones.

## [Experimento 01: el valor del contexto de ingeniería](experiments/01-ai-engineering-harness/README.md)

**Pregunta:** ¿qué cambia cuando pedimos a Claude Web que corrija un fragmento de código pegado en un chat, frente a pedir a Claude Code que corrija la misma función dentro de un repositorio con estándares, requisitos y pruebas existentes?

- **Claude Web:** recibe una función copiada y el problema que queremos corregir.
- **Claude Code:** recibe la misma tarea y la ruta del archivo Python, y puede consultar el proyecto.

La diferencia se evalúa en lo que cada uno conoce, decide y puede comprobar. No es un benchmark de modelos ni una afirmación de que todo código generado sin contexto romperá sistemas.

[Reproducir Experimento 01](experiments/01-ai-engineering-harness/README.md)

## [Experimento 02: extracción y validación de documentos bancarios](experiments/02-bank-document-to-orion/README.md)

**Pregunta:** ¿cómo comprobamos que los datos extraídos de un PDF son lo suficientemente confiables para una operación?

Aplicación Streamlit con PDFs de demostración, rutas TEXT y VISION, extracción, evidencia y validación.

[Reproducir Experimento 02](experiments/02-bank-document-to-orion/README.md)

## Requisitos generales

- Windows, PowerShell, Git, Python y VS Code.
- Experimento 01: Claude Web y Claude Code (Codex como alternativa).
- Experimento 02: clave válida y facturación de OpenAI API, separada de la suscripción de ChatGPT.

No publiques credenciales, claves API, archivos `.env` ni documentos bancarios privados.

[Guion y comprobaciones para el presentador](PRESENTER_RUNBOOK.md)
