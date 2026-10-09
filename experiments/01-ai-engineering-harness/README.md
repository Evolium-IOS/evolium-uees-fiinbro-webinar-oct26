# Experimento 01: la IA y el valor del entorno de ingeniería

**Sigue estos pasos para reproducir el experimento.** Daremos el mismo mensaje corto a Claude Web y Claude Code. No adjuntaremos código, requisitos ni instrucciones de proyecto a ninguno de los dos mensajes.

## 1. Pregunta de investigación

**¿Qué cambia cuando delegamos la misma tarea a una IA sin darle contexto explícito, pero uno de los asistentes trabaja dentro de un proyecto que ya contiene código, estándares y pruebas?**

## 2. Hipótesis

**Un agente con acceso operativo al repositorio existente podrá descubrir las reglas, el código y los criterios de aceptación, utilizar las pruebas y dejar evidencia directa de sus cambios. Un cliente sin ese acceso tendrá que solicitar información, trabajar con suposiciones o limitar su respuesta.**

Esto es una **demostración de la importancia del contexto y la infraestructura de ingeniería**, no una comparación controlada de la precisión intrínseca de dos modelos. El acceso al contexto **no es igual**: la diferencia es deliberada.

## 3. Diseño de la comparación

| Condición | Claude Web | Claude Code en VS Code |
| --- | --- | --- |
| Texto enviado por el usuario | **Exactamente el mismo** | **Exactamente el mismo** |
| Código o documentos adjuntos | Ninguno | Ninguno |
| Acceso al repositorio del ejercicio | No | Sí, al abrir el agente en la carpeta correcta |
| Estándares e instrucciones de proyecto | No disponibles | Puede consultar AGENTS.md, CLAUDE.md y NEXT_TASK.md |
| Código y pruebas existentes | No disponibles | Puede consultar src/records.py y tests/test_records.py |
| Cambios y pruebas del proyecto local | No directamente | Puede editar, ejecutar y verificar con Git |

**Único prompt:** [prompts/mensaje-unico.md](prompts/mensaje-unico.md). El archivo contiene solo el mensaje que se copia y pega en las dos interfaces, sin encabezados ni instrucciones adicionales.

**Observaciones:** ¿pidió aclaraciones?, ¿inventó supuestos?, ¿encontró las reglas?, ¿modificó el código?, ¿ejecutó pruebas?, ¿mostró un diff?, ¿qué comprobó realmente?

## 4. Preparar el equipo

