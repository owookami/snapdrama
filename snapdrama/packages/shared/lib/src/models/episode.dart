import 'package:freezed_annotation/freezed_annotation.dart';

part 'episode.freezed.dart';
part 'episode.g.dart';

@freezed
abstract class Episode with _$Episode {
  const factory Episode({
    required String id,
    required String dramaId,
    required String title,
    required int episodeNumber,
    required int season,
    required String synopsis,
    required String thumbnailUrl,
    required DateTime airDate,
    String? duration,
  }) = _Episode;

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);
}
