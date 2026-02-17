FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

COPY main.py /app/main.py

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host=0.0.0.0", "--port=8000"]
billy@ubuntu:~$ sudo cat /srv/nextmark/backend/main.py
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