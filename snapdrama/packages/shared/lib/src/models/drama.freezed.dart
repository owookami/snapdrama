// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drama.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Drama {
  String get id;
  String get title;
  String get description;
  String get thumbnailUrl;
  String get genreId;
  double get rating;
  int get releaseYear;
  int get totalEpisodes;
  int get totalSeasons;
  String get country;
  String? get posterUrl;
  String? get bannerUrl;
  String? get studio;
  String? get director;
  List<String>? get genres;
  List<String>? get cast;

  /// Create a copy of Drama
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DramaCopyWith<Drama> get copyWith =>
      _$DramaCopyWithImpl<Drama>(this as Drama, _$identity);

  /// Serializes this Drama to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Drama &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.genreId, genreId) || other.genreId == genreId) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.releaseYear, releaseYear) ||
                other.releaseYear == releaseYear) &&
            (identical(other.totalEpisodes, totalEpisodes) ||
                other.totalEpisodes == totalEpisodes) &&
            (identical(other.totalSeasons, totalSeasons) ||
                other.totalSeasons == totalSeasons) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.posterUrl, posterUrl) ||
                other.posterUrl == posterUrl) &&
            (identical(other.bannerUrl, bannerUrl) ||
                other.bannerUrl == bannerUrl) &&
            (identical(other.studio, studio) || other.studio == studio) &&
            (identical(other.director, director) ||
                other.director == director) &&
            const DeepCollectionEquality().equals(other.genres, genres) &&
            const DeepCollectionEquality().equals(other.cast, cast));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      thumbnailUrl,
      genreId,
      rating,
      releaseYear,
      totalEpisodes,
      totalSeasons,
      country,
      posterUrl,
      bannerUrl,
      studio,
      director,
      const DeepCollectionEquality().hash(genres),
      const DeepCollectionEquality().hash(cast));

  @override
  String toString() {
    return 'Drama(id: $id, title: $title, description: $description, thumbnailUrl: $thumbnailUrl, genreId: $genreId, rating: $rating, releaseYear: $releaseYear, totalEpisodes: $totalEpisodes, totalSeasons: $totalSeasons, country: $country, posterUrl: $posterUrl, bannerUrl: $bannerUrl, studio: $studio, director: $director, genres: $genres, cast: $cast)';
  }
}

/// @nodoc
abstract mixin class $DramaCopyWith<$Res> {
  factory $DramaCopyWith(Drama value, $Res Function(Drama) _then) =
      _$DramaCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String thumbnailUrl,
      String genreId,
      double rating,
      int releaseYear,
      int totalEpisodes,
      int totalSeasons,
      String country,
      String? posterUrl,
      String? bannerUrl,
      String? studio,
      String? director,
      List<String>? genres,
      List<String>? cast});
}

/// @nodoc
class _$DramaCopyWithImpl<$Res> implements $DramaCopyWith<$Res> {
  _$DramaCopyWithImpl(this._self, this._then);

  final Drama _self;
  final $Res Function(Drama) _then;

