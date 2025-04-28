import os
from typing import Optional, Dict, Any

from pydantic import field_validator
from pydantic_settings import BaseSettings

class Settings(BaseSettings):
    # 기본 설정
    API_V1_STR: str = "/api/v1"
    PROJECT_NAME: str = "SnapDrama API"
    
    # 보안 설정
    SECRET_KEY: str = os.environ.get("SECRET_KEY", "your-secret-key-for-development")
    ALGORITHM: str = "HS256"
    ACCESS_TOKEN_EXPIRE_MINUTES: int = 30
    
    # 데이터베이스 설정
    POSTGRES_SERVER: str = os.environ.get("POSTGRES_SERVER", "localhost")
    POSTGRES_PORT: str = os.environ.get("POSTGRES_PORT", "5432")
    POSTGRES_USER: str = os.environ.get("POSTGRES_USER", "postgres")
    POSTGRES_PASSWORD: str = os.environ.get("POSTGRES_PASSWORD", "postgres")
    POSTGRES_DB: str = os.environ.get("POSTGRES_DB", "snapdrama")
    
    # Supabase 설정
    SUPABASE_URL: Optional[str] = os.environ.get("SUPABASE_URL")
    SUPABASE_KEY: Optional[str] = os.environ.get("SUPABASE_KEY")
    
    # 데이터베이스 URL 생성
    @property
    def DATABASE_URL(self) -> str:
        return f"postgresql+asyncpg://{self.POSTGRES_USER}:{self.POSTGRES_PASSWORD}@{self.POSTGRES_SERVER}:{self.POSTGRES_PORT}/{self.POSTGRES_DB}"

    class Config:
        env_file = ".env"
        case_sensitive = True

settings = Settings() 