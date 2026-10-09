# Guion — Experimento 02

## Entrada

> “Ahora quiero enseñarles un experimento que empezó con una pregunta mucho más pequeña: ¿cómo convierto un documento bancario en datos confiables?”

## Preguntas al público

1. ¿Qué campos necesitamos?
2. ¿Cómo sabemos si la extracción es correcta?
3. ¿Qué hacemos cuando un campo falla?

## Lo que realmente hace el proyecto

El código cargado confirma dos caminos:

### PDF con texto
`pdfplumber` extrae texto y el sistema ejecuta extracción, validación y una reparación acotada.

### PDF escaneado
PyMuPDF renderiza páginas como imágenes, un modelo con visión produce OCR y luego se ejecuta el mismo patrón de extracción/validación/reparación.

El router decide `TEXT` o `VISION` según la cantidad de texto legible encontrada.

## Demostración

1. Tener Streamlit abierto antes de llegar a esta sección.
2. Subir un PDF de demostración.
3. Mostrar la decisión del router.
4. Ejecutar **Extraer y validar**.
5. Mostrar la tabla final.
6. Mostrar el resumen de validación.
7. Abrir brevemente el reporte por campo:
   - PASS
   - FAIL
   - UNCERTAIN
   - evidencia
   - confianza
8. Mostrar metadata:
   - rondas usadas;
   - mejor ronda;
   - tasa final de aprobación;
   - datos OCR cuando aplica.

## Investigación

Explicar:

> “El problema no era pedirle a un modelo que leyera un PDF. El problema era definir qué significa que un dato sea correcto, cómo comprobarlo y qué hacemos cuando la respuesta no pasa la validación.”

## Transición

> “Extraer el dato era solo el comienzo.”

Luego preguntar:
- ¿Qué reglas aplican?
- ¿Quién revisa excepciones?
- ¿Qué fuente gana cuando dos documentos contradicen?
- ¿Qué contexto pertenece al caso?
- ¿Cómo sabe el siguiente usuario qué ocurrió?
- ¿Qué automatizamos y qué necesita decisión humana?

## ORION

No decir que este extractor literalmente se convirtió en ORION.

Usar:

> “Este tipo de experimento ayudó a revelar problemas operativos más amplios. Documentos, reglas, contexto, revisión y decisiones son precisamente problemas que después aparecen en sistemas como ORION.”