  /// Create a copy of Drama
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? thumbnailUrl = null,
    Object? genreId = null,
    Object? rating = null,
    Object? releaseYear = null,
    Object? totalEpisodes = null,
    Object? totalSeasons = null,
    Object? country = null,
    Object? posterUrl = freezed,
    Object? bannerUrl = freezed,
    Object? studio = freezed,
    Object? director = freezed,
    Object? genres = freezed,
    Object? cast = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _self.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      genreId: null == genreId
          ? _self.genreId
          : genreId // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      releaseYear: null == releaseYear
          ? _self.releaseYear
          : releaseYear // ignore: cast_nullable_to_non_nullable
              as int,
      totalEpisodes: null == totalEpisodes
          ? _self.totalEpisodes
          : totalEpisodes // ignore: cast_nullable_to_non_nullable
              as int,
      totalSeasons: null == totalSeasons
          ? _self.totalSeasons
          : totalSeasons // ignore: cast_nullable_to_non_nullable
              as int,
      country: null == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      posterUrl: freezed == posterUrl
          ? _self.posterUrl
          : posterUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bannerUrl: freezed == bannerUrl
          ? _self.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      studio: freezed == studio
          ? _self.studio
          : studio // ignore: cast_nullable_to_non_nullable
              as String?,
      director: freezed == director
          ? _self.director
          : director // ignore: cast_nullable_to_non_nullable
              as String?,
      genres: freezed == genres
          ? _self.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      cast: freezed == cast
          ? _self.cast
          : cast // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Drama implements Drama {
  const _Drama(
      {required this.id,
      required this.title,
      required this.description,
      required this.thumbnailUrl,
      required this.genreId,
      required this.rating,
      required this.releaseYear,
      required this.totalEpisodes,
      required this.totalSeasons,
      required this.country,
      this.posterUrl,
      this.bannerUrl,
      this.studio,
      this.director,
      final List<String>? genres,
      final List<String>? cast})
      : _genres = genres,
        _cast = cast;
  factory _Drama.fromJson(Map<String, dynamic> json) => _$DramaFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String thumbnailUrl;
  @override
  final String genreId;
  @override
  final double rating;
  @override
  final int releaseYear;
  @override
  final int totalEpisodes;
  @override
  final int totalSeasons;
  @override
  final String country;
  @override
  final String? posterUrl;
  @override
  final String? bannerUrl;
  @override
  final String? studio;
  @override
  final String? director;
  final List<String>? _genres;
  @override
  List<String>? get genres {
    final value = _genres;
    if (value == null) return null;
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _cast;
  @override
  List<String>? get cast {
    final value = _cast;
    if (value == null) return null;
    if (_cast is EqualUnmodifiableListView) return _cast;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of Drama
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DramaCopyWith<_Drama> get copyWith =>
      __$DramaCopyWithImpl<_Drama>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DramaToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Drama &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.genreId, genreId) || other.genreId == genreId) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.releaseYear, releaseYear) ||
                other.releaseYear == releaseYear) &&
            (identical(other.totalEpisodes, totalEpisodes) ||
                other.totalEpisodes == totalEpisodes) &&
            (identical(other.totalSeasons, totalSeasons) ||
                other.totalSeasons == totalSeasons) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.posterUrl, posterUrl) ||
                other.posterUrl == posterUrl) &&
            (identical(other.bannerUrl, bannerUrl) ||
                other.bannerUrl == bannerUrl) &&
            (identical(other.studio, studio) || other.studio == studio) &&
            (identical(other.director, director) ||
                other.director == director) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            const DeepCollectionEquality().equals(other._cast, _cast));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      thumbnailUrl,
      genreId,
      rating,
      releaseYear,
      totalEpisodes,
      totalSeasons,
      country,
      posterUrl,
      bannerUrl,
      studio,
      director,
      const DeepCollectionEquality().hash(_genres),
      const DeepCollectionEquality().hash(_cast));

  @override
  String toString() {
    return 'Drama(id: $id, title: $title, description: $description, thumbnailUrl: $thumbnailUrl, genreId: $genreId, rating: $rating, releaseYear: $releaseYear, totalEpisodes: $totalEpisodes, totalSeasons: $totalSeasons, country: $country, posterUrl: $posterUrl, bannerUrl: $bannerUrl, studio: $studio, director: $director, genres: $genres, cast: $cast)';
  }
}

/// @nodoc
abstract mixin class _$DramaCopyWith<$Res> implements $DramaCopyWith<$Res> {
  factory _$DramaCopyWith(_Drama value, $Res Function(_Drama) _then) =
      __$DramaCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String thumbnailUrl,
      String genreId,
      double rating,
      int releaseYear,
      int totalEpisodes,
      int totalSeasons,
      String country,
      String? posterUrl,
      String? bannerUrl,
      String? studio,
      String? director,
      List<String>? genres,
      List<String>? cast});
}

/// @nodoc
class __$DramaCopyWithImpl<$Res> implements _$DramaCopyWith<$Res> {
  __$DramaCopyWithImpl(this._self, this._then);

  final _Drama _self;
  final $Res Function(_Drama) _then;

  /// Create a copy of Drama
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? thumbnailUrl = null,
    Object? genreId = null,
    Object? rating = null,
    Object? releaseYear = null,
    Object? totalEpisodes = null,
    Object? totalSeasons = null,
    Object? country = null,
    Object? posterUrl = freezed,
    Object? bannerUrl = freezed,
    Object? studio = freezed,
    Object? director = freezed,
    Object? genres = freezed,
    Object? cast = freezed,
  }) {
    return _then(_Drama(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _self.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      genreId: null == genreId
          ? _self.genreId
          : genreId // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      releaseYear: null == releaseYear
          ? _self.releaseYear
          : releaseYear // ignore: cast_nullable_to_non_nullable
              as int,
      totalEpisodes: null == totalEpisodes
          ? _self.totalEpisodes
          : totalEpisodes // ignore: cast_nullable_to_non_nullable
              as int,
      totalSeasons: null == totalSeasons
          ? _self.totalSeasons
          : totalSeasons // ignore: cast_nullable_to_non_nullable
              as int,
      country: null == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      posterUrl: freezed == posterUrl
          ? _self.posterUrl
          : posterUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bannerUrl: freezed == bannerUrl
          ? _self.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      studio: freezed == studio
          ? _self.studio
          : studio // ignore: cast_nullable_to_non_nullable
              as String?,
      director: freezed == director
          ? _self.director
          : director // ignore: cast_nullable_to_non_nullable
              as String?,
      genres: freezed == genres
          ? _self._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      cast: freezed == cast
          ? _self._cast
          : cast // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

// dart format on
