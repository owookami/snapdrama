# SnapDrama

SnapDrama는 Flutter와 FastAPI를 기반으로 한 K-Drama 회차 요약 숏폼 앱입니다. 이 프로젝트는 Monorepo 구조로 설계되어 있습니다.

## 프로젝트 구조

```
snapdrama/
├── apps/
│   ├── mobile/               # Flutter 앱
│   └── api/                  # FastAPI 백엔드
│
├── packages/
│   └── shared/               # 공유 모델 및 유틸리티
│
└── tools/                    # 빌드 및 개발 도구
```

## 기술 스택

- **클라이언트**: Flutter + GoRouter + Riverpod
- **백엔드**: FastAPI (Python), Cloud Functions (FFmpeg 작업 큐)
- **인증·스토리지**: Supabase (Postgres, Auth, Storage)
- **미디어 처리**: Google Cloud TTS, FFmpeg GPU, Stable Diffusion API
- **분석**: Supabase Analytics, Firebase Analytics

## 시작하기

각 애플리케이션/패키지의 설치 및 실행 지침은 해당 디렉토리의 README를 참조하세요.

### 사전 요구사항

- Flutter SDK 최신 버전
- Python 3.9 이상
- Nx CLI (모노레포 관리용)

### 설치

```bash
# 저장소 클론
git clone https://github.com/yourusername/snapdrama.git
cd snapdrama

# Flutter 의존성 설치
cd apps/mobile
flutter pub get

# 백엔드 의존성 설치
cd ../../apps/api
pip install -r requirements.txt
```

## 개발

### 앱 실행

```bash
# Flutter 앱 실행
npm run start:mobile

# 백엔드 서버 실행
npm run start:api
```

### 테스트 실행

```bash
# Flutter 앱 테스트
npm run test:mobile

# 백엔드 테스트
npm run test:api
```

## 빌드

```bash
# Nx를 사용한 모든 프로젝트 빌드
nx run-many --target=build --all

# 특정 프로젝트만 빌드
nx build mobile
``` 