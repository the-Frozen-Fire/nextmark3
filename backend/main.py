import os
from fastapi import FastAPI

app = FastAPI()

@app.get("/healthz")
def healthz():
    return {
        "status": "ok",
        "database_url_configured": bool(os.getenv("DATABASE_URL")),
        "ollama_base_url": os.getenv("OLLAMA_BASE_URL", ""),
        "llm_model": os.getenv("LLM_MODEL", ""),
    }
