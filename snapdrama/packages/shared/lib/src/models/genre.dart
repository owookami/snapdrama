import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre.freezed.dart';
part 'genre.g.dart';

/// 장르 정보를 위한 모델 클래스
@Freezed(makeCollectionsUnmodifiable: false)
abstract class Genre with _$Genre {
  const factory Genre({
    required String id,
    required String name,
    String? description,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}
