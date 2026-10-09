# Experimento 01: IA dentro del entorno de ingeniería

Esta es una guía práctica para estudiantes. Sigue los pasos en orden y registra lo que observas.

## 1. Pregunta de investigación

**¿Qué cambia cuando usamos una IA mediante un cliente conversacional web y cuando la integramos a un entorno de ingeniería con acceso a código, instrucciones, pruebas y control de versiones?**

No buscamos demostrar que Claude Code o Codex son mejores modelos que el cliente web.

Buscamos observar cómo cambia el **proceso de trabajo y verificación** cuando el contexto del proyecto está disponible como archivos y herramientas.

## 2. Hipótesis

**Si un agente puede consultar las reglas del repositorio, modificar el código, ejecutar las pruebas y revisar el diff, entonces será más sencillo comprobar el cumplimiento de los criterios del proyecto y dejar evidencia reproducible que con una respuesta de chat sin acceso al repositorio.**

Esta hipótesis habla del *flujo de trabajo*, no de precisión universal del modelo ni de ahorro garantizado de tokens.

### Qué observaremos

| Observación | Cliente web | Agente en VS Code |
| --- | --- | --- |
| Acceso a las reglas completas del proyecto | Solo las que compartimos en el mensaje | Puede leer `AGENTS.md`, `CLAUDE.md` y `NEXT_TASK.md` |
| Acceso al código y a las pruebas | Solo lo que pegamos | Puede inspeccionar los archivos autorizados |
| Cambios en archivos | Propone código para copiar | Puede editar el repositorio local |
| Evidencia de funcionamiento | Respuesta y pruebas sugeridas | Pruebas ejecutadas y `git diff` |
| Suposiciones detectadas | Registrar lo que asumió | Contrastar contra los criterios del proyecto |

**Límite del experimento:** el cliente web y el agente no reciben la misma cantidad de contexto. Eso es intencional: comparamos un flujo con contexto compartido manualmente contra uno con contexto persistente y herramientas. Una sola ejecución no demuestra una diferencia causal de calidad, velocidad o consumo de tokens.

## 3. Requisitos

En Windows necesitas:

