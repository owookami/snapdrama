import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';
import 'episode_model.dart';

// Genre 클래스를 명시적으로 import
import 'package:shared/src/models/genre.dart';

part 'drama.freezed.dart';
part 'drama.g.dart';

/// 드라마 정보를 위한 도메인 모델 클래스
@freezed
abstract class DramaModel with _$DramaModel {
  const factory DramaModel({
    required String id,
    required String title,
    required String description,
    required String posterUrl,
    required String bannerUrl,
    required String country,
    required int releaseYear,
    required double rating,
    required bool isPublic,
    @JsonKey(
      fromJson: _genreFromJson,
      toJson: _genreToJson,
    )
    required Genre genre,
    List<EpisodeModel>? episodes,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _DramaModel;

  factory DramaModel.fromJson(Map<String, dynamic> json) =>
      _$DramaModelFromJson(json);

  /// Drama 모델을 DramaModel로 변환하는 팩토리 메서드
  factory DramaModel.fromDrama(Drama drama) {
    return DramaModel(
      id: drama.id,
      title: drama.title,
      description: drama.description ?? '',
      posterUrl: drama.posterUrl ?? '',
      bannerUrl: drama.bannerUrl ?? '',
      country: drama.country ?? '',
      releaseYear: drama.releaseYear ?? 0,
      rating: drama.rating ?? 0.0,
      isPublic: drama.isPublic ?? false,
      genre: drama.genre ?? const Genre(id: '', name: ''),
      createdAt: drama.createdAt,
      updatedAt: drama.updatedAt,
    );
  }
}

/// Genre 객체를 JSON으로 변환
Map<String, dynamic> _genreToJson(Genre genre) => genre.toJson();

/// JSON에서 Genre 객체로 변환
Genre _genreFromJson(Map<String, dynamic> json) => Genre.fromJson(json);
