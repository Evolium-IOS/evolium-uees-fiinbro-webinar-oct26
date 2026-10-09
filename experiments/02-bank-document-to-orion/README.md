# Experimento 02: de un PDF bancario a datos verificables

**Sigue estos pasos para reproducir el experimento.** La aplicación usa Streamlit y una API de modelos para procesar estados de cuenta en PDF.

## 1. Pregunta de investigación

**¿Cómo podemos extraer datos estructurados de un documento y comprobar, mediante evidencia, que son suficientemente confiables?**

## 2. Hipótesis

**Separar clasificación del documento, extracción, validación y reparación permite identificar errores y representar la incertidumbre mejor que utilizar solamente una respuesta sin validación.**

Esta es una hipótesis que exploraremos con los ejemplos disponibles, no una afirmación de exactitud garantizada.

## 3. Qué vamos a observar

~~~text
PDF de demostración
  -> Router: TEXT o VISION
  -> Extracción estructurada
  -> Validación contra evidencia
  -> Reparación acotada, si corresponde
  -> Tabla, reporte y metadatos
~~~

- **TEXT:** utiliza texto legible del PDF.
- **VISION:** convierte páginas en imágenes y utiliza OCR mediante un modelo con visión.
- **Validación:** muestra PASS, FAIL o UNCERTAIN por campo.
- **Reparación:** intenta corregir resultados en un número limitado de rondas.

El experimento ilustra por qué extraer datos no basta para incorporarlos a una operación real.

## 4. Requisitos

- Windows con PowerShell y Python 3.10 o superior.
- Conexión a internet para instalar dependencias y acceder a la API.
- Una clave válida de **OpenAI API** con facturación habilitada y acceso a los modelos configurados.

**Nota:** ChatGPT Plus o Pro y las licencias de herramientas de programación no incluyen necesariamente facturación de OpenAI API. Las llamadas de extracción y OCR pueden generar cargos.

## 5. Descargar o actualizar el repositorio

Si es tu primera vez:

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

Ve al Experimento 02:

~~~powershell
cd C:\Evolium\evolium-uees-fiinbro-webinar-oct26\experiments\02-bank-document-to-orion
~~~

## 6. Preparar el entorno

~~~powershell
.\scripts\preparar-entorno.ps1
~~~

Este script crea un entorno virtual en app/.venv, instala las bibliotecas de requirements.txt y crea app/.env a partir de app/.env.example, si el archivo aún no existe.

## 7. Configurar la API

Abre **app/.env** localmente y coloca tu clave en OPENAI_API_KEY. No compartas el contenido de ese archivo.

Valores disponibles en app/.env.example:

~~~text
OPENAI_API_KEY=TU_CLAVE
LLM_MODEL=gpt-4.1-mini
VISION_MODEL=gpt-4.1-mini
OCR_DPI=200
OCR_MAX_PAGES=10
~~~

La aplicación enviará a la API el texto extraído (TEXT) o imágenes de páginas (VISION). **Utiliza solamente PDFs de demostración o información expresamente autorizada.**

## 8. Iniciar la aplicación

Desde la carpeta del Experimento 02:

~~~powershell
.\scripts\iniciar-demo.ps1
~~~

Abre en el navegador: **http://localhost:8501**. Mantén abierta la terminal mientras utilices Streamlit.

## 9. Prueba A: PDF con texto

1. En la interfaz, selecciona el archivo **app/assets/bank_statements/statement_sample1.pdf**.
2. Selecciona el banco configurado que corresponda a la muestra.
3. Observa **Decisión del router** y registra la ruta, que debería ser TEXT.
4. Pulsa **Extraer y validar**.
5. Revisa la tabla, el resumen de validación, el reporte por campo, el JSON y los metadatos.

No presupongas que todos los campos serán PASS. Registra el resultado real.

## 10. Prueba B: PDF escaneado

1. Repite el proceso con **app/assets/bank_statements/statement_ocr.pdf**.
2. Observa la decisión del router, que debería ser VISION.
3. Ejecuta la extracción.
4. Compara los campos, las evidencias, la confianza y las rondas utilizadas.

La ruta VISION puede consumir más recursos porque necesita procesar imágenes antes de extraer datos.

## 11. Interpretar los resultados como investigador

Responde:

1. ¿La elección TEXT o VISION fue consistente con el documento?
2. ¿Qué campos se extrajeron con evidencia verificable?
3. ¿Qué campos quedaron como FAIL o UNCERTAIN?
4. ¿Cuándo hizo falta reparación y qué resultado produjo?
5. ¿Qué necesitaría una empresa antes de utilizar estos datos en un proceso real?

**Conclusión a evaluar:** un dato extraído necesita reglas, fuentes, evidencia, tratamiento de incertidumbre, revisión humana cuando corresponda y controles de operación.

El enlace con ORION es **conceptual**. Este extractor no es el mismo producto que ORION ni se convierte automáticamente en él.

## 12. Arquitectura y archivos que sí utiliza el experimento

~~~text
app/
  .env.example
  requirements.txt
  app/
    ui_streamlit.py
    pdf_router.py
    orchestrator_text.py
    orchestrator_vision.py
    utility_pdf.py
    config.py
  assets/
    bank_statements/
      statement_sample1.pdf
      statement_ocr.pdf
scripts/
  preparar-entorno.ps1
  iniciar-demo.ps1
~~~

La UI guarda temporalmente los PDFs cargados en app/artifacts/. Esa carpeta no se sube a GitHub.

## Seguridad

No uses documentos bancarios privados en esta demostración pública. No publiques claves API ni archivos .env. Los resultados no reemplazan controles humanos o financieros de producción.

[Volver al inicio](../../README.md) | [Experimento 01](../01-ai-engineering-harness/README.md)
