import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

part 'view_history_model.freezed.dart';
part 'view_history_model.g.dart';

/// 감상 기록을 위한 도메인 모델 클래스
@freezed
class ViewHistoryModel with _$ViewHistoryModel {
  const ViewHistoryModel._();

  const factory ViewHistoryModel({
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
  }) = _ViewHistoryModel;

  factory ViewHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$ViewHistoryModelFromJson(json);

  /// ViewHistory 모델을 ViewHistoryModel로 변환
  factory ViewHistoryModel.fromViewHistory(ViewHistory viewHistory) {
    return ViewHistoryModel(
      id: viewHistory.id,
      userId: viewHistory.userId,
      dramaId: viewHistory.dramaId,
      episodeId: viewHistory.episodeId,
      watchedDuration: viewHistory.watchedDuration,
      totalDuration: viewHistory.totalDuration,
      progressPercentage: viewHistory.progressPercentage,
      lastWatchedAt: viewHistory.lastWatchedAt,
      createdAt: viewHistory.createdAt,
      updatedAt: viewHistory.updatedAt,
      isCompleted: viewHistory.isCompleted,
    );
  }

  /// ViewHistoryModel을 ViewHistory로 변환
  ViewHistory toViewHistory() {
    return ViewHistory(
      id: id,
      userId: userId,
      dramaId: dramaId,
      episodeId: episodeId,
      watchedDuration: watchedDuration,
      totalDuration: totalDuration,
      progressPercentage: progressPercentage,
      lastWatchedAt: lastWatchedAt,
      createdAt: createdAt,
      updatedAt: updatedAt,
      isCompleted: isCompleted,
    );
  }

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

  /// 디버깅을 위한 문자열 표현
  @override
  String toString() {
    return 'ViewHistoryModel(id: $id, userId: $userId, dramaId: $dramaId, episodeId: $episodeId, '
        'watchedDuration: $watchedDuration, totalDuration: $totalDuration, '
        'progressPercentage: $progressPercentage, lastWatchedAt: $lastWatchedAt, '
        'createdAt: $createdAt, updatedAt: $updatedAt, isCompleted: $isCompleted)';
  }

  @override
  // TODO: implement createdAt
  DateTime? get createdAt => throw UnimplementedError();

  @override
  // TODO: implement dramaId
  String? get dramaId => throw UnimplementedError();

  @override
  // TODO: implement episodeId
  String get episodeId => throw UnimplementedError();

  @override
  // TODO: implement id
  String get id => throw UnimplementedError();

  @override
  // TODO: implement isCompleted
  bool get isCompleted => throw UnimplementedError();

  @override
  // TODO: implement lastWatchedAt
  DateTime get lastWatchedAt => throw UnimplementedError();

  @override
  // TODO: implement progressPercentage
  double get progressPercentage => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  // TODO: implement totalDuration
  int get totalDuration => throw UnimplementedError();

  @override
  // TODO: implement updatedAt
  DateTime? get updatedAt => throw UnimplementedError();

  @override
  // TODO: implement userId
  String get userId => throw UnimplementedError();

  @override
  // TODO: implement watchedDuration
  int get watchedDuration => throw UnimplementedError();
}
