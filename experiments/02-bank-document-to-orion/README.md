# Experimento 02: De documentos bancarios a un sistema operativo

## Pregunta

**¿Cómo una investigación técnica enfocada revela la necesidad de un sistema operativo más amplio?**

El experimento real procesa estados de cuenta bancarios y demuestra este flujo:

```text
documento
  → detectar tipo de PDF
  → extraer campos
  → validar contra evidencia
  → reparar de forma acotada
  → resultado estructurado
```

Luego hacemos la pregunta importante:

**¿Qué falta para que esto funcione dentro de una operación real?**

```text
reglas
  → contexto
  → revisión humana
  → flujo de trabajo
  → decisiones
  → gobernanza
```

Ese es el puente conceptual hacia ORION.

## Proyecto

El código real está en:

```text
app/
```

La UI se ejecuta con Streamlit.

## Inicio rápido para el webinar

Primera vez:

```powershell
.\scripts\preparar-entorno.ps1
```

Luego configurar:

```text
app\.env
```

Para iniciar la demo:

```powershell
.\scripts\iniciar-demo.ps1
```

La aplicación abre normalmente en:

```text
http://localhost:8501
```

## Seguridad

Utilizar únicamente los PDFs de demostración aprobados.

Nunca presentar documentos bancarios reales, claves API, archivos `.env` ni información personal.
