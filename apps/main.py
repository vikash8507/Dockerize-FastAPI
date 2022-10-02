import uvicorn
from fastapi import FastAPI
from sqlalchemy import create_engine

SQLALCHEMY_DATABASE_URL = "postgresql://postgres:postgres@postgres_db/postgres_demo"
engine = create_engine(SQLALCHEMY_DATABASE_URL)

app = FastAPI()

@app.get("/")
async def get_user():
    return {"message": "Welcome"}

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8888)