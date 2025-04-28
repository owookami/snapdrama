from sqlalchemy.ext.asyncio import create_async_engine, AsyncSession
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

from app.core.config import settings

# 비동기 엔진 생성
engine = create_async_engine(
    settings.DATABASE_URL,
    echo=True,
    future=True,
)

# 비동기 세션 생성
async_session = sessionmaker(
    engine, class_=AsyncSession, expire_on_commit=False
)

# 모델 Base 클래스 생성
Base = declarative_base()

# 비동기 세션 의존성
async def get_db():
    async with async_session() as session:
        try:
            yield session
            await session.commit()
        except Exception:
            await session.rollback()
            raise
        finally:
            await session.close() 