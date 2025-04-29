import 'package:dio/dio.dart';
import 'package:shared/shared.dart';

import 'drama_remote_data_source.dart';
import '../../../../core/utils/api_client.dart';
import '../../../../core/constants/api_constants.dart';

/// 드라마 원격 데이터 소스 구현 클래스
class DramaRemoteDataSourceImpl implements DramaRemoteDataSource {
  final ApiClient _apiClient;

  /// 생성자
  DramaRemoteDataSourceImpl(this._apiClient);

  @override
  Future<List<Drama>> getAllDramas() async {
    try {
      final response = await _apiClient.get(ApiConstants.dramas);
      final apiResponse = ApiResponse<List<dynamic>>.fromJson(
        response.data,
        (json) => (json as List).map((item) => Drama.fromJson(item)).toList(),
      );
      return apiResponse.data?.cast<Drama>() ?? [];
    } on DioException catch (e) {
      throw _handleError(e);
    } catch (e) {
      throw Exception('드라마 목록을 불러오는데 실패했습니다: $e');
    }
  }

  @override
  Future<Drama> getDramaById(String id) async {
    try {
      final response = await _apiClient.get('${ApiConstants.dramas}/$id');
      final apiResponse = ApiResponse<Drama>.fromJson(
        response.data,
        (json) => Drama.fromJson(json as Map<String, dynamic>),
      );
      return apiResponse.data ?? (throw Exception('드라마 정보를 찾을 수 없습니다'));
    } on DioException catch (e) {
      throw _handleError(e);
    } catch (e) {
      throw Exception('드라마 정보를 불러오는데 실패했습니다: $e');
    }
  }

  @override
  Future<List<Drama>> getDramasByGenre(String genreId) async {
    try {
      final response = await _apiClient.get(
        ApiConstants.dramas,
        queryParameters: {'genre_id': genreId},
      );
      final apiResponse = ApiResponse<List<dynamic>>.fromJson(
        response.data,
        (json) => (json as List).map((item) => Drama.fromJson(item)).toList(),
      );
      return apiResponse.data?.cast<Drama>() ?? [];
    } on DioException catch (e) {
      throw _handleError(e);
    } catch (e) {
      throw Exception('장르별 드라마 목록을 불러오는데 실패했습니다: $e');
    }
  }

  @override
  Future<Episode> getEpisodeById(String episodeId) async {
    try {
      final response =
          await _apiClient.get('${ApiConstants.episodes}/$episodeId');
      final apiResponse = ApiResponse<Episode>.fromJson(
        response.data,
        (json) => Episode.fromJson(json as Map<String, dynamic>),
      );
      return apiResponse.data ?? (throw Exception('에피소드 정보를 찾을 수 없습니다'));
    } on DioException catch (e) {
      throw _handleError(e);
    } catch (e) {
      throw Exception('에피소드 정보를 불러오는데 실패했습니다: $e');
    }
  }

  @override
  Future<List<Episode>> getEpisodesByDramaId(String dramaId) async {
    try {
      final response = await _apiClient.get(
        ApiConstants.episodes,
        queryParameters: {'drama_id': dramaId},
      );
      final apiResponse = ApiResponse<List<dynamic>>.fromJson(
        response.data,
        (json) => (json as List).map((item) => Episode.fromJson(item)).toList(),
      );
      return apiResponse.data?.cast<Episode>() ?? [];
    } on DioException catch (e) {
      throw _handleError(e);
    } catch (e) {
      throw Exception('에피소드 목록을 불러오는데 실패했습니다: $e');
    }
  }

  @override
  Future<List<Drama>> getLatestDramas({int limit = 10}) async {
    try {
      final response = await _apiClient.get(
        ApiConstants.dramas,
        queryParameters: {'sort': 'latest', 'limit': limit},
      );
      final apiResponse = ApiResponse<List<dynamic>>.fromJson(
        response.data,
        (json) => (json as List).map((item) => Drama.fromJson(item)).toList(),
      );
      return apiResponse.data?.cast<Drama>() ?? [];
    } on DioException catch (e) {
      throw _handleError(e);
    } catch (e) {
      throw Exception('최신 드라마 목록을 불러오는데 실패했습니다: $e');
    }
  }

  @override
  Future<List<Drama>> getPopularDramas({int limit = 10}) async {
    try {
      final response = await _apiClient.get(
        ApiConstants.dramas,
        queryParameters: {'sort': 'popular', 'limit': limit},
      );
      final apiResponse = ApiResponse<List<dynamic>>.fromJson(
        response.data,
        (json) => (json as List).map((item) => Drama.fromJson(item)).toList(),
      );
      return apiResponse.data?.cast<Drama>() ?? [];
    } on DioException catch (e) {
      throw _handleError(e);
    } catch (e) {
      throw Exception('인기 드라마 목록을 불러오는데 실패했습니다: $e');
    }
  }

  @override
  Future<List<Drama>> searchDramas(String query) async {
    try {
      final response = await _apiClient.get(
        ApiConstants.dramas,
        queryParameters: {'query': query},
      );
      final apiResponse = ApiResponse<List<dynamic>>.fromJson(
        response.data,
        (json) => (json as List).map((item) => Drama.fromJson(item)).toList(),
      );
      return apiResponse.data?.cast<Drama>() ?? [];
    } on DioException catch (e) {
      throw _handleError(e);
    } catch (e) {
      throw Exception('드라마 검색에 실패했습니다: $e');
    }
  }

  /// API 오류 처리
  Exception _handleError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      return Exception('서버 연결 시간이 초과되었습니다. 네트워크 연결을 확인해주세요.');
    } else if (e.response != null) {
      final statusCode = e.response?.statusCode;
      if (statusCode == 404) {
        return Exception('요청한 정보를 찾을 수 없습니다.');
      } else if (statusCode == 401 || statusCode == 403) {
        return Exception('접근 권한이 없습니다.');
      } else {
        return Exception('서버 오류가 발생했습니다: ${e.response?.statusCode}');
      }
    } else {
      return Exception('네트워크 오류가 발생했습니다: ${e.message}');
    }
  }
}
