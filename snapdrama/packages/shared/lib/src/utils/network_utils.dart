import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:shared/src/constants/app_constants.dart';
import 'package:shared/src/constants/http_status_codes.dart';

/// 네트워크 관련 유틸리티 함수 모음
class NetworkUtils {
  /// 인터넷 연결 상태 확인
  static Future<bool> hasInternetConnection() async {
    try {
      if (kIsWeb) {
        // 웹에서는 fetch API로 간단한 요청 테스트
        // 실제 구현은 브라우저 환경에서 navigator.onLine 등 사용
        return true;
      }

      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    } catch (e) {
      return false;
    }
  }

  /// URL 파라미터 인코딩
  static String encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  /// URL 파라미터 디코딩
  static Map<String, String> decodeQueryParameters(String query) {
    final result = <String, String>{};
    if (query.isEmpty) return result;

    final pairs = query.split('&');
    for (var pair in pairs) {
      final parts = pair.split('=');
      if (parts.length == 2) {
        result[Uri.decodeComponent(parts[0])] = Uri.decodeComponent(parts[1]);
      }
    }
    return result;
  }

  /// URL에서 특정 쿼리 파라미터 추출
  static String? getQueryParameter(String url, String paramName) {
    final uri = Uri.parse(url);
    return uri.queryParameters[paramName];
  }

  /// URL에서 쿼리 파라미터 추가 또는 업데이트
  static String updateQueryParameter(
      String url, String paramName, String paramValue) {
    final uri = Uri.parse(url);
    final params = Map<String, String>.from(uri.queryParameters);
    params[paramName] = paramValue;

    return Uri(
      scheme: uri.scheme,
      userInfo: uri.userInfo,
      host: uri.host,
      port: uri.port,
      path: uri.path,
      queryParameters: params,
      fragment: uri.fragment,
    ).toString();
  }

  /// URL이 유효한지 확인
  static bool isValidUrl(String url) {
    try {
      final uri = Uri.parse(url);
      return uri.scheme.isNotEmpty && uri.host.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  /// 지수 백오프 알고리즘을 사용한 재시도 함수
  static Future<T> retryWithBackoff<T>({
    required Future<T> Function() fn,
    int maxRetries = AppConstants.maxRetryAttempts,
    int initialDelayMs = AppConstants.retryDelayMs,
    bool Function(Exception)? retryIf,
  }) async {
    int attempts = 0;
    int delay = initialDelayMs;

    while (true) {
      try {
        return await fn();
      } on Exception catch (e) {
        attempts++;

        if (attempts >= maxRetries || (retryIf != null && !retryIf(e))) {
          rethrow;
        }

        await Future.delayed(Duration(milliseconds: delay));
        delay *= 2; // 지수 백오프
      }
    }
  }

  /// HTTP 응답 코드가 성공인지 확인
  static bool isSuccessful(int statusCode) {
    return HttpStatusCodes.isSuccess(statusCode);
  }

  /// HTTP 응답 코드가 인증 관련 오류인지 확인
  static bool isAuthError(int statusCode) {
    return statusCode == HttpStatusCodes.unauthorized ||
        statusCode == HttpStatusCodes.forbidden;
  }

  /// HTTP 응답 코드가 서버 오류인지 확인
  static bool isServerError(int statusCode) {
    return HttpStatusCodes.isServerError(statusCode);
  }

  /// HTTP 응답 코드가 네트워크 연결 오류인지 확인
  static bool isConnectionError(int? statusCode) {
    return statusCode == null ||
        statusCode == HttpStatusCodes.requestTimeout ||
        statusCode == HttpStatusCodes.gatewayTimeout ||
        statusCode == HttpStatusCodes.serviceUnavailable;
  }

  /// 파일 다운로드 URL 생성
  static String buildDownloadUrl(String baseUrl, String filePath,
      {Map<String, String>? queryParams}) {
    final uri = Uri.parse('$baseUrl/$filePath');

    if (queryParams == null || queryParams.isEmpty) {
      return uri.toString();
    }

    return uri.replace(queryParameters: queryParams).toString();
  }
}
