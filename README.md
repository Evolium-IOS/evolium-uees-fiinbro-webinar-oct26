# Experimentos prácticos del webinar UEES y FIINBRO

**De Ingenieros a Investigadores: cómo la IA está redefiniendo el futuro de los datos y el desarrollo de software.**

Estos dos experimentos están organizados como guías que pueden reproducirse con pasos, pruebas y conclusiones.

## [Experimento 01: el valor de un contexto de ingeniería](experiments/01-ai-engineering-harness/README.md)

**Pregunta:** ¿cómo cambia una corrección de código cuando el agente puede consultar estándares y un contrato de negocio que no están en el fragmento pegado a un chat?

- **Claude Web:** recibe el código de la función y la tarea.
- **Claude Code:** recibe la misma tarea funcional, la ruta del archivo y acceso a la documentación y las pruebas del repositorio.
- **Contrato ficticio:** especifica reglas propias de una empresa y pruebas que detectan su incumplimiento. No se adjunta a Claude Web.

El objetivo es observar el valor del contexto y la validación; no demostrar que un modelo sea universalmente mejor que otro.

[Reproducir Experimento 01](experiments/01-ai-engineering-harness/README.md)

## [Experimento 02: extracción y validación de estados de cuenta bancarios](experiments/02-bank-document-to-orion/README.md)

**Pregunta:** ¿cómo comprobamos si un dato extraído de un PDF es confiable para una operación?

Aplicación Streamlit con PDFs de demostración, rutas TEXT y VISION, evidencia y validación.

[Reproducir Experimento 02](experiments/02-bank-document-to-orion/README.md)

## Requisitos

- Windows con PowerShell, Git, Python y VS Code.
- Experimento 01: Claude Web y Claude Code desde la terminal.
- Experimento 02: acceso y facturación activa de OpenAI API, independientes de una suscripción a ChatGPT.

No publiques claves API, archivos `.env`, credenciales ni documentos privados.

[Guion del presentador](PRESENTER_RUNBOOK.md)
