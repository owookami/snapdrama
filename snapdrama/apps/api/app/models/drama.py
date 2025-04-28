from sqlalchemy import Column, Integer, String, Text

from app.db.database import Base

class Drama(Base):
    __tablename__ = "dramas"

    id = Column(String, primary_key=True, index=True)
    title = Column(String, index=True, nullable=False)
    description = Column(Text, nullable=True)
    thumbnail_url = Column(String, nullable=True)
    genre_id = Column(String, nullable=False)
    release_year = Column(Integer, nullable=False)
    total_episodes = Column(Integer, nullable=False) 