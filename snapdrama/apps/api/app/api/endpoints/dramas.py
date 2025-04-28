from typing import List, Optional
from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.ext.asyncio import AsyncSession

from app.db.database import get_db
from app.schemas.drama import Drama, DramaCreate, DramaUpdate

router = APIRouter()

@router.get("/", response_model=List[Drama])
async def read_dramas(
    skip: int = 0,
    limit: int = 100,
    genre: Optional[str] = None,
    db: AsyncSession = Depends(get_db)
):
    """
    드라마 목록 조회
    """
    # 실제 구현은 서비스 레이어에서 처리할 예정
    return []

@router.get("/{drama_id}", response_model=Drama)
async def read_drama(
    drama_id: str,
    db: AsyncSession = Depends(get_db)
):
    """
    특정 드라마 조회
    """
    # 실제 구현은 서비스 레이어에서 처리할 예정
    return {"id": drama_id, "title": "샘플 드라마", "description": "설명", "genre_id": "1", "release_year": 2023, "total_episodes": 16}

@router.post("/", response_model=Drama)
async def create_drama(
    drama: DramaCreate,
    db: AsyncSession = Depends(get_db)
):
    """
    드라마 생성
    """
    # 실제 구현은 서비스 레이어에서 처리할 예정
    return {"id": "new-id", "title": drama.title, "description": drama.description, "genre_id": drama.genre_id, "release_year": drama.release_year, "total_episodes": drama.total_episodes}

@router.put("/{drama_id}", response_model=Drama)
async def update_drama(
    drama_id: str,
    drama: DramaUpdate,
    db: AsyncSession = Depends(get_db)
):
    """
    드라마 정보 업데이트
    """
    # 실제 구현은 서비스 레이어에서 처리할 예정
    return {"id": drama_id, "title": drama.title, "description": drama.description, "genre_id": drama.genre_id, "release_year": drama.release_year, "total_episodes": drama.total_episodes}

@router.delete("/{drama_id}")
async def delete_drama(
    drama_id: str,
    db: AsyncSession = Depends(get_db)
):
    """
    드라마 삭제
    """
    # 실제 구현은 서비스 레이어에서 처리할 예정
    return {"message": "드라마가 삭제되었습니다."} 