# Experimentos prácticos del webinar UEES y FIINBRO

**De Ingenieros a Investigadores: cómo la IA está redefiniendo el futuro de los datos y el desarrollo de software.**

Este repositorio contiene **dos experimentos reproducibles**. Cada guía empieza con una pregunta de investigación e incluye los pasos para preparar el entorno, ejecutar el experimento, verificar resultados y analizar qué aprendimos.

## Sigue los experimentos en orden

### [Experimento 01: la IA dentro de un entorno de ingeniería](experiments/01-ai-engineering-harness/README.md)

**Pregunta:** ¿qué aporta un entorno de ingeniería cuando Claude Web y Claude Code reciben la misma tarea, el mismo mensaje y la misma información inicial?

Primero se trabaja en Claude Web con el contexto adjunto. Después se usa Claude Code desde la terminal integrada de VS Code para aplicar, probar y revisar el cambio. El propósito es distinguir código propuesto de código verificado.

[Comenzar experimento 01](experiments/01-ai-engineering-harness/README.md)

### [Experimento 02: extraer y validar datos de un PDF bancario](experiments/02-bank-document-to-orion/README.md)

**Pregunta:** ¿cómo sabemos que un dato extraído de un documento es suficientemente confiable para utilizarlo en una operación?

Se ejecuta una aplicación Streamlit con PDFs de demostración, rutas TEXT y VISION, extracción, evidencia y validación. Luego se identifican los controles adicionales que necesitaría una operación real.

[Comenzar experimento 02](experiments/02-bank-document-to-orion/README.md)

## Qué necesitas

- Windows con PowerShell, Git, Python y VS Code.
- Para el experimento 01: acceso a Claude Web y Claude Code desde terminal (Codex es opcional como respaldo).
- Para el experimento 02: una clave válida de OpenAI API y facturación API configurada. Una suscripción de ChatGPT no incluye necesariamente ese consumo.

## Importante

Los ejemplos son de investigación y demostración, no de producción. No subas datos bancarios reales, credenciales, claves API ni archivos `.env`.

**Para quien presenta el webinar:** [guía de presentación y lista de ensayo](PRESENTER_RUNBOOK.md).
