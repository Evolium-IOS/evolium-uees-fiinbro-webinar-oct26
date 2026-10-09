# Experimento 01: la IA dentro de un entorno de ingeniería

Esta guía permite **reproducir la comparación** usando el mismo problema, la misma información inicial y el mismo mensaje en dos formas de trabajo: Claude Web y Claude Code desde VS Code.

## 1. Pregunta de investigación

**¿Qué aporta un entorno de ingeniería cuando una IA recibe la misma tarea y dispone de la misma información, pero cambia su capacidad para inspeccionar, modificar y verificar el proyecto?**

No estamos evaluando qué asistente es "más inteligente". Evaluamos la integración del razonamiento con un proceso de ingeniería verificable.

## 2. Hipótesis

**Con los mismos requisitos y el mismo código inicial, la integración de una IA con archivos, terminal, pruebas y Git facilita producir evidencia directamente verificable de los cambios.**

No se supone que el cliente web no pueda resolver el problema. Puede proponer un parche correcto. Lo que se investiga es la diferencia entre **proponer** e **implementar y comprobar** un cambio dentro de un sistema real.

## 3. Control de variables

| Variable | Claude Web en navegador | Claude Code en terminal de VS Code |
| --- | --- | --- |
| Tarea y criterios | Los mismos | Los mismos |
| Prompt | [Mensaje único](prompts/mensaje-unico.md) | El mismo mensaje |
| Documentos y código inicial | [Contexto adjunto](prompts/contexto-web.md) con 5 archivos | Los mismos 5 archivos en el repositorio |
| Modelo | Seleccionar la misma familia y versión, si está disponible | Registrar la versión real |
| Cambios en archivos locales | No, entrega propuesta o parche | Sí, en la copia de práctica |
| Pruebas locales y Git | No directamente, salvo herramientas que cambien la condición | Sí, mediante terminal |

**Variable que queremos observar:** integración con el entorno local, acceso operativo a los archivos y posibilidad de comprobar el resultado.

**Importante:** los documentos son equivalentes en contenido, pero no en mecanismo de acceso. En Claude Web los adjuntamos manualmente; Claude Code los descubre y lee desde el repositorio. Esa diferencia es parte del entorno que estamos estudiando.

Una sola ejecución sirve como **demostración**, no como prueba causal o estadística. Si los modelos son distintos, registra esa diferencia como una limitación adicional.

## 4. Preparación en Windows

