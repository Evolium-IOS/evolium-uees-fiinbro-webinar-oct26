# Experimento 01: por qué la IA necesita el contexto del proyecto

## ¿Qué queremos demostrar?

**Que generar código que pasa pruebas aisladas no equivale a corregir un sistema empresarial.** Una solución debe respetar sus reglas, dependencias y pruebas existentes.

## ¿Qué estamos haciendo?

Pedimos a Claude Web y Claude Code que corrijan **el mismo defecto**: `select_processable_records` permite procesar clientes con identificadores inválidos.

| Claude Web | Claude Code |
| --- | --- |
| Recibe un fragmento Python pegado en el chat. | Recibe la ruta del archivo dentro del repositorio. |
| No recibe los módulos ni la política de negocio. | Puede leer el proyecto, el contrato y las pruebas. |
| Puede proponer código y hacer pruebas aisladas. | Puede modificar el proyecto y ejecutar sus pruebas reales. |

La función depende de `src/customer_policy.py`, que carga **`config/customer_policy.json`**. Ese JSON define el formato permitido y las exclusiones de identificadores. **Sin él, el comportamiento empresarial correcto no puede verificarse.**

## ¿Qué observamos?

En la respuesta compartida de Claude Web:

- **Propuso código:** aceptaba cualquier `customer_id` de texto no vacío o entero, por su propia suposición.
- **Omitió la dependencia en el código entregado:** su solución ya no llamaba a `load_customer_policy()`.
- **Reportó 2 pruebas exitosas**, ejecutadas por él en un archivo aislado; no eran la batería del proyecto.
- **Reconoció los pendientes:** no conocía la definición real de identificador válido ni había ejecutado las pruebas del repositorio.

**Claude Code, con la última versión que requiere JSON: pendiente de ejecutar y verificar.** No atribuimos al agente un resultado aún no observado.

## Conclusión del experimento

**Claude Web generó una solución funcional según sus propias reglas, pero no demostró que fuera correcta para nuestra empresa.** La dependencia y los requisitos que no recibió son necesarios para verificar la compatibilidad real.

**La lección:** el valor de la ingeniería asistida por IA no se limita a escribir código; incluye proporcionar contexto, conservar contratos y comprobar los cambios dentro del sistema existente.

Esto compara **contextos de trabajo**, no inteligencia intrínseca de modelos. La política empresarial es ficticia. El resultado de Claude Web no prueba por sí solo que su parche rompería un sistema real.

## Reproducir

**1. Actualizar el repositorio principal:**

~~~powershell
cd C:\Evolium\evolium-uees-fiinbro-webinar-oct26
git pull --ff-only
~~~

**2. Preparar la copia local** (solo si ya existe la carpeta de práctica):

~~~powershell
cd .\experiments\01-ai-engineering-harness
.\scripts\reset-demo.ps1 -ActualizarPlantilla
cd C:\Evolium\webinar-experiment-01-live
python -m unittest discover -s tests -v
~~~

El reset **descarta los cambios en la copia de práctica** y establece una nueva línea base. Se esperan 14 pruebas: **9 pasan y 5 fallan intencionalmente**. Si no tienes esa carpeta, ejecuta `.\scripts\prepare-demo.ps1` desde la carpeta del experimento, en lugar del reset.

**3. Ejecutar ambos casos:** abrir una conversación nueva de Claude Web sin adjuntos y pegar [su prompt](prompts/claude-web.md); después iniciar una nueva sesión `claude` desde `C:\Evolium\webinar-experiment-01-live` y pegar [su prompt](prompts/claude-code.md). No proporcionar archivos adicionales a Claude Web ni autorizar commits o pushes.

**4. Verificar Claude Code independientemente:**

~~~powershell
cd C:\Evolium\webinar-experiment-01-live
python -m unittest discover -s tests -v
git diff --check
git --no-pager diff
git status --short
~~~

Registrar lo que ocurra realmente en [la bitácora](BITACORA.md).

[Experimento 02](../02-bank-document-to-orion/README.md)
