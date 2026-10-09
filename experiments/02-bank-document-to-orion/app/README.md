# Sistema Agéntico Auto-validado para Extracción de Datos de Estados de Cuenta

Este proyecto demuestra un flujo de extracción estructurada desde estados de cuenta bancarios en PDF.

Los documentos pueden llegar como:
- PDFs con texto legible por máquina;
- PDFs escaneados basados en imágenes.

En ambos casos, el objetivo no es solamente extraer campos. El sistema intenta **validar cada campo contra evidencia**, marcar resultados como `PASS`, `FAIL` o `UNCERTAIN`, y realizar una reparación acotada cuando la validación no alcanza el umbral esperado.

## Qué hace

- Extrae datos estructurados de estados de cuenta bancarios.
- Soporta rutas:
  - `TEXT` para PDFs con texto;
  - `VISION` para PDFs escaneados.
- Valida cada campo contra evidencia.
- Devuelve:
  - valor extraído;
  - cita/evidencia;
  - estado de validación;
  - sugerencia;
  - confianza;
  - motivo.
- Ejecuta reparación en un número limitado de rondas.
- Conserva metadata de ejecución.

## Arquitectura de alto nivel

```text
UI
 ↓
Router
 ├─ TEXT   → extracción de texto
 └─ VISION → páginas renderizadas → OCR
 ↓
Extracción estructurada
 ↓
Validación por campo
 ↓
Reparación acotada
 ↓
Mejor resultado observado
```

El nombre del banco se selecciona en la UI y se mantiene como un valor determinístico.

## Instalación

Consulta:

`assets/docs/INSTALL.md`

## Ejecutar localmente

Desde la carpeta `app/` de este proyecto:

```powershell
streamlit run app/ui_streamlit.py
```

O, desde la carpeta del Experimento 02:

```powershell
.\scripts\iniciar-demo.ps1
```

La URL local normalmente es:

`http://localhost:8501`

## PDFs de demostración incluidos

`assets/bank_statements/statement_sample1.pdf`

`assets/bank_statements/statement_ocr.pdf`

Estos archivos permiten demostrar las rutas TEXT y VISION respectivamente.

## Seguridad y privacidad

El routing y el renderizado de PDF ocurren localmente.

Sin embargo, el proyecto actual usa la API configurada para operaciones con modelos:
- la ruta TEXT envía texto extraído;
- la ruta VISION envía imágenes renderizadas para OCR.

El proyecto no implementa todavía enmascaramiento automático de valores sensibles antes de esas llamadas.

Por esa razón, esta versión debe utilizarse únicamente con documentos de demostración o información autorizada.

## Límites actuales

- Los esquemas están diseñados alrededor de los formatos de demostración incluidos.
- Un formato bancario distinto puede producir resultados deficientes.
- La reparación está limitada por `max_rounds`.
- La UI es una demostración y no un sistema de producción.

## Extensiones previstas

- procesamiento por lotes;
- almacenamiento persistente;
- API de servicio;
- integración con CRM/ERP;
- controles de acceso y auditoría;
- opciones de despliegue más aisladas.

## Autor

Angel A. Barrera