Necesitas Git, Python 3, PowerShell, VS Code, acceso a [Claude Web](https://claude.ai/) y Claude Code disponible desde la terminal. Codex es un respaldo opcional.

Clona el material si todavía no lo tienes:

~~~powershell
New-Item -ItemType Directory -Force -Path C:\Evolium | Out-Null
cd C:\Evolium
git clone https://github.com/Evolium-IOS/evolium-uees-fiinbro-webinar-oct26.git
cd .\evolium-uees-fiinbro-webinar-oct26\experiments\01-ai-engineering-harness
~~~

Si ya tienes el repositorio:

~~~powershell
cd C:\Evolium\evolium-uees-fiinbro-webinar-oct26
git pull --ff-only
cd .\experiments\01-ai-engineering-harness
~~~

No ejecutes clone sobre una carpeta ya existente ni uses pull si tienes cambios locales sin revisar.

## 5. Crear el proyecto de práctica

Desde la carpeta del Experimento 01:

~~~powershell
.\scripts\prepare-demo.ps1
~~~

Se crea un repositorio Git **independiente** en C:\Evolium\webinar-experiment-01-live con los archivos:

~~~text
AGENTS.md
CLAUDE.md
NEXT_TASK.md
src/records.py
tests/test_records.py
~~~

La plantilla contiene un error intencional. Si la carpeta ya existe, el script se detiene para no sobrescribir trabajo. Si es una práctica previa, consulta el paso 12 para restablecerla.

## 6. Verificar la línea base

~~~powershell
cd C:\Evolium\webinar-experiment-01-live
git status --short
git tag
python -m unittest discover -s tests -v
~~~

Resultado esperado: tag demo-baseline, directorio limpio al inicio y **8 pruebas, de las cuales pasan 7 y falla 1**. El fallo intencional se llama test_excludes_missing_customer_id.

No arregles el código todavía. Ambas modalidades deben empezar con la misma versión.

## 7. Preparar exactamente el mismo contexto para ambos

Abre [prompts/contexto-web.md](prompts/contexto-web.md). Este archivo reúne **el contenido completo de**:

- NEXT_TASK.md: requisitos y criterios de aceptación.
- AGENTS.md: reglas generales de ingeniería.
- CLAUDE.md: instrucciones de proyecto.
- src/records.py: código inicial.
- tests/test_records.py: pruebas iniciales.

Claude Code dispone de esos archivos dentro del repositorio temporal. Claude Web recibirá una copia de sus contenidos en un solo documento adjunto.

Comprueba que no hayas cambiado los archivos de la plantilla ni la línea base. **No uses el antiguo prompt que pegaba solo el código:** allí el cliente web no recibía los criterios que sí conocía el agente.

## 8. Ejecución A: Claude Web

1. Abre [Claude Web](https://claude.ai/).
2. Selecciona, si está disponible, la misma familia y versión de modelo usada por Claude Code.
3. Inicia una conversación nueva sin instrucciones o proyectos personalizados.
4. Adjunta **[prompts/contexto-web.md](prompts/contexto-web.md)** como archivo. No adjuntes otros.
5. Copia exactamente el texto del bloque en [prompts/mensaje-unico.md](prompts/mensaje-unico.md) y envíalo.
6. Conserva su respuesta. No copies su propuesta al proyecto de práctica ni alteres la línea base.
7. Registra en [BITACORA.md](BITACORA.md) qué archivos leyó, qué solución propuso, qué pruebas sugirió y qué pudo verificar realmente.

Observa si Claude Web reconoce que **no tiene acceso a la terminal local**. Una respuesta que dice "las pruebas pasarían" no equivale a haberlas ejecutado.

## 9. Ejecución B: Claude Code en VS Code

Desde PowerShell:

~~~powershell
cd C:\Evolium\webinar-experiment-01-live
code .
~~~

Abre la terminal integrada en VS Code y verifica que estás en el repositorio temporal:

~~~powershell
Get-Location
git rev-parse --show-toplevel
git status --short
~~~

Ambas rutas deben ser C:\Evolium\webinar-experiment-01-live. Si hay cambios en src/ o tests/ antes de empezar, detente y restaura la línea base siguiendo el paso 12.

Abre Claude Code **en esta misma terminal**:

~~~powershell
claude
~~~

Copia **el mismo mensaje, sin modificar una palabra**, desde [prompts/mensaje-unico.md](prompts/mensaje-unico.md). No le adjuntes manualmente el contexto: tiene que buscarlo en el repositorio.

Autoriza lecturas, edición de los archivos de práctica, ejecución de pruebas y comandos Git de inspección. No autorices commits ni pushes.

Observa en el historial de ejecución si Claude Code abrió NEXT_TASK.md, AGENTS.md, CLAUDE.md y los archivos de código, y si ejecutó las pruebas.

## 10. Verificación independiente

Cuando termine, sal del agente con /exit y ejecuta en la terminal normal:

~~~powershell
cd C:\Evolium\webinar-experiment-01-live
python -m unittest discover -s tests -v
git diff --check
git diff -- src/records.py tests/test_records.py
git status --short
~~~

Si se implementó correctamente, todas las pruebas deben pasar, incluida la que fallaba al inicio. En un ensayo anterior se obtuvieron 10 de 10 pruebas; el número final puede cambiar si el agente agrega más.

Verifica específicamente:
- El identificador existe, es string y no queda vacío tras quitar espacios.
- Se mantiene la firma pública de la función.
- El orden y los datos de entrada no se alteran.
- El diff no incluye modificaciones ajenas a la tarea.
- No hay commit.

En Windows pueden aparecer avisos LF/CRLF y carpetas __pycache__ creadas por Python; no significan por sí mismos un fallo.

## 11. Comparación e interpretación

Usa [BITACORA.md](BITACORA.md).

**Separa dos preguntas distintas:**

1. **Calidad de la solución:** ¿la propuesta de Claude Web cumpliría las mismas pruebas? Sin aplicar y ejecutar el parche no podemos afirmar que pasó ni que falló. Para una comparación formal de calidad, habría que aplicar cada solución sobre copias idénticas del baseline y correr la misma batería de pruebas con un evaluador independiente.
2. **Calidad de la evidencia y del flujo:** ¿qué modalidad pudo modificar, comprobar y auditar el repositorio directamente, con qué intervención humana y qué evidencia mostró?

La segunda pregunta es la que este webinar demuestra en vivo.

**Interpretación esperada, sujeta a lo observado:** los modelos pueden generar código en ambos entornos; la ingeniería define reglas, límites, pruebas, cambios controlados y trazabilidad para convertir propuestas en trabajo comprobable.

No afirmes que esto demuestra mejor precisión, mayor velocidad, menos tokens o una ley universal. Eso necesitaría controlar modelos, repeticiones y mediciones adicionales.

## 12. Restaurar la práctica

**Advertencia:** el reset elimina cambios y archivos no versionados **dentro de C:\Evolium\webinar-experiment-01-live**. No guardes allí trabajo que quieras conservar.

~~~powershell
cd C:\Evolium\evolium-uees-fiinbro-webinar-oct26\experiments\01-ai-engineering-harness
.\scripts\reset-demo.ps1
~~~

Luego:

~~~powershell
cd C:\Evolium\webinar-experiment-01-live
git status --short
git log -1 --oneline
python -m unittest discover -s tests -v
~~~

La salida debe volver al commit demo: baseline, con 7 pruebas aprobadas y 1 fallo intencional.

## 13. Conclusión del ejercicio

Responde con evidencia:

**¿Qué parte del resultado la produjo el razonamiento de la IA y qué parte hizo posible el entorno de ingeniería?**

No es una competencia entre productos. Es una demostración de que una buena propuesta de código y una modificación probada, reproducible y revisable no son lo mismo.

[Mensaje único](prompts/mensaje-unico.md) | [Contexto para Claude Web](prompts/contexto-web.md) | [Bitácora](BITACORA.md) | [Guion del presentador](STORY.md) | [Experimento 02](../02-bank-document-to-orion/README.md)
