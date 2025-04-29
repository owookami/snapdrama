import 'package:shared/shared.dart';

import '../../domain/repositories/view_history_repository.dart';

/// 감상 기록을 저장하는 유스케이스
class SaveViewHistoryUseCase {
  final ViewHistoryRepository _repository;

  /// 생성자
  SaveViewHistoryUseCase(this._repository);

  /// 실행 메서드
  ///
  /// [viewHistory] - 저장할 감상 기록 모델
  Future<ViewHistory> execute(ViewHistory viewHistory) async {
    return await _repository.saveViewHistory(viewHistory);
  }
}

/// 감상 기록을 삭제하는 유스케이스
class DeleteViewHistoryUseCase {
  final ViewHistoryRepository _repository;

  /// 생성자
  DeleteViewHistoryUseCase(this._repository);

  /// 실행 메서드
  ///
  /// [id] - 삭제할 감상 기록 ID
  Future<bool> execute(String id) async {
    return await _repository.deleteViewHistory(id);
  }
}

/// 감상 기록을 업데이트하는 유스케이스
class UpdateViewProgressUseCase {
  final ViewHistoryRepository _repository;

  /// 생성자
  UpdateViewProgressUseCase(this._repository);

  /// 실행 메서드
  ///
  /// [viewHistory] - 업데이트할 감상 기록 모델
  /// [watchedDuration] - 시청한 시간 (초)
  /// [totalDuration] - 전체 시간 (초)
  Future<ViewHistory> execute({
    required ViewHistory viewHistory,
    required int watchedDuration,
    required int totalDuration,
  }) async {
    final progressPercentage = (watchedDuration / totalDuration) * 100;
    final isCompleted = progressPercentage >= 95;

    final updatedViewHistory = ViewHistory(
      id: viewHistory.id,
      userId: viewHistory.userId,
      dramaId: viewHistory.dramaId,
      episodeId: viewHistory.episodeId,
      watchedDuration: watchedDuration,
      totalDuration: totalDuration,
      progressPercentage: progressPercentage,
      isCompleted: isCompleted,
      lastWatchedAt: DateTime.now(),
      createdAt: viewHistory.createdAt,
      updatedAt: DateTime.now(),
    );

    return await _repository.saveViewHistory(updatedViewHistory);
  }
}
