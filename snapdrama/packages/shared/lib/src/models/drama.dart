import 'package:freezed_annotation/freezed_annotation.dart';

part 'drama.freezed.dart';
part 'drama.g.dart';

@freezed
class Drama with _$Drama {
  const factory Drama({
    required String id,
    required String title,
    required String description,
    required String thumbnailUrl,
    required String genreId,
    required int releaseYear,
    required int totalEpisodes,
  }) = _Drama;

  factory Drama.fromJson(Map<String, dynamic> json) => _$DramaFromJson(json);

  @override
  // TODO: implement description
  String get description => throw UnimplementedError();

  @override
  // TODO: implement genreId
  String get genreId => throw UnimplementedError();

  @override
  // TODO: implement id
  String get id => throw UnimplementedError();

  @override
  // TODO: implement releaseYear
  int get releaseYear => throw UnimplementedError();

  @override
  // TODO: implement thumbnailUrl
  String get thumbnailUrl => throw UnimplementedError();

  @override
  // TODO: implement title
  String get title => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  // TODO: implement totalEpisodes
  int get totalEpisodes => throw UnimplementedError();
}
