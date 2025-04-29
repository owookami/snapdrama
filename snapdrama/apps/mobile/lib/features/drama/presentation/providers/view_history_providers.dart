import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/shared.dart';

import '../../../../core/utils/api_client.dart';
import '../../data/datasources/view_history_data_source.dart';
import '../../data/datasources/view_history_data_source_impl.dart';
import '../../data/repositories/view_history_repository_impl.dart';
import '../../domain/repositories/view_history_repository.dart';
import '../../domain/usecases/create_view_history_usecase.dart';
import '../../domain/usecases/get_view_history_usecase.dart';
import '../../domain/usecases/save_view_history_usecase.dart';

part 'view_history_providers.g.dart';

/// API 클라이언트 프로바이더
@riverpod
ApiClient apiClient(ApiClientRef ref) {
  return ApiClient();
}

/// 감상 기록 데이터 소스 프로바이더
@riverpod
ViewHistoryDataSource viewHistoryDataSource(ViewHistoryDataSourceRef ref) {
  final apiClient = ref.watch(apiClientProvider);
  return ViewHistoryDataSourceImpl(apiClient: apiClient);
}

/// 감상 기록 리포지토리 프로바이더
@riverpod
ViewHistoryRepository viewHistoryRepository(ViewHistoryRepositoryRef ref) {
  final dataSource = ref.watch(viewHistoryDataSourceProvider);
  return ViewHistoryRepositoryImpl(remoteDataSource: dataSource);
}

/// 모든 감상 기록 조회 유스케이스 프로바이더
@riverpod
GetAllViewHistoryUseCase getAllViewHistoryUseCase(
    GetAllViewHistoryUseCaseRef ref) {
  final repository = ref.watch(viewHistoryRepositoryProvider);
  return GetAllViewHistoryUseCase(repository);
}

/// 에피소드별 감상 기록 조회 유스케이스 프로바이더
@riverpod
GetViewHistoryByEpisodeUseCase getViewHistoryByEpisodeUseCase(
    GetViewHistoryByEpisodeUseCaseRef ref) {
  final repository = ref.watch(viewHistoryRepositoryProvider);
  return GetViewHistoryByEpisodeUseCase(repository);
}

/// 드라마별 감상 기록 조회 유스케이스 프로바이더
@riverpod
GetViewHistoryByDramaUseCase getViewHistoryByDramaUseCase(
    GetViewHistoryByDramaUseCaseRef ref) {
  final repository = ref.watch(viewHistoryRepositoryProvider);
  return GetViewHistoryByDramaUseCase(repository);
}

/// 최근 감상 기록 조회 유스케이스 프로바이더
@riverpod
GetRecentViewHistoryUseCase getRecentViewHistoryUseCase(
    GetRecentViewHistoryUseCaseRef ref) {
  final repository = ref.watch(viewHistoryRepositoryProvider);
  return GetRecentViewHistoryUseCase(repository);
}

/// 완료된 감상 기록 조회 유스케이스 프로바이더
@riverpod
GetCompletedViewHistoryUseCase getCompletedViewHistoryUseCase(
    GetCompletedViewHistoryUseCaseRef ref) {
  final repository = ref.watch(viewHistoryRepositoryProvider);
  return GetCompletedViewHistoryUseCase(repository);
}

/// 진행 중인 감상 기록 조회 유스케이스 프로바이더
@riverpod
GetInProgressViewHistoryUseCase getInProgressViewHistoryUseCase(
    GetInProgressViewHistoryUseCaseRef ref) {
  final repository = ref.watch(viewHistoryRepositoryProvider);
  return GetInProgressViewHistoryUseCase(repository);
}

/// 감상 기록 저장 유스케이스 프로바이더
@riverpod
SaveViewHistoryUseCase saveViewHistoryUseCase(SaveViewHistoryUseCaseRef ref) {
  final repository = ref.watch(viewHistoryRepositoryProvider);
  return SaveViewHistoryUseCase(repository);
}

/// 감상 기록 삭제 유스케이스 프로바이더
@riverpod
DeleteViewHistoryUseCase deleteViewHistoryUseCase(
    DeleteViewHistoryUseCaseRef ref) {
  final repository = ref.watch(viewHistoryRepositoryProvider);
  return DeleteViewHistoryUseCase(repository);
}

/// 감상 진행 업데이트 유스케이스 프로바이더
@riverpod
UpdateViewProgressUseCase updateViewProgressUseCase(
    UpdateViewProgressUseCaseRef ref) {
  final repository = ref.watch(viewHistoryRepositoryProvider);
  return UpdateViewProgressUseCase(repository);
}

/// 감상 기록 생성 유스케이스 프로바이더
@riverpod
CreateViewHistoryUseCase createViewHistoryUseCase(
    CreateViewHistoryUseCaseRef ref) {
  final repository = ref.watch(viewHistoryRepositoryProvider);
  return CreateViewHistoryUseCase(repository);
}

/// 특정 사용자의 모든 감상 기록 프로바이더
@riverpod
Future<List<ViewHistory>> userViewHistory(
    UserViewHistoryRef ref, String userId) async {
  final useCase = ref.watch(getAllViewHistoryUseCaseProvider);
  return useCase.execute(userId);
}

/// 특정 사용자의 최근 감상 기록 프로바이더
@riverpod
Future<List<ViewHistory>> userRecentViewHistory(
    UserRecentViewHistoryRef ref, String userId,
    {int limit = 10}) async {
  final useCase = ref.watch(getRecentViewHistoryUseCaseProvider);
  return useCase.execute(userId, limit: limit);
}

/// 특정 사용자의 완료된 감상 기록 프로바이더
@riverpod
Future<List<ViewHistory>> userCompletedViewHistory(
    UserCompletedViewHistoryRef ref, String userId) async {
  final useCase = ref.watch(getCompletedViewHistoryUseCaseProvider);
  return useCase.execute(userId);
}

/// 특정 사용자의 진행 중인 감상 기록 프로바이더
@riverpod
Future<List<ViewHistory>> userInProgressViewHistory(
    UserInProgressViewHistoryRef ref, String userId) async {
  final useCase = ref.watch(getInProgressViewHistoryUseCaseProvider);
  return useCase.execute(userId);
}

/// 에피소드별 감상 기록 프로바이더
@riverpod
Future<ViewHistory?> episodeViewHistory(
    EpisodeViewHistoryRef ref, String userId, String episodeId) async {
  final useCase = ref.watch(getViewHistoryByEpisodeUseCaseProvider);
  return useCase.execute(userId, episodeId);
}

/// 드라마별 감상 기록 프로바이더
@riverpod
Future<List<ViewHistory>> dramaViewHistory(
    DramaViewHistoryRef ref, String userId, String dramaId) async {
  final useCase = ref.watch(getViewHistoryByDramaUseCaseProvider);
  return useCase.execute(userId, dramaId);
}
