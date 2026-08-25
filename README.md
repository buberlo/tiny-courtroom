# Tiny Courtroom

> Let two AI advocates argue over your messy notes.

Users upload a decision memo or messy note, and two lightweight agents take opposing stances with citations to the text. The app scores argument quality and prompts the user to render a final verdict with confidence.

## Features
- Dual-agent debate over local RAG snippets
- Citation chips linked to note line numbers
- Argument quality rubric from a judge model
- Export verdict as a shareable paragraph

## Stack
- Python
- FastAPI
- LangChain
- ChromaDB

## Getting started
```
pip install fastapi uvicorn langchain langchain-community chromadb && uvicorn app.main:app --reload
```

---
*Farmed 🚜 by [Appshaker](https://github.com/buberlo) — shaken into existence.*
