# Experimentos prácticos del webinar UEES y FIINBRO

**De Ingenieros a Investigadores: cómo la IA está redefiniendo el futuro de los datos y el desarrollo de software.**

## [Experimento 01: la IA frente a dependencias reales de un proyecto](experiments/01-ai-engineering-harness/README.md)

**Pregunta:** ¿puede una IA asegurar que corrigió correctamente una función empresarial cuando no recibió los módulos ni la configuración necesarios para ejecutar el código real?

- **Claude Web:** recibe un fragmento Python que llama a un módulo y una política local que no están adjuntos. Puede proponer una solución, pero no comprobar la integración real sin esos archivos.
- **Claude Code:** recibe la misma tarea funcional desde el repositorio, con acceso a dependencias, configuración, documentación, pruebas y Git.
- **Validación:** las pruebas detectan suposiciones sobre reglas empresariales y exigen usar la configuración activa, sin inventar valores por defecto.

Los archivos empresariales son ficticios y la comparación investiga **contexto y capacidad de verificación**, no inteligencia intrínseca de modelos.

[Reproducir Experimento 01](experiments/01-ai-engineering-harness/README.md)

## [Experimento 02: extracción y validación de PDFs bancarios](experiments/02-bank-document-to-orion/README.md)

Una aplicación de muestra con Streamlit, rutas TEXT y VISION y validaciones que ilustran las exigencias de ingeniería para una operación real.

[Reproducir Experimento 02](experiments/02-bank-document-to-orion/README.md)

## Requisitos

Windows, PowerShell, Git, Python, VS Code y Claude Web/Claude Code para el Experimento 01. El Experimento 02 necesita acceso y facturación API de OpenAI por separado.

No subas credenciales, claves, archivos `.env` ni documentos bancarios privados.

[Guion del presentador](PRESENTER_RUNBOOK.md)
