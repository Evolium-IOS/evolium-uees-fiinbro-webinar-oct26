# Experimento 01: de pegar código a trabajar dentro de un proyecto

**Objetivo:** comparar una corrección sugerida a partir de un fragmento de código con una corrección realizada dentro de un repositorio que contiene reglas de negocio y pruebas.

## 1. Pregunta de investigación

**¿Qué cambia al pedir a una IA que corrija código aislado, frente a permitirle trabajar en un proyecto donde los requisitos empresariales ya están documentados?**

## 2. Hipótesis

**Un agente que consulta las normas del repositorio puede detectar criterios empresariales que no aparecen en el fragmento de código y comprobarlos mediante pruebas. Un cliente web sin esos documentos no puede conocer de manera fiable esas reglas específicas, salvo que las pregunte, las reciba o las adivine.**

Este experimento observa el **efecto del contexto de trabajo**, no la superioridad general de un modelo sobre otro.

## 3. Condiciones

| Condición | Claude Web | Claude Code |
| --- | --- | --- |
| Problema | Corregir el filtro de customer_id | El mismo |
| Entrada de código | Función pegada en el mensaje | Ruta del archivo src/records.py |
| Requisitos internos | No se entregan | Disponibles en docs/ y archivos de instrucciones |
| Pruebas existentes | No se entregan | Disponibles en tests/ |
| Resultado | Propuesta y posible prueba aislada | Modificación y verificación sobre el Git local |

Los prompts son **funcionalmente equivalentes, pero no idénticos en palabras**. La diferencia entre la información disponible es deliberada.

## 4. Preparar el repositorio

Requisitos: PowerShell, Git, Python 3, VS Code, [Claude Web](https://claude.ai/) y Claude Code desde la terminal.

Si es la primera vez:

~~~powershell
New-Item -ItemType Directory -Force -Path C:\Evolium | Out-Null
cd C:\Evolium
git clone https://github.com/Evolium-IOS/evolium-uees-fiinbro-webinar-oct26.git
~~~

Si ya está clonado:

~~~powershell
cd C:\Evolium\evolium-uees-fiinbro-webinar-oct26
git pull --ff-only
~~~

Si Git indica que hay cambios locales que se sobrescribirían, revisa esos cambios antes de actualizar; no borres el proyecto para resolverlo.

## 5. Preparar el repositorio de práctica

**Primera vez**, sin carpeta de práctica anterior:

~~~powershell
cd C:\Evolium\evolium-uees-fiinbro-webinar-oct26\experiments\01-ai-engineering-harness
.\scripts\prepare-demo.ps1
~~~

**Si ya lo habías creado con una versión anterior**, actualiza su línea base:

~~~powershell
cd C:\Evolium\evolium-uees-fiinbro-webinar-oct26\experiments\01-ai-engineering-harness
.\scripts\reset-demo.ps1 -ActualizarPlantilla
~~~

**Advertencia:** la segunda instrucción descarta los cambios del ejercicio en C:\Evolium\webinar-experiment-01-live, elimina sus archivos no versionados y crea un nuevo commit de preparación con el contenido de la plantilla. No hace push ni modifica el repositorio principal.

El proyecto temporal incluye:

~~~text
AGENTS.md
CLAUDE.md
NEXT_TASK.md
docs/
  CONTRATO_IDENTIFICADOR_CLIENTE.md
src/
  records.py
tests/
  test_records.py
~~~

Los documentos de docs/ contienen criterios de negocio específicos de una empresa ficticia. **No los adjuntaremos a Claude Web.**

## 6. Comprobar la línea base

~~~powershell
cd C:\Evolium\webinar-experiment-01-live
git status --short
git log -1 --oneline
python -m unittest discover -s tests -v
~~~

**Resultado esperado con la nueva plantilla:** 11 pruebas, **8 PASS y 3 FAIL intencionales**. Las fallas muestran la ausencia de validación del identificador, formatos de empresa no aceptados y un identificador interno reservado.

Si observas todavía 8 pruebas con 7 PASS y 1 FAIL, tu copia de práctica usa la plantilla antigua: ejecuta el paso 5 con -ActualizarPlantilla.

No arregles el código todavía. No presentes el detalle de la política al cliente web.

## 7. Condición A: Claude Web, código pegado

1. Inicia una conversación **nueva** en [Claude Web](https://claude.ai/).
2. Selecciona, si está disponible, la misma familia y versión de modelo que usarás en Claude Code.
3. No selecciones proyectos con contexto, no adjuntes archivos ni conectes el repositorio.
4. Abre [prompts/claude-web.md](prompts/claude-web.md); copia **todo el contenido**, incluida la función Python.
5. Envíalo y conserva la respuesta.
6. Si solicita aclaraciones, regístralas; **no reveles el contrato de negocio**.
7. No transfieras aún la propuesta a la carpeta de práctica.

Observa si Claude Web identifica correctamente que desconoce el formato de identificadores permitido. Si propone una solución, no presupongas que cumple las reglas internas que nunca recibió.

## 8. Condición B: Claude Code en el repositorio

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

El directorio debe ser C:\Evolium\webinar-experiment-01-live. El diff inicial debe estar vacío.

Inicia **una sesión nueva**:

~~~powershell
claude
~~~

Abre [prompts/claude-code.md](prompts/claude-code.md), copia **todo el contenido** y envíalo. No pegues manualmente las reglas de negocio.

Observa si el agente consulta:

- AGENTS.md y CLAUDE.md;
- NEXT_TASK.md;
- docs/CONTRATO_IDENTIFICADOR_CLIENTE.md;
- src/records.py y tests/test_records.py.

Autoriza lectura, cambios en los archivos del ejercicio y pruebas. **No permitas commits ni pushes**.

## 9. Verificar independientemente

Cuando Claude Code termine, sal con /exit y ejecuta:

~~~powershell
cd C:\Evolium\webinar-experiment-01-live
python -m unittest discover -s tests -v
git diff --check
git --no-pager diff -- src/records.py tests/test_records.py
git status --short
git log -1 --oneline
~~~

El resultado correcto es **todas las pruebas PASS**, con cambios acotados a la tarea. El número final puede ser mayor de 11 si el agente añade pruebas.

Solo ahora abre el contrato de negocio y revisa si se cumplieron sus criterios. Si Claude Code no lo consultó o falló, eso también es un resultado válido que debes registrar.

## 10. Conclusión

Completa la [bitácora](BITACORA.md). Compara **suposiciones**, **normas consultadas**, **archivos realmente modificados** y **pruebas realmente ejecutadas**.

**Conclusión posible:** los estándares del proyecto y la verificación automatizada permiten evaluar la compatibilidad de una solución con reglas internas no visibles en un fragmento aislado.

**Límite:** este experimento no demuestra que Claude Web sea incapaz de programar ni que su propuesta rompería el sistema. Para medir esa afirmación, tendríamos que aplicar y evaluar su propuesta en una copia independiente de la misma línea base.

## 11. Restaurar para repetir la presentación

**Advertencia:** este script descarta los cambios locales del ejercicio.

~~~powershell
cd C:\Evolium\evolium-uees-fiinbro-webinar-oct26\experiments\01-ai-engineering-harness
.\scripts\reset-demo.ps1
~~~

El estado vuelve a la plantilla empresarial con **8 PASS y 3 FAIL intencionales**.

[Prompt Claude Web](prompts/claude-web.md) | [Prompt Claude Code](prompts/claude-code.md) | [Bitácora](BITACORA.md) | [Experimento 02](../02-bank-document-to-orion/README.md)
