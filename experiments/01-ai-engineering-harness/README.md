# Experimento 01: la IA dentro de un entorno de ingeniería

**Sigue estos pasos para reproducir el experimento.** Trabajaremos con la misma tarea, el mismo mensaje y el mismo contenido técnico inicial en Claude Web y Claude Code.

## 1. Pregunta de investigación

**¿Qué aporta un entorno de ingeniería cuando una IA dispone de la misma tarea y documentación, pero cambia su capacidad para trabajar directamente con archivos, pruebas y Git?**

## 2. Hipótesis

**La integración de la IA con el repositorio, la terminal y las pruebas facilita dejar evidencia directa y verificable de los cambios.**

No buscamos demostrar que Claude Web sea incapaz de solucionar un problema ni que Claude Code use menos tokens. La comparación busca observar **cómo se pasa de una propuesta de código a un cambio aplicado y comprobado**.

## 3. Qué se mantiene igual y qué cambia

| Condición | Claude Web | Claude Code |
| --- | --- | --- |
| Tarea y mensaje | Idénticos | Idénticos |
| Información inicial | Cinco archivos adjuntos en un documento | Los mismos cinco archivos del repositorio |
| Modelo | Misma familia y versión, si está disponible | Registrar versión utilizada |
| Acceso al repositorio local | No | Sí |
| Modificación de archivos locales | Propuesta o parche | Edición directa |
| Ejecución de pruebas y Git locales | No directamente | Sí, mediante terminal |

Usaremos solamente dos archivos de la carpeta prompts:

- [contexto-web.md](prompts/contexto-web.md): el contenido de los cinco archivos que ambos necesitan conocer.
- [mensaje-unico.md](prompts/mensaje-unico.md): el mensaje exacto que se enviará a ambos.

Esta es una **demostración controlada en información**, no un estudio estadístico. El mecanismo de acceso a esa información sí difiere, y es parte de lo que queremos observar.

## 4. Preparación

