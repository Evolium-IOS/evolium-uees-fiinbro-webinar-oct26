# Guía para replicar el Experimento 02

## Objetivo

Reproducir un flujo que:
1. detecta si un PDF tiene texto utilizable;
2. selecciona TEXT o VISION;
3. extrae campos;
4. valida cada campo contra evidencia;
5. intenta reparar fallos de forma acotada;
6. devuelve un resultado estructurado y metadata.

## Preparación

```powershell
.\scripts\preparar-entorno.ps1
```

Editar:

```text
app\.env
```

y configurar `OPENAI_API_KEY`.

## Ejecutar

```powershell
.\scripts\iniciar-demo.ps1
```

Abrir:

`http://localhost:8501`

## Reproducir TEXT

Usar:

`app/assets/bank_statements/statement_sample1.pdf`

Observar la decisión del router y ejecutar extracción.

## Reproducir VISION

Usar:

`app/assets/bank_statements/statement_ocr.pdf`

Comparar:
- routing;
- metadata;
- campos;
- evidencia;
- comportamiento de validación.

## Preguntas de investigación

- ¿Qué ocurre con otro formato bancario?
- ¿Qué tan estable es la validación?
- ¿Qué debería hacerse si dos fuentes contradicen?
- ¿Qué campos deberían requerir revisión humana?
- ¿Qué controles necesitaríamos antes de usar esta salida dentro de una operación real?

Estas preguntas son el puente entre un experimento técnico y un sistema operativo.
