from fastapi import APIRouter

from app.api.endpoints import dramas
# 추가할 다른 엔드포인트: episodes, summaries, auth, users, media

api_router = APIRouter()

api_router.include_router(dramas.router, prefix="/dramas", tags=["드라마"])
# api_router.include_router(auth.router, prefix="/auth", tags=["인증"])
# api_router.include_router(users.router, prefix="/users", tags=["사용자"])
# api_router.include_router(episodes.router, prefix="/episodes", tags=["에피소드"])
# api_router.include_router(summaries.router, prefix="/summaries", tags=["요약"])
# api_router.include_router(media.router, prefix="/media", tags=["미디어"]) 