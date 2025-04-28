from contextlib import asynccontextmanager
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from app.api.api import api_router
from app.core.config import settings

@asynccontextmanager
async def lifespan(app: FastAPI):
    # 앱 시작 시 실행되는 코드
    print("애플리케이션 시작")
    yield
    # 앱 종료 시 실행되는 코드
    print("애플리케이션 종료")

app = FastAPI(
    title=settings.PROJECT_NAME,
    description="K-Drama 회차 요약 앱을 위한 API",
    version="0.1.0",
    docs_url="/api/docs",
    redoc_url="/api/redoc",
    openapi_url="/api/openapi.json",
    lifespan=lifespan
)

# CORS 미들웨어 설정
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # 프로덕션 환경에서는 특정 도메인으로 제한해야 함
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
async def root():
    return {"message": "SnapDrama API에 오신 것을 환영합니다!"}

# API 라우터 등록
app.include_router(api_router, prefix=settings.API_V1_STR)

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000) 