Requisitos: PowerShell, Git, Python 3, VS Code, [Claude Web](https://claude.ai/) y Claude Code CLI disponible.

Si no tienes el repositorio:

~~~powershell
New-Item -ItemType Directory -Force -Path C:\Evolium | Out-Null
cd C:\Evolium
git clone https://github.com/Evolium-IOS/evolium-uees-fiinbro-webinar-oct26.git
~~~

Si ya existe y no tiene modificaciones locales pendientes:

~~~powershell
cd C:\Evolium\evolium-uees-fiinbro-webinar-oct26
git pull --ff-only
~~~

## 5. Preparar la copia de práctica

Si nunca creaste la copia:

~~~powershell
cd C:\Evolium\evolium-uees-fiinbro-webinar-oct26\experiments\01-ai-engineering-harness
.\scripts\prepare-demo.ps1
~~~

Esto crea un Git local independiente en C:\Evolium\webinar-experiment-01-live.

Si ya ensayaste antes, **restaura la copia** (descarta todos los cambios de esa práctica y limpia archivos no versionados de esa carpeta):

~~~powershell
cd C:\Evolium\evolium-uees-fiinbro-webinar-oct26\experiments\01-ai-engineering-harness
.\scripts\reset-demo.ps1
~~~

No ejecutes prepare-demo.ps1 sobre una carpeta ya existente.

## 6. Comprobar la línea base

~~~powershell
cd C:\Evolium\webinar-experiment-01-live
git status --short
git log -1 --oneline
python -m unittest discover -s tests -v
~~~

Lo esperado es el commit **demo: baseline** y 8 pruebas: **7 pasan y 1 falla intencionalmente**. El fallo se llama test_excludes_missing_customer_id.

**No modifiques el código.** La salida de las pruebas puede crear carpetas __pycache__ sin seguimiento; eso no cambia la línea base versionada.

## 7. Condición A: Claude Web sin contexto del proyecto

1. Abre [Claude Web](https://claude.ai/) en una conversación nueva.
2. Usa, si está disponible, la misma versión o familia de modelo seleccionada en Claude Code. Anótala.
3. No selecciones un proyecto con instrucciones, no adjuntes archivos y no conectes GitHub, carpetas ni otras fuentes.
4. Abre [prompts/mensaje-unico.md](prompts/mensaje-unico.md) y copia **todo su contenido**.
5. Pégalo y envíalo **sin agregar ningún detalle**.
6. Guarda la respuesta. Si el asistente pide código o aclaraciones, **no respondas todavía**. Anota su pregunta como resultado del experimento.
7. No transfieras ninguna solución a C:\Evolium\webinar-experiment-01-live.

Una respuesta que pide el código en vez de inventarlo puede ser un comportamiento correcto. **No la califiques como fallo.**

## 8. Condición B: Claude Code dentro del proyecto

Abre **solo** el repositorio temporal en VS Code:

~~~powershell
cd C:\Evolium\webinar-experiment-01-live
code .
~~~

En la terminal integrada comprueba:

~~~powershell
Get-Location
git rev-parse --show-toplevel
git diff -- src/records.py tests/test_records.py
~~~

El directorio debe ser C:\Evolium\webinar-experiment-01-live y el diff inicial de los dos archivos debe estar vacío. **Si el directorio es otro, detente.**

Inicia una **sesión nueva**, sin reanudar una sesión anterior de Claude Code:

~~~powershell
claude
~~~

Pega **exactamente el mismo mensaje** de [prompts/mensaje-unico.md](prompts/mensaje-unico.md). No menciones los archivos ni expliques los criterios de aceptación.

Observa si el agente, por iniciativa propia y/o siguiendo las instrucciones persistentes del proyecto:

1. Explora los archivos existentes.
2. Lee NEXT_TASK.md, AGENTS.md y CLAUDE.md.
3. Examina src/records.py y tests/test_records.py.
4. Implementa una corrección compatible con las reglas existentes.
5. Ejecuta las pruebas y revisa git diff.

Autoriza solamente operaciones de lectura, modificaciones en el repositorio temporal y pruebas locales; **nunca commit ni push**. Si hace preguntas, regístralas y no agregues requisitos nuevos durante la observación.

## 9. Verificar de forma independiente

Termina la sesión de Claude Code con /exit y ejecuta en PowerShell:

~~~powershell
cd C:\Evolium\webinar-experiment-01-live
python -m unittest discover -s tests -v
git diff --check
git --no-pager diff -- src/records.py tests/test_records.py
git status --short
git log -1 --oneline
~~~

Criterios del proyecto que **evaluaremos después**, no daremos en el prompt:
- Un customer_id válido existe, es un string y no está vacío tras quitar espacios.
- La función conserva firma pública, orden, comportamiento válido y registros originales intactos.
- Las pruebas pasan y el diff no contiene modificaciones ajenas a la tarea.
- La corrección no se confirma solo porque el agente lo diga: exige salida real de pruebas y diff.

Si todas las pruebas pasan, confirma que **el cambio concreto está cubierto por esa batería de pruebas**. No significa ausencia garantizada de otros defectos.

## 10. Conclusión y límites

Registra todo en la [bitácora](BITACORA.md).

La comparación **sí permite observar** si el acceso al proyecto permitió descubrir reglas y comprobar cambios sin retransmitir el contexto.

**No permite concluir**, en una única ejecución:
- Que Claude Web no sabe programar o que su decisión de pedir contexto sea un error.
- Que Claude Code sea inherentemente más inteligente.
- Que los modelos tengan la misma información, precisión, velocidad o consumo de tokens.
- Que una propuesta sin contexto necesariamente rompería el proyecto.

**Idea central:** en ingeniería empresarial, las reglas del sistema, el código preexistente y las pruebas son parte de la seguridad y calidad de cualquier cambio, lo escriba un humano o una IA.

## 11. Restaurar para repetir

**Advertencia:** el reset descarta cambios y archivos no versionados dentro del repositorio temporal. Guarda cualquier evidencia fuera de esa carpeta.

~~~powershell
cd C:\Evolium\evolium-uees-fiinbro-webinar-oct26\experiments\01-ai-engineering-harness
.\scripts\reset-demo.ps1

cd C:\Evolium\webinar-experiment-01-live
git status --short
git log -1 --oneline
~~~

El resultado esperado es el commit demo: baseline y un status limpio. La función vuelve a tener el fallo intencional.

[Mensaje para ambos](prompts/mensaje-unico.md) | [Bitácora](BITACORA.md) | [Experimento 02](../02-bank-document-to-orion/README.md)
