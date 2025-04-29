import 'package:dio/dio.dart';
import 'package:shared/shared.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/utils/api_client.dart';
import 'view_history_remote_datasource.dart';

/// 시청 기록 원격 데이터 소스 구현 클래스
class ViewHistoryRemoteDataSourceImpl implements ViewHistoryRemoteDataSource {
  final ApiClient _apiClient;

  ViewHistoryRemoteDataSourceImpl({ApiClient? apiClient})
      : _apiClient = apiClient ?? ApiClient();

  @override
  Future<List<ViewHistory>> getAllViewHistory(String userId) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.viewHistory}?userId=$userId',
      );

      if (response.data == null) {
        return [];
      }

      final List<dynamic> responseData = response.data as List<dynamic>;
      return responseData
          .map((item) => ViewHistory.fromJson(item as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw _handleDioError(e, '사용자의 시청 기록을 가져오는 중 오류가 발생했습니다');
    } catch (e) {
      throw Exception('사용자의 시청 기록을 가져오는 중 오류가 발생했습니다: $e');
    }
  }

  @override
  Future<ViewHistory?> getViewHistoryByEpisode(
      String userId, String episodeId) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.viewHistory}?userId=$userId&episodeId=$episodeId',
      );

      if (response.data == null || (response.data as List).isEmpty) {
        return null;
      }

      final List<dynamic> responseData = response.data as List<dynamic>;
      if (responseData.isEmpty) {
        return null;
      }

      return ViewHistory.fromJson(responseData.first as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleDioError(e, '에피소드에 대한 시청 기록을 가져오는 중 오류가 발생했습니다');
    } catch (e) {
      throw Exception('에피소드에 대한 시청 기록을 가져오는 중 오류가 발생했습니다: $e');
    }
  }

  @override
  Future<List<ViewHistory>> getViewHistoryByDrama(
      String userId, String dramaId) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.viewHistory}?userId=$userId&dramaId=$dramaId',
      );

      if (response.data == null) {
        return [];
      }

      final List<dynamic> responseData = response.data as List<dynamic>;
      return responseData
          .map((item) => ViewHistory.fromJson(item as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw _handleDioError(e, '드라마에 대한 시청 기록을 가져오는 중 오류가 발생했습니다');
    } catch (e) {
      throw Exception('드라마에 대한 시청 기록을 가져오는 중 오류가 발생했습니다: $e');
    }
  }

  @override
  Future<ViewHistory> saveViewHistory(ViewHistory viewHistory) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.viewHistory,
        data: viewHistory.toJson(),
      );

      return ViewHistory.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleDioError(e, '시청 기록을 저장하는 중 오류가 발생했습니다');
    } catch (e) {
      throw Exception('시청 기록을 저장하는 중 오류가 발생했습니다: $e');
    }
  }

  @override
  Future<void> deleteViewHistory(String id) async {
    try {
      await _apiClient.delete('${ApiConstants.viewHistory}/$id');
    } on DioException catch (e) {
      throw _handleDioError(e, '시청 기록을 삭제하는 중 오류가 발생했습니다');
    } catch (e) {
      throw Exception('시청 기록을 삭제하는 중 오류가 발생했습니다: $e');
    }
  }

  @override
  Future<List<ViewHistory>> getRecentViewHistory(String userId,
      {int limit = 10}) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.viewHistory}/recent?userId=$userId&limit=$limit',
      );

      if (response.data == null) {
        return [];
      }

      final List<dynamic> responseData = response.data as List<dynamic>;
      return responseData
          .map((item) => ViewHistory.fromJson(item as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw _handleDioError(e, '최근 시청 기록을 가져오는 중 오류가 발생했습니다');
    } catch (e) {
      throw Exception('최근 시청 기록을 가져오는 중 오류가 발생했습니다: $e');
    }
  }

  @override
  Future<List<ViewHistory>> getCompletedViewHistory(String userId) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.viewHistory}/completed?userId=$userId',
      );

      if (response.data == null) {
        return [];
      }

      final List<dynamic> responseData = response.data as List<dynamic>;
      return responseData
          .map((item) => ViewHistory.fromJson(item as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw _handleDioError(e, '완료된 시청 기록을 가져오는 중 오류가 발생했습니다');
    } catch (e) {
      throw Exception('완료된 시청 기록을 가져오는 중 오류가 발생했습니다: $e');
    }
  }

  @override
  Future<List<ViewHistory>> getInProgressViewHistory(String userId) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.viewHistory}/in-progress?userId=$userId',
      );

      if (response.data == null) {
        return [];
      }

      final List<dynamic> responseData = response.data as List<dynamic>;
      return responseData
          .map((item) => ViewHistory.fromJson(item as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw _handleDioError(e, '진행 중인 시청 기록을 가져오는 중 오류가 발생했습니다');
    } catch (e) {
      throw Exception('진행 중인 시청 기록을 가져오는 중 오류가 발생했습니다: $e');
    }
  }

  @override
  Future<List<ViewHistory>> syncWithServer(
      String userId, List<ViewHistory> localHistories) async {
    try {
      // 로컬 기록을 서버로 전송하여 동기화
      final response = await _apiClient.post(
        '${ApiConstants.viewHistory}/sync',
        data: {
          'userId': userId,
          'viewHistories': localHistories.map((vh) => vh.toJson()).toList(),
        },
      );

      if (response.data == null) {
        return [];
      }

      final List<dynamic> responseData = response.data as List<dynamic>;
      return responseData
          .map((item) => ViewHistory.fromJson(item as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw _handleDioError(e, '시청 기록 동기화 중 오류가 발생했습니다');
    } catch (e) {
      throw Exception('시청 기록 동기화 중 오류가 발생했습니다: $e');
    }
  }

  Exception _handleDioError(DioException e, String message) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return Exception('$message: 서버 연결 시간이 초과되었습니다');
    } else if (e.type == DioExceptionType.badResponse) {
      final int? statusCode = e.response?.statusCode;
      if (statusCode == 401) {
        return Exception('$message: 인증되지 않은 접근입니다');
      } else if (statusCode == 403) {
        return Exception('$message: 접근 권한이 없습니다');
      } else if (statusCode == 404) {
        return Exception('$message: 요청한 리소스를 찾을 수 없습니다');
      } else if (statusCode == 500) {
        return Exception('$message: 서버 내부 오류가 발생했습니다');
      }
    }
    return Exception('$message: ${e.message}');
  }
}