Necesitas PowerShell, Python 3, Git, VS Code, [Claude Web](https://claude.ai/) y Claude Code instalado en la terminal.

Si todavía no tienes el repositorio:

~~~powershell
New-Item -ItemType Directory -Force -Path C:\Evolium | Out-Null
cd C:\Evolium
git clone https://github.com/Evolium-IOS/evolium-uees-fiinbro-webinar-oct26.git
cd .\evolium-uees-fiinbro-webinar-oct26\experiments\01-ai-engineering-harness
~~~

Si ya lo tienes y no hay modificaciones locales pendientes:

~~~powershell
cd C:\Evolium\evolium-uees-fiinbro-webinar-oct26
git pull --ff-only
cd .\experiments\01-ai-engineering-harness
~~~

## 5. Crear el repositorio temporal

Desde la carpeta 01-ai-engineering-harness:

~~~powershell
.\scripts\prepare-demo.ps1
~~~

El script crea **C:\Evolium\webinar-experiment-01-live** con estos cinco archivos:

~~~text
NEXT_TASK.md
AGENTS.md
CLAUDE.md
src/records.py
tests/test_records.py
~~~

Es un repositorio Git local **separado** del repositorio que descargaste de GitHub.

Si la carpeta ya existe, el script se detiene para no sobrescribirla. Si es una práctica anterior, usa el paso 11 para restaurarla.

## 6. Comprobar la línea base

~~~powershell
cd C:\Evolium\webinar-experiment-01-live
git status --short
git tag
python -m unittest discover -s tests -v
~~~

Resultado esperado: tag **demo-baseline**, código inicial sin modificaciones y **8 pruebas: 7 correctas y 1 fallo intencional**. La prueba que falla se llama test_excludes_missing_customer_id.

**No arregles la función todavía.**

## 7. Condición A: Claude Web

1. Abre [Claude Web](https://claude.ai/) en el navegador.
2. Inicia una conversación nueva, sin proyecto conectado ni herramientas locales adicionales.
3. Selecciona la misma versión de modelo que usas en Claude Code, si está disponible.
4. Adjunta [prompts/contexto-web.md](prompts/contexto-web.md). Este documento contiene los mismos cinco archivos iniciales.
5. Abre [prompts/mensaje-unico.md](prompts/mensaje-unico.md), copia **solo el mensaje del bloque de texto** y envíalo.
6. Guarda la respuesta. **No copies el parche al repositorio** ni modifiques la línea base.

Observa qué solución propone y qué puede verificar realmente. Tener pruebas escritas en la respuesta no significa haberlas ejecutado.

## 8. Condición B: Claude Code en VS Code

~~~powershell
cd C:\Evolium\webinar-experiment-01-live
code .
~~~

En VS Code abre **Terminal > New Terminal** y confirma la ubicación:

~~~powershell
Get-Location
git rev-parse --show-toplevel
git status --short
~~~

Los comandos de ubicación deben apuntar a C:\Evolium\webinar-experiment-01-live. Si no es así, **corrige la carpeta antes de continuar**.

Abre Claude Code en la misma terminal:

~~~powershell
claude
~~~

Pega **el mismo mensaje exacto** de [prompts/mensaje-unico.md](prompts/mensaje-unico.md). Esta vez no adjuntes contexto manualmente: el agente debe consultar los archivos que ya están en el repositorio.

Autoriza únicamente inspección de archivos, edición de la copia de práctica, pruebas y comandos Git de consulta. **No autorices commits ni pushes.**

Fíjate si consultó los documentos y si la terminal mostró pruebas reales, no solo una afirmación del asistente.

## 9. Verificación independiente

Cuando termine Claude Code, sal con /exit. En la terminal normal ejecuta:

~~~powershell
cd C:\Evolium\webinar-experiment-01-live
python -m unittest discover -s tests -v
git diff --check
git diff -- src/records.py tests/test_records.py
git status --short
~~~

Comprueba:
- Que customer_id existe, es string y no queda vacío tras quitar espacios.
- Que se conserva la firma pública, el orden y la independencia de los registros de entrada.
- Que todas las pruebas pasan y el diff refleja exclusivamente la tarea.
- Que no se realizaron commits.

En el ensayo previo, Claude Code pasó 10 pruebas porque añadió dos. Otro ensayo puede agregar más o menos; **no fijamos de antemano el número final**.

## 10. Comparar y formular una conclusión

Completa la [bitácora de resultados](BITACORA.md).

Separa dos observaciones:

1. **Solución funcional:** ¿el parche del cliente web sería correcto? Para comprobarlo deberías aplicarlo a **otra copia idéntica** de la línea base y ejecutar las mismas pruebas. No afirmes que pasó o falló si no lo hiciste.
2. **Proceso de ingeniería:** ¿qué modalidad leyó los archivos, aplicó el cambio, ejecutó las pruebas y mostró Git diff en el proyecto local?

**Conclusión a evaluar:** la IA puede proponer cambios en ambas condiciones; la ingeniería establece criterios de aceptación y ofrece herramientas para comprobar y auditar lo que se aplicó.

## 11. Restaurar el experimento

**Advertencia:** el script descarta cambios y borra archivos no versionados **dentro de C:\Evolium\webinar-experiment-01-live**. Úsalo solo cuando ya no necesites los resultados de ese ensayo.

~~~powershell
cd C:\Evolium\evolium-uees-fiinbro-webinar-oct26\experiments\01-ai-engineering-harness
.\scripts\reset-demo.ps1
~~~

Verifica:

~~~powershell
cd C:\Evolium\webinar-experiment-01-live
git status --short
git log -1 --oneline
~~~

Debes ver el commit demo: baseline y no tener cambios pendientes. Al volver a ejecutar las pruebas, aparecerá el fallo intencional.

[Mensaje único](prompts/mensaje-unico.md) | [Contexto para Claude Web](prompts/contexto-web.md) | [Bitácora](BITACORA.md) | [Experimento 02](../02-bank-document-to-orion/README.md)
