import 'package:freezed_annotation/freezed_annotation.dart';

part 'drama.freezed.dart';
part 'drama.g.dart';

@freezed
abstract class Drama with _$Drama {
  const factory Drama({
    required String id,
    required String title,
    required String description,
    required String thumbnailUrl,
    required String genreId,
    required double rating,
    required int releaseYear,
    required int totalEpisodes,
    required int totalSeasons,
    required String country,
    String? posterUrl,
    String? bannerUrl,
    String? studio,
    String? director,
    List<String>? genres,
    List<String>? cast,
  }) = _Drama;

  factory Drama.fromJson(Map<String, dynamic> json) => _$DramaFromJson(json);
}
