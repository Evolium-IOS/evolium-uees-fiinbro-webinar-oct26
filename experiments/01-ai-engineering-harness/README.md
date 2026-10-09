# Experimento 01 — IA dentro del entorno de ingeniería

## Pregunta

**¿Qué cambia cuando la IA trabaja dentro del proyecto y no solamente recibe contexto pegado en un chat?**

Comparamos la misma tarea en:
1. un cliente conversacional;
2. un agente de código dentro de un repositorio con instrucciones persistentes, código, pruebas, Git y terminal.

Esto **no** es un benchmark Claude vs. Codex.

## Demostración recomendada

Usar **Claude Desktop → Claude Code** como comparación principal.

Codex queda como alternativa o respaldo.

## Preparar el workspace en vivo

Desde PowerShell:

```powershell
.\scripts\prepare-demo.ps1
```

El script crea un repositorio Git local separado en:

```text
C:\Evolium\webinar-experiment-01-live
```

Abrir únicamente esa carpeta en VS Code.

## Línea base

El proyecto contiene una función pequeña de Python para procesar registros.

Hay 8 pruebas:
- 7 pasan;
- 1 falla intencionalmente porque un registro `ready` sin `customer_id` válido todavía llega al resultado.

Ejecutar:

```powershell
python -m unittest discover -s tests -v
```

## Restaurar después de un ensayo

```powershell
.\scripts\reset-demo.ps1
```

El script verifica el Git root exacto antes de hacer reset.
