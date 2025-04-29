import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error_response.freezed.dart';
part 'api_error_response.g.dart';

/// API 오류 코드 상수
class ApiErrorCode {
  /// 인증 실패
  static const String unauthorized = 'UNAUTHORIZED';

  /// 리소스를 찾을 수 없음
  static const String notFound = 'NOT_FOUND';

  /// 서버 내부 오류
  static const String serverError = 'SERVER_ERROR';

  /// 입력값 검증 실패
  static const String validationFailed = 'VALIDATION_FAILED';

  /// 중복된 데이터
  static const String duplicateEntry = 'DUPLICATE_ENTRY';

  /// 서비스 제한 초과 (구독, 요청 제한 등)
  static const String serviceLimitExceeded = 'SERVICE_LIMIT_EXCEEDED';

  /// 네트워크 연결 오류
  static const String networkError = 'NETWORK_ERROR';

  /// 요청 제한 초과
  static const String rateLimitExceeded = 'RATE_LIMIT_EXCEEDED';
}

/// API 검증 오류 항목
@Freezed(makeCollectionsUnmodifiable: false)
abstract class ValidationError with _$ValidationError {
  const factory ValidationError({
    /// 오류가 발생한 필드명
    required String field,

    /// 오류 메시지
    required String message,
  }) = _ValidationError;

  /// JSON에서 ValidationError 객체 생성
  factory ValidationError.fromJson(Map<String, dynamic> json) =>
      _$ValidationErrorFromJson(json);
}

/// 입력값 검증 오류 응답
@Freezed(makeCollectionsUnmodifiable: false)
abstract class ValidationErrorResponse with _$ValidationErrorResponse {
  const factory ValidationErrorResponse({
    /// 오류 코드
    @Default(ApiErrorCode.validationFailed) String code,

    /// 오류 메시지
    required String message,

    /// 검증 오류 목록
    required List<ValidationError> errors,
  }) = _ValidationErrorResponse;

  /// JSON에서 ValidationErrorResponse 객체 생성
  factory ValidationErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ValidationErrorResponseFromJson(json);
}

/// API 오류 응답 모델
@Freezed(makeCollectionsUnmodifiable: false)
abstract class ApiErrorResponse with _$ApiErrorResponse {
  const ApiErrorResponse._();

  const factory ApiErrorResponse({
    /// HTTP 상태 코드
    required int statusCode,

    /// 오류 메시지
    required String message,

    /// 오류 코드
    required String code,

    /// 상세 오류 정보
    String? detail,

    /// 필드별 오류 정보
    @Default({}) Map<String, String> fieldErrors,
  }) = _ApiErrorResponse;

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorResponseFromJson(json);
}
