import 'dart:convert';
import 'package:shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'view_history_local_datasource.dart';

/// 시청 기록 로컬 데이터 소스 구현 클래스
class ViewHistoryLocalDataSourceImpl implements ViewHistoryLocalDataSource {
  final SharedPreferences _prefs;
  static const String _viewHistoryPrefix = 'view_history_';
  static const String _lastSyncKey = 'last_view_history_sync';

  ViewHistoryLocalDataSourceImpl({required SharedPreferences prefs})
      : _prefs = prefs;

  /// 사용자별 시청 기록 키를 생성합니다.
  String _getUserViewHistoryKey(String userId) =>
      '${_viewHistoryPrefix}$userId';

  /// 에피소드별 시청 기록 키를 생성합니다.
  String _getEpisodeViewHistoryKey(String userId, String episodeId) =>
      '${_viewHistoryPrefix}${userId}_$episodeId';

  /// 드라마별 시청 기록 키를 생성합니다.
  String _getDramaViewHistoryKey(String userId, String dramaId) =>
      '${_viewHistoryPrefix}${userId}_drama_$dramaId';

  /// JSON 문자열을 ViewHistory 객체로 변환합니다.
  ViewHistory _fromJson(String jsonString) {
    final Map<String, dynamic> json =
        jsonDecode(jsonString) as Map<String, dynamic>;
    return ViewHistory.fromJson(json);
  }

  /// ViewHistory 객체를 JSON 문자열로 변환합니다.
  String _toJson(ViewHistory viewHistory) => json.encode(viewHistory.toJson());

  /// 시청 기록 목록을 가져옵니다.
  List<ViewHistory> _getViewHistories(String key) {
    final jsonStrings = _prefs.getStringList(key) ?? [];
    return jsonStrings.map(_fromJson).toList();
  }

  /// 시청 기록 목록을 저장합니다.
  Future<bool> _saveViewHistories(String key, List<ViewHistory> viewHistories) {
    final jsonStrings = viewHistories.map((vh) => _toJson(vh)).toList();
    return _prefs.setStringList(key, jsonStrings);
  }

  @override
  Future<List<ViewHistory>> getAllViewHistory(String userId) async {
    return _getViewHistories(_getUserViewHistoryKey(userId));
  }

  @override
  Future<ViewHistory?> getViewHistoryByEpisode(
      String userId, String episodeId) async {
    final viewHistories = await getAllViewHistory(userId);
    for (final vh in viewHistories) {
      if (vh.episodeId == episodeId) {
        return vh;
      }
    }
    return null;
  }

  @override
  Future<List<ViewHistory>> getViewHistoryByDrama(
      String userId, String dramaId) async {
    final viewHistories = await getAllViewHistory(userId);
    return viewHistories.where((vh) => vh.dramaId == dramaId).toList();
  }

  @override
  Future<ViewHistory> saveViewHistory(ViewHistory viewHistory) async {
    final userId = viewHistory.userId;
    final key = _getUserViewHistoryKey(userId);

    // 기존 기록 가져오기
    final viewHistories = await getAllViewHistory(userId);

    // 기존 기록 중에 같은 에피소드에 대한 기록이 있는지 확인하고 업데이트 또는 추가
    final existingIndex =
        viewHistories.indexWhere((vh) => vh.episodeId == viewHistory.episodeId);

    if (existingIndex >= 0) {
      viewHistories[existingIndex] = viewHistory;
    } else {
      viewHistories.add(viewHistory);
    }

    // 저장하기
    await _saveViewHistories(key, viewHistories);
    return viewHistory;
  }

  @override
  Future<void> deleteViewHistory(String id) async {
    // 모든 사용자 키를 가져옵니다 (실제 구현에서는 현재 로그인한 사용자 키만 사용)
    final keys = _prefs
        .getKeys()
        .where((key) => key.startsWith(_viewHistoryPrefix))
        .toList();

    for (final key in keys) {
      final viewHistories = _getViewHistories(key);
      final filtered = viewHistories.where((vh) => vh.id != id).toList();

      if (viewHistories.length != filtered.length) {
        await _saveViewHistories(key, filtered);
      }
    }
  }

  @override
  Future<List<ViewHistory>> getRecentViewHistory(String userId,
      {int limit = 10}) async {
    final viewHistories = await getAllViewHistory(userId);

    // 마지막 시청 시간으로 정렬하고 제한된 수만큼 반환
    viewHistories.sort((a, b) => b.lastWatchedAt.compareTo(a.lastWatchedAt));
    return viewHistories.take(limit).toList();
  }

  @override
  Future<List<ViewHistory>> getCompletedViewHistory(String userId) async {
    final viewHistories = await getAllViewHistory(userId);
    return viewHistories.where((vh) => vh.isCompleted).toList();
  }

  @override
  Future<List<ViewHistory>> getInProgressViewHistory(String userId) async {
    final viewHistories = await getAllViewHistory(userId);
    return viewHistories.where((vh) => !vh.isCompleted).toList();
  }

  @override
  Future<void> clearAllViewHistory() async {
    final keys = _prefs
        .getKeys()
        .where((key) => key.startsWith(_viewHistoryPrefix))
        .toList();

    for (final key in keys) {
      await _prefs.remove(key);
    }
  }

  @override
  Future<void> syncViewHistory(List<ViewHistory> remoteViewHistories) async {
    if (remoteViewHistories.isEmpty) return;

    // 사용자 ID별로 그룹화
    final Map<String, List<ViewHistory>> groupedByUser = {};

    for (final vh in remoteViewHistories) {
      final userId = vh.userId;
      groupedByUser[userId] ??= [];
      groupedByUser[userId]!.add(vh);
    }

    // 각 사용자별로 기록 동기화
    for (final userId in groupedByUser.keys) {
      final remoteHistories = groupedByUser[userId]!;
      final localHistories = await getAllViewHistory(userId);

      final mergedHistories =
          _mergeViewHistories(localHistories, remoteHistories);
      await _saveViewHistories(_getUserViewHistoryKey(userId), mergedHistories);
    }

    // 마지막 동기화 시간 업데이트
    await _prefs.setString(_lastSyncKey, DateTime.now().toIso8601String());
  }

  /// 로컬 기록과 원격 기록을 병합합니다. 충돌 시 더 최근에 업데이트된 기록을 유지합니다.
  List<ViewHistory> _mergeViewHistories(
    List<ViewHistory> localHistories,
    List<ViewHistory> remoteHistories,
  ) {
    final Map<String, ViewHistory> merged = {};

    // 로컬 기록 추가
    for (final vh in localHistories) {
      merged[vh.id] = vh;
    }

    // 원격 기록 병합
    for (final vh in remoteHistories) {
      final localVh = merged[vh.id];

      if (localVh == null) {
        // 로컬에 없는 기록이면 추가
        merged[vh.id] = vh;
      } else {
        // 로컬에 있는 기록이면 업데이트 시간 비교
        final localUpdatedAt = localVh.updatedAt ?? localVh.lastWatchedAt;
        final remoteUpdatedAt = vh.updatedAt ?? vh.lastWatchedAt;

        if (remoteUpdatedAt.isAfter(localUpdatedAt)) {
          merged[vh.id] = vh;
        }
      }
    }

    return merged.values.toList();
  }
}
