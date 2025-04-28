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
  int get releaseYear;
  int get totalEpisodes;

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
            (identical(other.releaseYear, releaseYear) ||
                other.releaseYear == releaseYear) &&
            (identical(other.totalEpisodes, totalEpisodes) ||
                other.totalEpisodes == totalEpisodes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description,
      thumbnailUrl, genreId, releaseYear, totalEpisodes);

  @override
  String toString() {
    return 'Drama(id: $id, title: $title, description: $description, thumbnailUrl: $thumbnailUrl, genreId: $genreId, releaseYear: $releaseYear, totalEpisodes: $totalEpisodes)';
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
      int releaseYear,
      int totalEpisodes});
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
    Object? releaseYear = null,
    Object? totalEpisodes = null,
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
      releaseYear: null == releaseYear
          ? _self.releaseYear
          : releaseYear // ignore: cast_nullable_to_non_nullable
              as int,
      totalEpisodes: null == totalEpisodes
          ? _self.totalEpisodes
          : totalEpisodes // ignore: cast_nullable_to_non_nullable
              as int,
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
      required this.releaseYear,
      required this.totalEpisodes});
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
  final int releaseYear;
  @override
  final int totalEpisodes;

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
            (identical(other.releaseYear, releaseYear) ||
                other.releaseYear == releaseYear) &&
            (identical(other.totalEpisodes, totalEpisodes) ||
                other.totalEpisodes == totalEpisodes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description,
      thumbnailUrl, genreId, releaseYear, totalEpisodes);

  @override
  String toString() {
    return 'Drama(id: $id, title: $title, description: $description, thumbnailUrl: $thumbnailUrl, genreId: $genreId, releaseYear: $releaseYear, totalEpisodes: $totalEpisodes)';
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
      int releaseYear,
      int totalEpisodes});
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
    Object? releaseYear = null,
    Object? totalEpisodes = null,
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
      releaseYear: null == releaseYear
          ? _self.releaseYear
          : releaseYear // ignore: cast_nullable_to_non_nullable
              as int,
      totalEpisodes: null == totalEpisodes
          ? _self.totalEpisodes
          : totalEpisodes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
