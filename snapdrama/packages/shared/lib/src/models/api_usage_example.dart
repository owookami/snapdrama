import 'dart:convert';

import 'api_response.dart';
import 'auth_response.dart';
import 'pagination_response.dart';
import 'drama.dart';
import 'api_error_response.dart';

/// API 응답 모델 사용 예제 코드
class ApiUsageExample {
  /// API 응답 파싱 예제
  static void parseApiResponseExample() {
    // API 응답 JSON 문자열
    final jsonString = '''
    {
      "statusCode": 200,
      "message": "드라마 목록 조회 성공",
      "success": true,
      "data": {
        "items": [
          {
            "id": "1",
            "title": "별에서 온 그대",
            "description": "외계인과 톱스타의 로맨스",
            "thumbnailUrl": "https://example.com/my-love-from-star.jpg",
            "genreId": "romance",
            "releaseYear": 2013,
            "totalEpisodes": 21,
            "created_at": "2023-04-01T00:00:00Z",
            "updated_at": "2023-04-01T00:00:00Z"
          }
        ],
        "page": 1,
        "perPage": 10,
        "total": 50,
        "lastPage": 5
      },
      "meta": {
        "total": 50,
        "page": 1,
        "perPage": 10
      }
    }
    ''';

    // JSON 파싱
    final json = jsonDecode(jsonString) as Map<String, dynamic>;

    // 페이지네이션 응답 파싱
    final paginationData = json['data'] as Map<String, dynamic>;
    final paginationResponse = PaginationResponse<Drama>.fromJson(
      paginationData,
      (obj) => Drama.fromJson(obj as Map<String, dynamic>),
    );

    // API 응답 파싱
    final apiResponse = ApiResponse<PaginationResponse<Drama>>.fromJson(
      json,
      (obj) => PaginationResponse<Drama>.fromJson(
        obj as Map<String, dynamic>,
        (dramaObj) => Drama.fromJson(dramaObj as Map<String, dynamic>),
      ),
    );

    // 응답 데이터 활용
    final dramas = paginationResponse.data;
    for (final drama in dramas) {
      print('드라마: ${drama.title}, ${drama.releaseYear}년 방영');
    }

    // 메타데이터 활용
    final meta = apiResponse.meta;
    if (meta != null) {
      print('전체 항목 수: ${meta.total}');
    }
  }

  /// 인증 응답 파싱 예제
  static void parseAuthResponseExample() {
    final jsonString = '''
    {
      "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
      "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
      "tokenType": "Bearer",
      "expiresIn": 3600,
      "userId": "user123"
    }
    ''';

    final authResponse =
        AuthResponse.fromJson(jsonDecode(jsonString) as Map<String, dynamic>);

    print('액세스 토큰: ${authResponse.accessToken}');
    print('만료 시간: ${authResponse.expiresIn}초');
  }

  /// 오류 응답 처리 예제
  static void handleErrorResponseExample() {
    final jsonString = '''
    {
      "statusCode": 400,
      "message": "입력값 검증 실패",
      "success": false,
      "error": {
        "code": "VALIDATION_FAILED",
        "message": "입력값 검증 실패",
        "errors": [
          {
            "field": "email",
            "message": "유효한 이메일 주소를 입력해주세요."
          },
          {
            "field": "password",
            "message": "비밀번호는 최소 8자 이상이어야 합니다."
          }
        ]
      }
    }
    ''';

    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    final apiResponse = ApiResponse<dynamic>.fromJson(json, (obj) => obj);

    if (!apiResponse.success && apiResponse.error != null) {
      final error = apiResponse.error!;
      print('오류 코드: ${error.code}');
      print('오류 메시지: ${error.message}');

      // 검증 오류 처리
      if (error.code == ApiErrorCode.validationFailed) {
        final errorJson = json['error'] as Map<String, dynamic>;
        final validationError = ValidationErrorResponse.fromJson(errorJson);

        for (final fieldError in validationError.errors) {
          print('${fieldError.field}: ${fieldError.message}');
        }
      }
    }
  }

  /// 응답 생성 예제
  static void createResponseExample() {
    // 성공 응답 생성
    final successResponse = createSuccessResponse<List<String>>(
      data: ['item1', 'item2', 'item3'],
      message: '아이템 목록 조회 성공',
    );

    // 오류 응답 생성
    final errorResponse = createErrorResponse<void>(
      message: '인증 실패',
      statusCode: 401,
      errorCode: ApiErrorCode.unauthorized,
    );

    // 빈 페이지네이션 응답 생성
    final emptyPagination = createEmptyPaginationResponse<Drama>();

    print('성공 응답 메시지: ${successResponse.message}');
    print('오류 응답 코드: ${errorResponse.statusCode}');
    print('빈 페이지 항목 수: ${emptyPagination.data.length}');
  }
}
