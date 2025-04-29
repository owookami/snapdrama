/// HTTP 상태 코드 상수 정의
class HttpStatusCodes {
  // 1xx - 정보 응답
  static const int continue_ = 100;
  static const int switchingProtocols = 101;
  static const int processing = 102;
  static const int earlyHints = 103;

  // 2xx - 성공 응답
  static const int ok = 200;
  static const int created = 201;
  static const int accepted = 202;
  static const int nonAuthoritativeInformation = 203;
  static const int noContent = 204;
  static const int resetContent = 205;
  static const int partialContent = 206;
  static const int multiStatus = 207;
  static const int alreadyReported = 208;
  static const int imUsed = 226;

  // 3xx - 리다이렉션 응답
  static const int multipleChoices = 300;
  static const int movedPermanently = 301;
  static const int found = 302;
  static const int seeOther = 303;
  static const int notModified = 304;
  static const int useProxy = 305;
  static const int temporaryRedirect = 307;
  static const int permanentRedirect = 308;

  // 4xx - 클라이언트 오류 응답
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int paymentRequired = 402;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int methodNotAllowed = 405;
  static const int notAcceptable = 406;
  static const int proxyAuthenticationRequired = 407;
  static const int requestTimeout = 408;
  static const int conflict = 409;
  static const int gone = 410;
  static const int lengthRequired = 411;
  static const int preconditionFailed = 412;
  static const int payloadTooLarge = 413;
  static const int uriTooLong = 414;
  static const int unsupportedMediaType = 415;
  static const int rangeNotSatisfiable = 416;
  static const int expectationFailed = 417;
  static const int imATeapot = 418;
  static const int misdirectedRequest = 421;
  static const int unprocessableEntity = 422;
  static const int locked = 423;
  static const int failedDependency = 424;
  static const int tooEarly = 425;
  static const int upgradeRequired = 426;
  static const int preconditionRequired = 428;
  static const int tooManyRequests = 429;
  static const int requestHeaderFieldsTooLarge = 431;
  static const int unavailableForLegalReasons = 451;

  // 5xx - 서버 오류 응답
  static const int internalServerError = 500;
  static const int notImplemented = 501;
  static const int badGateway = 502;
  static const int serviceUnavailable = 503;
  static const int gatewayTimeout = 504;
  static const int httpVersionNotSupported = 505;
  static const int variantAlsoNegotiates = 506;
  static const int insufficientStorage = 507;
  static const int loopDetected = 508;
  static const int notExtended = 510;
  static const int networkAuthenticationRequired = 511;

  /// 상태 코드가 성공 응답인지 확인 (2xx)
  static bool isSuccess(int statusCode) {
    return statusCode >= 200 && statusCode < 300;
  }

  /// 상태 코드가 리다이렉션 응답인지 확인 (3xx)
  static bool isRedirection(int statusCode) {
    return statusCode >= 300 && statusCode < 400;
  }

  /// 상태 코드가 클라이언트 오류 응답인지 확인 (4xx)
  static bool isClientError(int statusCode) {
    return statusCode >= 400 && statusCode < 500;
  }

  /// 상태 코드가 서버 오류 응답인지 확인 (5xx)
  static bool isServerError(int statusCode) {
    return statusCode >= 500 && statusCode < 600;
  }

  /// 상태 코드가 오류 응답인지 확인 (4xx 또는 5xx)
  static bool isError(int statusCode) {
    return statusCode >= 400;
  }

  /// 상태 코드에 대한 기본 메시지 반환
  static String getStatusMessage(int statusCode) {
    final Map<int, String> statusMessages = {
      ok: '성공',
      created: '생성됨',
      accepted: '요청 수락됨',
      noContent: '내용 없음',
      badRequest: '잘못된 요청',
      unauthorized: '인증 필요',
      forbidden: '접근 금지됨',
      notFound: '찾을 수 없음',
      conflict: '충돌',
      unprocessableEntity: '처리할 수 없는 엔티티',
      tooManyRequests: '너무 많은 요청',
      internalServerError: '서버 내부 오류',
      serviceUnavailable: '서비스 이용 불가'
    };

    return statusMessages[statusCode] ?? '알 수 없는 상태';
  }
}
