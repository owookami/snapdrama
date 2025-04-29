import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

part 'episode_model.freezed.dart';
part 'episode_model.g.dart';

/// 에피소드 정보를 위한 도메인 모델 클래스
@freezed
abstract class EpisodeModel with _$EpisodeModel {
  const factory EpisodeModel({
    required String id,
    required String dramaId,
    required String title,
    required int episodeNumber,
    required int season,
    required String synopsis,
    required String thumbnailUrl,
    required DateTime airDate,
    String? duration,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _EpisodeModel;

  factory EpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeModelFromJson(json);

  /// Episode 모델을 EpisodeModel로 변환하는 팩토리 메서드
  factory EpisodeModel.fromEpisode(Episode episode) {
    return EpisodeModel(
      id: episode.id,
      dramaId: episode.dramaId,
      title: episode.title,
      episodeNumber: episode.episodeNumber,
      season: episode.season,
      synopsis: episode.synopsis,
      thumbnailUrl: episode.thumbnailUrl,
      airDate: episode.airDate,
      duration: episode.duration,
    );
  }
}
