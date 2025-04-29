import 'package:uuid/uuid.dart';
import 'package:shared/shared.dart';

import '../repositories/view_history_repository.dart';

/// 새로운 감상 기록을 생성하는 유스케이스
class CreateViewHistoryUseCase {
  final ViewHistoryRepository _repository;
  final Uuid _uuid = const Uuid();

  /// 생성자
  CreateViewHistoryUseCase(this._repository);

  /// 실행 메서드
  ///
  /// [userId] - 사용자 ID
  /// [episodeId] - 에피소드 ID
  /// [dramaId] - 드라마 ID (옵션)
  /// [totalDuration] - 에피소드 전체 길이 (초)
  /// [initialPosition] - 초기 시청 위치 (초, 기본값: 0)
  Future<ViewHistory> execute({
    required String userId,
    required String episodeId,
    String? dramaId,
    required int totalDuration,
    int initialPosition = 0,
  }) async {
    // 이미 존재하는 기록이 있는지 확인
    final existingHistory = await _repository.getViewHistoryByEpisode(
      userId,
      episodeId,
    );

    // 기존 기록이 있으면 업데이트
    if (existingHistory != null) {
      return existingHistory;
    }

    // 새 감상 기록 생성
    final newViewHistory = ViewHistory(
      id: _uuid.v4(),
      userId: userId,
      dramaId: dramaId,
      episodeId: episodeId,
      watchedDuration: initialPosition,
      totalDuration: totalDuration,
      progressPercentage:
          initialPosition > 0 ? initialPosition / totalDuration : 0.0,
      lastWatchedAt: DateTime.now(),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      isCompleted: false,
    );

    // 저장
    return _repository.saveViewHistory(newViewHistory);
  }
}
