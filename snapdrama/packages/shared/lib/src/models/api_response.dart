import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

/// API 응답을 위한 공통 래퍼 클래스
///
/// 모든 API 응답은 이 클래스로 감싸서 일관된 형식으로 처리합니다.
/// `data`는 API 응답의 실제 데이터를 담고, `meta`는 페이지네이션 등의 메타 정보를 담습니다.
/// `error`는 오류 발생 시 오류 정보를 담습니다.
@Freezed(genericArgumentFactories: true, makeCollectionsUnmodifiable: false)
abstract class ApiResponse<T> with _$ApiResponse<T> {
  const ApiResponse._();

  const factory ApiResponse({
    /// 응답 상태 코드
    required int statusCode,

    /// 응답 메시지
    required String message,

    /// 응답 성공 여부
    required bool success,

    /// 응답 데이터
    T? data,

    /// 메타 정보 (페이지네이션 등)
    ApiMeta? meta,

    /// 오류 정보
    ApiError? error,
  }) = _ApiResponse<T>;

  /// JSON에서 ApiResponse 객체 생성
  factory ApiResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$ApiResponseFromJson(json, fromJsonT);
}

/// 성공 응답 생성 헬퍼 함수
ApiResponse<T> createSuccessResponse<T>({
  required T data,
  String message = '성공',
  ApiMeta? meta,
}) =>
    ApiResponse(
      statusCode: 200,
      message: message,
      success: true,
      data: data,
      meta: meta,
    );

/// 오류 응답 생성 헬퍼 함수
ApiResponse<T> createErrorResponse<T>({
  required String message,
  required int statusCode,
  required String errorCode,
  String? errorDetail,
}) =>
    ApiResponse(
      statusCode: statusCode,
      message: message,
      success: false,
      error: ApiError(
        code: errorCode,
        message: message,
        detail: errorDetail,
      ),
    );

/// API 응답의 메타 정보
@Freezed(makeCollectionsUnmodifiable: false)
abstract class ApiMeta with _$ApiMeta {
  const ApiMeta._();

  const factory ApiMeta({
    /// 전체 항목 수
    required int total,

    /// 현재 페이지
    @Default(1) int page,

    /// 페이지당 항목 수
    @Default(10) int perPage,

    /// 마지막 페이지
    int? lastPage,
  }) = _ApiMeta;

  /// JSON에서 ApiMeta 객체 생성
  factory ApiMeta.fromJson(Map<String, dynamic> json) =>
      _$ApiMetaFromJson(json);
}

/// API 오류 정보
@Freezed(makeCollectionsUnmodifiable: false)
abstract class ApiError with _$ApiError {
  const ApiError._();

  const factory ApiError({
    /// 오류 코드
    required String code,

    /// 오류 메시지
    required String message,

    /// 상세 오류 정보
    String? detail,

    /// 필드별 오류 정보
    Map<String, String>? fields,
  }) = _ApiError;

  /// JSON에서 ApiError 객체 생성
  factory ApiError.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorFromJson(json);
}
