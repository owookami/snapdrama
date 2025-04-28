from pydantic import BaseModel

class DramaBase(BaseModel):
    title: str
    description: str | None = None
    thumbnail_url: str | None = None
    genre_id: str
    release_year: int
    total_episodes: int

class DramaCreate(DramaBase):
    pass

class DramaUpdate(DramaBase):
    title: str | None = None
    genre_id: str | None = None
    release_year: int | None = None
    total_episodes: int | None = None

class DramaInDB(DramaBase):
    id: str

    class Config:
        from_attributes = True

class Drama(DramaInDB):
    pass 