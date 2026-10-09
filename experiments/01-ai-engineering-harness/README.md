# Experimento 01: de pegar código a trabajar dentro de un proyecto

**Objetivo:** recrear dos formas comunes de usar una IA para corregir una función y analizar el valor del contexto de ingeniería.

## 1. Pregunta de investigación

**¿Qué cambia cuando una IA recibe un fragmento de código pegado en un chat, frente a cuando trabaja directamente en el repositorio donde existen reglas, requisitos y pruebas?**

## 2. Hipótesis

**Cuando el agente tiene acceso al proyecto, puede encontrar los criterios existentes, modificar la implementación real y comprobar la compatibilidad con pruebas y Git. Con solo un fragmento de código, el asistente web puede producir una solución plausible, pero tendrá que inferir o solicitar las reglas que no recibió.**

El resultado no está garantizado. Un cliente web también puede detectar la falta de contexto y pedir aclaraciones, lo cual sería un comportamiento correcto.

## 3. Dos condiciones de trabajo

| Aspecto | Claude Web | Claude Code en VS Code |
| --- | --- | --- |
| Problema solicitado | Corregir el filtro de customer_id | El mismo |
| Código disponible | Fragmento de la función pegado en el chat | Código real en src/records.py |
| Información adicional | Ningún archivo ni instrucciones adjuntas | Repositorio con NEXT_TASK.md, AGENTS.md, CLAUDE.md y pruebas |
| Acciones posibles | Proponer código y pruebas; quizá usar herramientas aisladas | Editar archivos reales, ejecutar pruebas locales y consultar Git |
| Verificación | Depende del entorno del cliente; registrar qué hizo | Se confirma luego con comandos independientes |

**Control metodológico:** la *tarea funcional* es equivalente, pero los mensajes no son textualmente idénticos y el contexto accesible tampoco. Esa diferencia reproduce dos flujos de trabajo habituales. No atribuyas cualquier diferencia a la capacidad intrínseca del modelo.

## 4. Preparar el repositorio

Requisitos: PowerShell, Git, Python 3, VS Code, [Claude Web](https://claude.ai/) y Claude Code CLI.

Si no has clonado el repositorio principal:

~~~powershell
New-Item -ItemType Directory -Force -Path C:\Evolium | Out-Null
cd C:\Evolium
git clone https://github.com/Evolium-IOS/evolium-uees-fiinbro-webinar-oct26.git
~~~

Si ya está clonado y no hay cambios locales pendientes:

~~~powershell
cd C:\Evolium\evolium-uees-fiinbro-webinar-oct26
git pull --ff-only
~~~

## 5. Crear o restaurar la copia de práctica

Primera vez:

~~~powershell
cd C:\Evolium\evolium-uees-fiinbro-webinar-oct26\experiments\01-ai-engineering-harness
.\scripts\prepare-demo.ps1
~~~

Si ya existe la carpeta C:\Evolium\webinar-experiment-01-live:

~~~powershell
cd C:\Evolium\evolium-uees-fiinbro-webinar-oct26\experiments\01-ai-engineering-harness
.\scripts\reset-demo.ps1
~~~

**Precaución:** el reset descarta todos los cambios y archivos no versionados dentro del repositorio temporal. No afecta al repositorio principal.

## 6. Comprobar la línea base

~~~powershell
cd C:\Evolium\webinar-experiment-01-live
git status --short
git log -1 --oneline
python -m unittest discover -s tests -v
~~~

Resultado esperado: commit **demo: baseline**, con **8 pruebas: 7 pasan y 1 falla intencionalmente** (test_excludes_missing_customer_id). No arregles el código todavía.

## 7. Condición A: Claude Web con código pegado

1. Abre [Claude Web](https://claude.ai/) en una conversación nueva sin proyecto, adjuntos ni repositorios conectados.
2. Elige la misma familia/versión de modelo que usarás en Claude Code si está disponible.
3. Abre **[prompts/claude-web.md](prompts/claude-web.md)** y copia **todo el archivo**, incluido el bloque de código Python.
4. Envía el prompt y conserva la respuesta.
5. Si el asistente pide más requisitos, **no los proporciones** durante esta ejecución. Registra la pregunta; no es un fallo.
6. No copies ninguna solución a la carpeta de práctica.

Observa si supone qué significa un customer_id válido y si distingue código propuesto de código efectivamente probado.

## 8. Condición B: Claude Code en el proyecto real de práctica

Desde PowerShell:

~~~powershell
cd C:\Evolium\webinar-experiment-01-live
code .
~~~

En la terminal integrada de VS Code:

~~~powershell
Get-Location
git rev-parse --show-toplevel
git --no-pager diff -- src/records.py tests/test_records.py
~~~

Verifica que el proyecto activo sea **C:\Evolium\webinar-experiment-01-live** y no exista un cambio previo en src/records.py ni tests/test_records.py. En esta carpeta los archivos de reglas y pruebas ya están disponibles.

Inicia una **sesión nueva** del agente desde esa misma terminal:

~~~powershell
claude
~~~

Abre **[prompts/claude-code.md](prompts/claude-code.md)** y copia **todo el archivo**. Es la misma petición, pero en lugar de pegar el código indica al agente que lea src/records.py.

No añadas criterios al prompt. Observa si Claude Code descubre las instrucciones persistentes, NEXT_TASK.md y los tests, y si revisa su trabajo con Git.

Autoriza lectura, edición de los archivos de esta práctica y pruebas. **No autorices commit ni push.**

## 9. Verificación independiente

Cuando termine el agente, sal con /exit y ejecuta:

~~~powershell
cd C:\Evolium\webinar-experiment-01-live
python -m unittest discover -s tests -v
git diff --check
git --no-pager diff -- src/records.py tests/test_records.py
git status --short
git log -1 --oneline
~~~

Compara el resultado con los criterios existentes del proyecto:
- customer_id debe existir, ser string y no quedar vacío después de strip.
- La función mantiene firma pública, orden y comportamiento de los registros válidos.
- No altera los diccionarios originales.
- El diff es acotado y las pruebas pasan.
- No se ha hecho commit.

Los avisos LF/CRLF de Windows no son por sí mismos errores. Las carpetas __pycache__ son artefactos Python no versionados.

## 10. Interpretar el resultado

Registra en la [bitácora](BITACORA.md):
1. ¿Qué criterio decidió o preguntó Claude Web cuando no tenía requisitos internos?
2. ¿Qué reglas consultó realmente Claude Code y cómo afectaron a su solución?
3. ¿Qué pruebas se ejecutaron y en qué entorno?
4. ¿Qué cambios y evidencias se pueden auditar?
5. ¿Qué no demuestra una sola ejecución?

**No se puede concluir** que una propuesta de Claude Web hubiera roto el proyecto sin aplicarla y probarla sobre una copia comparable. La demostración explora la importancia de la documentación, las pruebas y la integración con sistemas existentes; no demuestra superioridad universal.

## 11. Restaurar para una nueva demostración

**Advertencia:** elimina modificaciones y archivos no versionados de la carpeta temporal de práctica.

~~~powershell
cd C:\Evolium\evolium-uees-fiinbro-webinar-oct26\experiments\01-ai-engineering-harness
.\scripts\reset-demo.ps1
~~~

El proyecto quedará en el baseline de 7 PASS y 1 FAIL intencional.

[Prompt Claude Web](prompts/claude-web.md) | [Prompt Claude Code](prompts/claude-code.md) | [Bitácora](BITACORA.md) | [Experimento 02](../02-bank-document-to-orion/README.md)