- PowerShell, Git y Python 3.
- Visual Studio Code.
- Acceso a [Claude Web](https://claude.ai/) para el cliente conversacional, sin habilitar acceso al proyecto.
- Claude Code instalado en la terminal de VS Code. Si no lo tienes, puedes usar Codex como alternativa.
- Permiso para crear un repositorio local de práctica en `C:\Evolium`.

Comprobación opcional en PowerShell:

```powershell
git --version
python --version
code --version
claude --version
```

No necesitas una base de datos, servicios externos ni una clave API para ejecutar las pruebas Python. El uso del asistente de IA sí requiere acceso a su servicio.

## 4. Descargar el material

Abre PowerShell y ejecuta:

```powershell
New-Item -ItemType Directory -Force -Path C:\Evolium | Out-Null
cd C:\Evolium
git clone https://github.com/Evolium-IOS/evolium-uees-fiinbro-webinar-oct26.git
cd .\evolium-uees-fiinbro-webinar-oct26\experiments\01-ai-engineering-harness
```

Si ya clonaste el repositorio, **no lo clones nuevamente**. Ve a su carpeta y actualiza el material cuando tu árbol esté limpio:

```powershell
cd C:\Evolium\evolium-uees-fiinbro-webinar-oct26
git pull --ff-only
cd .\experiments\01-ai-engineering-harness
```

## 5. Crear un repositorio de práctica independiente

Desde la carpeta `01-ai-engineering-harness`, ejecuta:

```powershell
.\scripts\prepare-demo.ps1
```

Este script crea un repositorio Git local independiente en:

```text
C:\Evolium\webinar-experiment-01-live
```

La copia contiene:

```text
AGENTS.md
CLAUDE.md
NEXT_TASK.md
src/
  records.py
tests/
  test_records.py
```

El proyecto principal del webinar se conserva separado y no se modifica durante el ejercicio.

**Importante:** si `webinar-experiment-01-live` ya existe, `prepare-demo.ps1` se detendrá para evitar sobrescribirlo. En ese caso continúa con el repositorio existente o revisa el paso 11 para restablecerlo.

## 6. Observar el problema antes de usar IA

En PowerShell:

```powershell
cd C:\Evolium\webinar-experiment-01-live
git tag
git status --short
python -m unittest discover -s tests -v
```

Debes encontrar el tag `demo-baseline` y una línea base de **8 pruebas: 7 pasan y 1 falla intencionalmente**.

La prueba fallida es `test_excludes_missing_customer_id`: un registro con estado `ready` pero sin identificador válido todavía alcanza el resultado.

Que la prueba falle **es correcto en este paso**. No modifiques el código todavía.

### La tarea de ingeniería

La función selecciona registros con `status == "ready"`. Debemos excluir registros cuyo `customer_id` sea inválido, sin romper lo que ya funciona.

## 7. Primera ejecución: cliente conversacional en la web

1. Abre [Claude Web](https://claude.ai/) en el navegador.
2. Inicia una conversación nueva. No agregues el repositorio como proyecto ni adjuntes archivos.
3. Abre [el prompt del cliente web](prompts/direct-client.md).
4. Copia el mensaje de la tarea, desde «Tengo esta función» hasta «Propón el cambio y las pruebas que agregarías».
5. Envíalo y espera la respuesta.
6. **No copies la solución al código todavía.**
7. En [la bitácora](BITACORA.md), registra: definición asumida de identificador válido, cambios propuestos, pruebas sugeridas y cualquier duda abierta.

**Pregunta para analizar:** ¿El asistente decidió por su cuenta qué significa `customer_id` válido? En nuestra ejecución de ensayo, aceptó enteros positivos porque el mensaje no especificaba que los IDs debían ser strings. La respuesta puede variar en otras ejecuciones.

## 8. Segunda ejecución: Claude Code desde la terminal de VS Code

Ahora trabajaremos con las reglas completas del repositorio.

En PowerShell:

```powershell
cd C:\Evolium\webinar-experiment-01-live
code .
```

En VS Code abre **Terminal > New Terminal** y verifica:

```powershell
Get-Location
git rev-parse --show-toplevel
```

Ambos deben apuntar a `C:\Evolium\webinar-experiment-01-live`. Si apuntan al extractor bancario o a otra carpeta, **detente** y corrige la ubicación antes de abrir Claude Code.

Abre `NEXT_TASK.md`, `AGENTS.md` y `CLAUDE.md`. Observa que aquí el criterio es explícito:

- `customer_id` debe existir.
- Debe ser un `string`.
- No debe quedar vacío después de quitar espacios.

Ahora ejecuta en esa misma terminal:

```powershell
claude
```

Pega el mensaje de [prompts/claude-code.md](prompts/claude-code.md):

```text
Implementa NEXT_TASK.md.
Respeta CLAUDE.md y AGENTS.md.
Ejecuta las pruebas.
Revisa el diff.
Si algo falla, detente y explícame exactamente qué falló.
No hagas commit.
```

Autoriza únicamente lectura del repositorio de práctica, edición de los archivos relevantes, ejecución de pruebas y comandos Git de consulta. **No autorices commits ni pushes.**

Si prefieres Codex, usa [su prompt alternativo](prompts/codex.md), pero ejecuta **solo un agente** durante cada ensayo.

## 9. Comprobar el resultado con evidencia

Cuando termine el agente, sal de la sesión con `/exit`. En la terminal normal de PowerShell:

```powershell
cd C:\Evolium\webinar-experiment-01-live
python -m unittest discover -s tests -v
git diff --check
git diff -- src/records.py tests/test_records.py
git status --short
```

Lo esperado, **si el agente implementó correctamente la tarea**, es que todas las pruebas pasen. En el ensayo del webinar, Claude Code agregó dos pruebas y pasaron **10 de 10**. Un estudiante podría obtener una cantidad distinta si implementa pruebas adicionales.

Revisa:
- ¿Se rechazaron IDs ausentes, vacíos y no-string?
- ¿Se conservó el orden?
- ¿No cambió la firma de la función?
- ¿Los registros de entrada permanecen intactos?
- ¿El diff está limitado al alcance solicitado?

Es normal que aparezcan avisos `LF/CRLF` en Windows. Si aparecen carpetas `__pycache__`, son artefactos locales de Python.

## 10. Analizar los resultados como investigador e ingeniero

Completa [BITACORA.md](BITACORA.md) o una copia de sus preguntas.

Distingue **propuesta** de **resultado ejecutado**:
- Una respuesta con código plausible no demuestra que el cambio funcione.
- Una prueba que pasa aporta evidencia sobre el comportamiento cubierto.
- El diff permite ver exactamente qué cambió.
- El repositorio conserva instrucciones y criterios para repetir el procedimiento.

**Conclusión a evaluar:** ¿Las herramientas y el contexto persistente hicieron más verificable el trabajo?

No afirmes haber demostrado menor uso de tokens, una mejora de productividad cuantificada o que un modelo sea siempre superior. Eso requeriría otra metodología y mediciones controladas.

## 11. Restaurar el experimento para volver a ejecutarlo

**Advertencia:** el siguiente script descarta los cambios hechos por el agente y elimina archivos no versionados **dentro del repositorio de práctica**. No guardes allí trabajo que quieras conservar.

Desde la carpeta del Experimento 01 del repositorio principal:

```powershell
cd C:\Evolium\evolium-uees-fiinbro-webinar-oct26\experiments\01-ai-engineering-harness
.\scripts\reset-demo.ps1
```

Luego verifica:

```powershell
cd C:\Evolium\webinar-experiment-01-live
git status --short
git log -1 --oneline
python -m unittest discover -s tests -v
```

El estado debe volver al commit `demo: baseline`, con **7 pruebas correctas y 1 fallo intencional**. El script verifica primero la ruta raíz Git esperada.

## 12. Repetir y compartir

El repositorio público contiene la plantilla y las instrucciones. El repositorio temporal `webinar-experiment-01-live` **no necesita un remoto** ni se sube a GitHub.

Para presentar el experimento, mantén preparadas estas dos ventanas:
- navegador con Claude Web y el prompt;
- VS Code con la terminal ubicada en el repositorio temporal.

[Guion breve del presentador](STORY.md) | [Bitácora de observaciones](BITACORA.md) | [Experimento 02](../02-bank-document-to-orion/README.md)
