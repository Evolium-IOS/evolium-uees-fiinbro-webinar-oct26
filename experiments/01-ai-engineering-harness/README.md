# Experimento 01: código aislado frente a un proyecto con dependencias reales

## Pregunta

**¿Qué ocurre cuando pedimos a la IA que arregle una función que requiere archivos de configuración propios de una empresa, pero solo una interfaz tiene acceso al repositorio?**

**Hipótesis:** el asistente con acceso al proyecto puede encontrar los módulos, la política operativa y las pruebas para implementar y verificar la corrección. El cliente que recibe solo un fragmento no puede verificar el comportamiento real si le faltan archivos indispensables.

**Importante:** el acceso a dependencias es la variable deliberada. No evaluamos cuál modelo es intrínsecamente mejor.

## Diseño

| | Claude Web | Claude Code |
| --- | --- | --- |
| Problema | Corregir registros que deberían excluirse | El mismo |
| Código inicial | Fragmento de src/records.py pegado en el mensaje | Lee src/records.py del proyecto |
| Dependencia src/customer_policy.py | No disponible | Disponible |
| Configuración obligatoria config/customer_policy.json | No disponible | Disponible |
| Contrato y pruebas | No disponibles | Disponibles |
| Resultado esperado | Identificar información faltante o aclarar límites | Leer dependencias, corregir y verificar en el repositorio |

La función **carga la configuración local cada vez que se ejecuta**. Sin el JSON, no puede completarse una ejecución integrada válida. El cliente web puede escribir código alternativo o inventar un entorno simulado, pero eso **no verifica el sistema empresarial real**. El contrato y la configuración son ficticios, creados únicamente para el experimento.

Los mensajes son equivalentes en tarea, pero uno incluye el fragmento de Python y el otro indica su ruta; no son idénticos palabra por palabra.

## Preparar

Necesitas Windows con PowerShell, Git, Python 3, VS Code, Claude Web y Claude Code CLI.

Si nunca clonaste el repositorio:

~~~powershell
New-Item -ItemType Directory -Force -Path C:\Evolium | Out-Null
cd C:\Evolium
git clone https://github.com/Evolium-IOS/evolium-uees-fiinbro-webinar-oct26.git
~~~

Si ya lo tienes y no hay cambios locales pendientes:

~~~powershell
cd C:\Evolium\evolium-uees-fiinbro-webinar-oct26
git pull --ff-only
~~~

## Copia de práctica

Solo la primera vez:

~~~powershell
cd C:\Evolium\evolium-uees-fiinbro-webinar-oct26\experiments\01-ai-engineering-harness
.\scripts\prepare-demo.ps1
~~~

**Si ya existe C:\Evolium\webinar-experiment-01-live**, debes actualizar la plantilla después del cambio de dependencias:

~~~powershell
cd C:\Evolium\evolium-uees-fiinbro-webinar-oct26\experiments\01-ai-engineering-harness
.\scripts\reset-demo.ps1 -ActualizarPlantilla
~~~

**Precaución:** el segundo comando descarta todos los cambios locales del repositorio **temporal** (incluidos archivos no versionados) y crea un nuevo commit local de línea base. No hace push ni cambia el repositorio principal.

La estructura de la práctica debe contener:

~~~text
AGENTS.md
CLAUDE.md
NEXT_TASK.md
config/customer_policy.json
docs/CONTRATO_IDENTIFICADOR_CLIENTE.md
src/customer_policy.py
src/records.py
tests/test_records.py
~~~

## Comprobar la línea base

~~~powershell
cd C:\Evolium\webinar-experiment-01-live
Test-Path .\config\customer_policy.json
git status --short
python -m unittest discover -s tests -v
~~~

**Esperado:** True, Git limpio, **14 tests ejecutados: 9 PASS y 5 FAIL intencionales**. Si sigues viendo 11 tests, falta actualizar la plantilla con -ActualizarPlantilla.

No arregles el código manualmente antes de la prueba.

## Condición A: Claude Web

1. Abre [Claude Web](https://claude.ai/) en una conversación **nueva**, sin proyecto ni fuentes conectadas.
2. Abre **[prompts/claude-web.md](prompts/claude-web.md)**.
3. Copia **todo** el prompt, incluido el código Python con su import de dependencia, y envíalo.
4. No adjuntes el módulo ni el archivo JSON ni los tests. Si pide archivos, **registra esa solicitud sin proporcionarlos**.
5. Guarda la respuesta completa y su resumen de Estado, Evidencia y Pendientes.

Observa si distingue una prueba en su entorno ficticio/aislado de la ejecución **del proyecto real**. Un asistente cuidadoso puede declarar el resultado **incompleto** por falta de dependencias.

## Condición B: Claude Code

En PowerShell:

~~~powershell
cd C:\Evolium\webinar-experiment-01-live
code .
~~~

En la terminal integrada:

~~~powershell
Get-Location
git rev-parse --show-toplevel
git --no-pager diff -- src/records.py tests/test_records.py
claude
~~~

Abre **[prompts/claude-code.md](prompts/claude-code.md)** y envía exactamente su contenido a una **sesión nueva** de Claude Code. No adjuntes ni pegues manualmente los documentos o la política.

Observa si Claude Code lee:
- AGENTS.md, CLAUDE.md y NEXT_TASK.md;
- src/customer_policy.py y config/customer_policy.json;
- docs/CONTRATO_IDENTIFICADOR_CLIENTE.md;
- los tests existentes.

Autoriza lectura, cambios y pruebas **solo en la copia de práctica**. No permitas commits ni pushes.

## Verificación independiente

Sal de Claude Code con /exit y ejecuta:

~~~powershell
cd C:\Evolium\webinar-experiment-01-live
python -m unittest discover -s tests -v
git diff --check
git --no-pager diff -- src/records.py tests/test_records.py
git status --short
git log -1 --oneline
~~~

**Objetivo:** todas las pruebas PASS. Comprueba además que el agente no haya sustituido el archivo de configuración por constantes inventadas. La prueba de cambio dinámico de política detecta soluciones que ignoran la configuración real.

La prueba de política ausente exige un error explícito (FileNotFoundError), no un valor predeterminado.

## Interpretación

Registra los resultados en [BITACORA.md](BITACORA.md). Compara qué archivos podía inspeccionar cada modalidad, qué supuestos hizo, qué pudo ejecutar y qué dejó pendiente.

**Conclusión válida:** sin los archivos requeridos, una solución puede ser plausible pero no puede verificarse como compatible con el proyecto empresarial. Con acceso al repositorio, el agente puede comprobar esa compatibilidad. Esto no garantiza que lo haga correctamente ni significa que Claude Web no sepa programar.

## Restaurar para presentar de nuevo

**Descarta los cambios hechos en la copia temporal:**

~~~powershell
cd C:\Evolium\evolium-uees-fiinbro-webinar-oct26\experiments\01-ai-engineering-harness
.\scripts\reset-demo.ps1
~~~

La línea base vuelve a **9 PASS y 5 FAIL intencionales**.

[Prompt Web](prompts/claude-web.md) | [Prompt Code](prompts/claude-code.md) | [Bitácora](BITACORA.md) | [Experimento 02](../02-bank-document-to-orion/README.md)
