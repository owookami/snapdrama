import pytest
from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

def test_read_root():
    response = client.get("/")
    assert response.status_code == 200
    assert "message" in response.json()

def test_read_dramas():
    response = client.get("/api/v1/dramas/")
    assert response.status_code == 200
    assert isinstance(response.json(), list)

def test_read_drama():
    response = client.get("/api/v1/dramas/test-id")
    assert response.status_code == 200
    assert response.json()["id"] == "test-id" 