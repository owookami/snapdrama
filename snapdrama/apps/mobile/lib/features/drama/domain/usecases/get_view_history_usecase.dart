import 'package:shared/shared.dart';

import '../repositories/view_history_repository.dart';

/// 사용자의 모든 감상 기록을 가져오는 유스케이스
class GetAllViewHistoryUseCase {
  final ViewHistoryRepository _repository;

  /// 생성자
  GetAllViewHistoryUseCase(this._repository);

  /// 실행 메서드
  Future<List<ViewHistory>> execute(String userId) {
    return _repository.getAllViewHistory(userId);
  }
}

/// 특정 에피소드에 대한 감상 기록을 가져오는 유스케이스
class GetViewHistoryByEpisodeUseCase {
  final ViewHistoryRepository _repository;

  /// 생성자
  GetViewHistoryByEpisodeUseCase(this._repository);

  /// 실행 메서드
  Future<ViewHistory?> execute(String userId, String episodeId) {
    return _repository.getViewHistoryByEpisode(userId, episodeId);
  }
}

/// 특정 드라마에 대한 감상 기록을 가져오는 유스케이스
class GetViewHistoryByDramaUseCase {
  final ViewHistoryRepository _repository;

  /// 생성자
  GetViewHistoryByDramaUseCase(this._repository);

  /// 실행 메서드
  Future<List<ViewHistory>> execute(String userId, String dramaId) {
    return _repository.getViewHistoryByDrama(userId, dramaId);
  }
}

/// 최근 감상 기록을 가져오는 유스케이스
class GetRecentViewHistoryUseCase {
  final ViewHistoryRepository _repository;

  /// 생성자
  GetRecentViewHistoryUseCase(this._repository);

  /// 실행 메서드
  Future<List<ViewHistory>> execute(String userId, {int limit = 10}) {
    return _repository.getRecentViewHistory(userId, limit: limit);
  }
}

/// 완료된 감상 기록을 가져오는 유스케이스
class GetCompletedViewHistoryUseCase {
  final ViewHistoryRepository _repository;

  /// 생성자
  GetCompletedViewHistoryUseCase(this._repository);

  /// 실행 메서드
  Future<List<ViewHistory>> execute(String userId) {
    return _repository.getCompletedViewHistory(userId);
  }
}

/// 진행 중인 감상 기록을 가져오는 유스케이스
class GetInProgressViewHistoryUseCase {
  final ViewHistoryRepository _repository;

  /// 생성자
  GetInProgressViewHistoryUseCase(this._repository);

  /// 실행 메서드
  Future<List<ViewHistory>> execute(String userId) {
    return _repository.getInProgressViewHistory(userId);
  }
}
