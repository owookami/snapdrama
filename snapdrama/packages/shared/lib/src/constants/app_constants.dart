/// 앱 전반에 걸쳐 사용되는 상수들을 정의한 클래스
class AppConstants {
  // 파일 관련 상수
  /// 최대 업로드 파일 크기 (100MB)
  static const int maxUploadFileSizeBytes = 100 * 1024 * 1024;

  /// 지원되는 이미지 형식
  static const List<String> supportedImageFormats = [
    'jpg',
    'jpeg',
    'png',
    'gif',
    'webp',
    'bmp'
  ];

  /// 지원되는 비디오 형식
  static const List<String> supportedVideoFormats = [
    'mp4',
    'mov',
    'avi',
    'mkv',
    'webm'
  ];

  /// 지원되는 오디오 형식
  static const List<String> supportedAudioFormats = [
    'mp3',
    'wav',
    'aac',
    'm4a',
    'ogg'
  ];

  // 네트워크 관련 상수
  /// 최대 재시도 횟수
  static const int maxRetryAttempts = 3;

  /// 재시도 간격 (밀리초)
  static const int retryDelayMs = 1000;

  /// 타임아웃 시간 (밀리초)
  static const int connectionTimeoutMs = 30000;

  /// 읽기 타임아웃 시간 (밀리초)
  static const int receiveTimeoutMs = 30000;

  // API 관련 상수
  /// 기본 페이지 크기
  static const int defaultPageSize = 20;

  /// 최대 페이지 크기
  static const int maxPageSize = 100;

  // 앱 설정 관련 상수
  /// 캐시 유효 기간 (일)
  static const int cacheDurationDays = 7;

  /// 메모리 캐시 최대 크기 (MB)
  static const int maxMemoryCacheMb = 100;

  /// 디스크 캐시 최대 크기 (MB)
  static const int maxDiskCacheMb = 500;
}
