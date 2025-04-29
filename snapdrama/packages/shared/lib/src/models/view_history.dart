import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_history.freezed.dart';
part 'view_history.g.dart';

/// 사용자의 콘텐츠 감상 기록을 위한 모델 클래스
@freezed
abstract class ViewHistory with _$ViewHistory {
  const ViewHistory._();

  const factory ViewHistory({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'drama_id') String? dramaId,
    @JsonKey(name: 'episode_id') required String episodeId,
    @JsonKey(name: 'watched_duration') required int watchedDuration,
    @JsonKey(name: 'total_duration') required int totalDuration,
    @JsonKey(name: 'progress_percentage') required double progressPercentage,
    @JsonKey(name: 'last_watched_at') required DateTime lastWatchedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'is_completed') @Default(false) bool isCompleted,
  }) = _ViewHistory;

  factory ViewHistory.fromJson(Map<String, dynamic> json) =>
      _$ViewHistoryFromJson(json);

  /// 감상 진행률 계산 (%) - 정수 형태로 반환
  int get progressPercent => (progressPercentage * 100).round();

  /// 남은 시간 계산 (초)
  int get remainingDuration => totalDuration - watchedDuration;

  /// 완료 여부 확인 - 95% 이상 시청했을 경우 완료로 간주
  bool get isEffectivelyCompleted => progressPercentage >= 0.95;

  /// 시청 시간을 분:초 형식으로 포맷팅
  String get formattedWatchedDuration {
    final minutes = watchedDuration ~/ 60;
    final seconds = watchedDuration % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  /// 총 시간을 분:초 형식으로 포맷팅
  String get formattedTotalDuration {
    final minutes = totalDuration ~/ 60;
    final seconds = totalDuration % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}
