# Guía de instalación y reproducción

Esta guía explica cómo ejecutar localmente el sistema de extracción de estados de cuenta y reproducir las rutas `TEXT` y `VISION`.

## 1. Stack

- Python 3.10+
- Streamlit
- pdfplumber
- PyMuPDF (`fitz`)
- OpenAI API
- pandas
- JSON

## 2. Flujo

```text
Router → Orquestador → Utilidades → UI
```

Ambas rutas incluyen validación y reparación acotada.

Cada ejecución devuelve:
- tabla estructurada;
- reporte de validación por campo;
- metadata de ejecución.

## 3. Requisitos

- Python 3.10 o superior.
- Acceso a terminal/PowerShell.
- Una `OPENAI_API_KEY` válida para los modelos configurados.

## 4. Crear entorno virtual

Desde `experiments/02-bank-document-to-orion/app`:

```powershell
python -m venv .venv
.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
pip install -r requirements.txt
```

## 5. Configurar variables

Copiar:

```text
.env.example
```

a:

```text
.env
```

Completar al menos:

```text
OPENAI_API_KEY=TU_CLAVE
```

Configuración disponible:

```text
LLM_MODEL=gpt-4.1-mini
VISION_MODEL=gpt-4.1-mini
OCR_DPI=200
OCR_MAX_PAGES=10
```

## 6. Ejecutar la UI

```powershell
streamlit run app/ui_streamlit.py
```

Normalmente:

```text
http://localhost:8501
```

## 7. Ruta TEXT

Usar:

`assets/bank_statements/statement_sample1.pdf`

Esperar:

```text
route = TEXT
```

Luego presionar **Extraer y validar**.

Revisar:
- tabla final;
- resumen de validación;
- reporte por campo;
- JSON;
- metadata.

## 8. Ruta VISION

Usar:

`assets/bank_statements/statement_ocr.pdf`

Esperar:

```text
route = VISION
```

La ruta:
1. renderiza páginas con PyMuPDF;
2. ejecuta OCR mediante el modelo configurado;
3. extrae campos;
4. valida;
5. repara de forma acotada si es necesario.

## 9. Componentes reales del proyecto

### Router: `app/pdf_router.py`
Extrae texto con `pdfplumber` y usa heurísticas de longitud/cantidad de palabras para decidir TEXT o VISION.

### Orquestador TEXT: `app/orchestrator_text.py`
Extrae, valida y ejecuta reparación acotada.

### Orquestador VISION: `app/orchestrator_vision.py`
Renderiza páginas, ejecuta OCR y aplica el mismo patrón general de validación/reparación.

### Validador/utilidades: `app/utility_pdf.py`
Contiene extracción de PDF, llamadas al modelo, validación, evidencia y utilidades OCR.

### UI: `app/ui_streamlit.py`
Permite subir PDF, seleccionar banco, observar el routing y ejecutar extracción/validación.

## 10. Campos: TEXT

- bank_name
- customer_name
- customer_address
- account_number
- statement_date
- initial_balance
- deposits_other_credits
- ATM_Withdrawals_Debits
- VISA_Check_Card_Purchases_Debits
- Withdrawals_Other_Debits
- total_checks_paid
- ending_balance

## 11. Campos: VISION

- bank_name
- account_number
- statement_date
- beginning_balance
- total_deposits_and_other_credits
- total_withdrawals_and_other_debits
- total_service_charges_fees
- ending_balance

## 12. Salidas

### Tabla final
Diccionario estructurado.

### Reporte de validación
Por campo:
- status;
- extracted_value;
- evidence_quote;
- suggested_value;
- confidence;
- reason.

### Metadata
- rounds_used;
- best_round;
- final_pass_rate;
- parámetros OCR cuando aplica.

## 13. Artefactos

Los PDFs subidos se guardan localmente en:

```text
artifacts/
```

Las imágenes renderizadas para VISION se guardan en:

```text
artifacts/rendered_pages/
```

## 14. Notas de reproducción

- La reparación tiene un número máximo de rondas.
- La mejor ronda se selecciona por tasa de aprobación.
- El nombre del banco proviene de la selección de UI y se protege determinísticamente.
- Los formatos de demostración incluidos son la base de los esquemas actuales.
