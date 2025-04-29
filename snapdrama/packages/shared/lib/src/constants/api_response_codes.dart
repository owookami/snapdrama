/// API 응답 코드 및 메시지 정의
class ApiResponseCodes {
  // 성공
  static const String success = 'SUCCESS';
  static const String created = 'CREATED';
  static const String accepted = 'ACCEPTED';
  static const String noContent = 'NO_CONTENT';

  // 인증 관련
  static const String unauthorized = 'UNAUTHORIZED';
  static const String forbidden = 'FORBIDDEN';
  static const String authExpired = 'AUTH_EXPIRED';
  static const String invalidToken = 'INVALID_TOKEN';
  static const String tokenRequired = 'TOKEN_REQUIRED';

  // 요청 관련
  static const String badRequest = 'BAD_REQUEST';
  static const String notFound = 'NOT_FOUND';
  static const String methodNotAllowed = 'METHOD_NOT_ALLOWED';
  static const String requestTimeout = 'REQUEST_TIMEOUT';
  static const String conflict = 'CONFLICT';
  static const String tooManyRequests = 'TOO_MANY_REQUESTS';

  // 서버 관련
  static const String internalError = 'INTERNAL_ERROR';
  static const String notImplemented = 'NOT_IMPLEMENTED';
  static const String serviceUnavailable = 'SERVICE_UNAVAILABLE';
  static const String gatewayTimeout = 'GATEWAY_TIMEOUT';

  // 데이터 관련
  static const String validationFailed = 'VALIDATION_FAILED';
  static const String duplicateEntry = 'DUPLICATE_ENTRY';
  static const String resourceNotFound = 'RESOURCE_NOT_FOUND';
  static const String dataInconsistency = 'DATA_INCONSISTENCY';

  // 비즈니스 규칙 관련
  static const String businessRuleViolation = 'BUSINESS_RULE_VIOLATION';
  static const String insufficientPermission = 'INSUFFICIENT_PERMISSION';
  static const String quotaExceeded = 'QUOTA_EXCEEDED';
  static const String accountLocked = 'ACCOUNT_LOCKED';
  static const String subscriptionRequired = 'SUBSCRIPTION_REQUIRED';

  // HTTP 상태 코드와 API 응답 코드 매핑
  static const Map<int, String> httpToApiCodeMap = {
    200: success,
    201: created,
    202: accepted,
    204: noContent,
    400: badRequest,
    401: unauthorized,
    403: forbidden,
    404: notFound,
    405: methodNotAllowed,
    408: requestTimeout,
    409: conflict,
    422: validationFailed,
    429: tooManyRequests,
    500: internalError,
    501: notImplemented,
    503: serviceUnavailable,
    504: gatewayTimeout,
  };

  // API 응답 코드에 해당하는 기본 메시지 맵핑
  static const Map<String, String> defaultMessages = {
    success: '요청이 성공적으로 처리되었습니다.',
    created: '리소스가 성공적으로 생성되었습니다.',
    accepted: '요청이 접수되었으며 처리 중입니다.',
    noContent: '처리가 완료되었으며 반환할 내용이 없습니다.',
    unauthorized: '인증이 필요합니다.',
    forbidden: '접근 권한이 없습니다.',
    authExpired: '인증이 만료되었습니다. 다시 로그인해주세요.',
    invalidToken: '유효하지 않은 토큰입니다.',
    tokenRequired: '토큰이 필요합니다.',
    badRequest: '잘못된 요청입니다.',
    notFound: '요청한 리소스를 찾을 수 없습니다.',
    methodNotAllowed: '지원하지 않는 메소드입니다.',
    requestTimeout: '요청 시간이 초과되었습니다.',
    conflict: '요청이 현재 상태와 충돌합니다.',
    tooManyRequests: '요청이 너무 많습니다. 잠시 후 다시 시도해주세요.',
    internalError: '서버 내부 오류가 발생했습니다.',
    notImplemented: '아직 구현되지 않은 기능입니다.',
    serviceUnavailable: '서비스를 일시적으로 사용할 수 없습니다.',
    gatewayTimeout: '게이트웨이 시간 초과가 발생했습니다.',
    validationFailed: '입력값 검증에 실패했습니다.',
    duplicateEntry: '이미 존재하는 데이터입니다.',
    resourceNotFound: '요청한 리소스를 찾을 수 없습니다.',
    dataInconsistency: '데이터 일관성 오류가 발생했습니다.',
    businessRuleViolation: '비즈니스 규칙 위반이 발생했습니다.',
    insufficientPermission: '권한이 부족합니다.',
    quotaExceeded: '할당량이 초과되었습니다.',
    accountLocked: '계정이 잠겼습니다.',
    subscriptionRequired: '구독이 필요한 서비스입니다.',
  };

  /// HTTP 상태 코드에 해당하는 API 응답 코드 반환
  static String getApiCodeFromHttpStatus(int httpStatusCode) {
    return httpToApiCodeMap[httpStatusCode] ?? internalError;
  }

  /// API 응답 코드에 해당하는 기본 메시지 반환
  static String getDefaultMessage(String apiCode) {
    return defaultMessages[apiCode] ?? '알 수 없는 오류가 발생했습니다.';
  }

  /// API 응답이 성공인지 확인
  static bool isSuccess(String apiCode) {
    return apiCode == success ||
        apiCode == created ||
        apiCode == accepted ||
        apiCode == noContent;
  }

  /// API 응답이 인증 관련 오류인지 확인
  static bool isAuthError(String apiCode) {
    return apiCode == unauthorized ||
        apiCode == forbidden ||
        apiCode == authExpired ||
        apiCode == invalidToken ||
        apiCode == tokenRequired;
  }

  /// API 응답이 서버 오류인지 확인
  static bool isServerError(String apiCode) {
    return apiCode == internalError ||
        apiCode == notImplemented ||
        apiCode == serviceUnavailable ||
        apiCode == gatewayTimeout;
  }

  /// API 응답이 비즈니스 규칙 위반인지 확인
  static bool isBusinessRuleViolation(String apiCode) {
    return apiCode == businessRuleViolation ||
        apiCode == insufficientPermission ||
        apiCode == quotaExceeded ||
        apiCode == accountLocked ||
        apiCode == subscriptionRequired;
  }
}
