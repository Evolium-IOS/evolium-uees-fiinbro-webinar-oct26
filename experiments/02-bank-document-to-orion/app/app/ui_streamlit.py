import os
import sys
import json
import pandas as pd
import streamlit as st
import uuid

# Asegura que la raíz del proyecto esté disponible en PYTHONPATH.
PROJECT_ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
if PROJECT_ROOT not in sys.path:
    sys.path.insert(0, PROJECT_ROOT)

from app.pdf_router import route_pdf
from app.orchestrator_text import run_text_pipeline, summarize_report
from app.orchestrator_vision import run_vision_pipeline


def save_uploaded_file(uploaded_file) -> str:
    os.makedirs("artifacts", exist_ok=True)

    safe_name = f"{uuid.uuid4().hex}_{uploaded_file.name}"
    out_path = os.path.join("artifacts", safe_name)

    with open(out_path, "wb") as f:
        f.write(uploaded_file.getbuffer())

    return out_path


def main():
    st.title("Extracción y validación de datos desde estados de cuenta")
    st.info(
        "🧪 **Demostración de investigación**\n\n"
        "Esta interfaz muestra un flujo agéntico de routing, extracción, validación y reparación acotada.\n\n"
        "Usa únicamente documentos de demostración o información autorizada.",
        icon="ℹ️",
    )

    uploaded = st.file_uploader("Sube un estado de cuenta en PDF", type=["pdf"])
    bank_choice = st.selectbox(
        "Selecciona el banco configurado",
        ["Commerce Bank", "SAMPLE"],
    )

    if uploaded is None:
        st.info("Sube un PDF para comenzar.")
        return

    pdf_path = save_uploaded_file(uploaded)
    st.write("Archivo guardado localmente:", pdf_path)

    router_result = route_pdf(pdf_path)
    st.subheader("Decisión del router")
    st.json(router_result)

    if st.button("Extraer y validar"):
        with st.spinner("Ejecutando extracción + validación..."):
            if router_result.get("route") == "TEXT":
                pipeline = run_text_pipeline
            else:
                pipeline = run_vision_pipeline

            final_table, final_report, meta = pipeline(
                pdf_path,
                max_rounds=2,
                min_pass_rate=0.90,
                configured_bank_name=bank_choice,
            )

        summary = summarize_report(final_report)

        st.subheader("Tabla final")
        st.dataframe(pd.DataFrame([final_table]))

        st.subheader("Resumen de validación")
        st.json(summary)

        st.subheader("Reporte de validación por campo")
        st.dataframe(pd.DataFrame(final_report))

        st.subheader("Salida JSON")
        st.code(json.dumps(final_table, indent=2), language="json")

        st.subheader("Metadata de ejecución")
        st.json(meta)


if __name__ == "__main__":
    main()
