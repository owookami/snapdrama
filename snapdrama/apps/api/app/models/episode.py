from sqlalchemy import Column, Integer, String, Text, ForeignKey

from app.db.database import Base

class Episode(Base):
    __tablename__ = "episodes"

    id = Column(String, primary_key=True, index=True)
    drama_id = Column(String, ForeignKey("dramas.id", ondelete="CASCADE"), nullable=False)
    episode_number = Column(Integer, nullable=False)
    title = Column(String, nullable=False)
    description = Column(Text, nullable=True)
    thumbnail_url = Column(String, nullable=True)
    video_url = Column(String, nullable=True)
    runtime = Column(Integer, nullable=True)  # 런타임(분)
    
    # 복합 인덱스 생성 - 드라마 ID와 에피소드 번호의 조합이 유니크
    __table_args__ = (
        {'sqlite_autoincrement': True},
    ) 