// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'episode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Episode {
  String get id;
  String get dramaId;
  String get title;
  int get episodeNumber;
  int get season;
  String get synopsis;
  String get thumbnailUrl;
  DateTime get airDate;
  String? get duration;

  /// Create a copy of Episode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EpisodeCopyWith<Episode> get copyWith =>
      _$EpisodeCopyWithImpl<Episode>(this as Episode, _$identity);

  /// Serializes this Episode to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Episode &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dramaId, dramaId) || other.dramaId == dramaId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.episodeNumber, episodeNumber) ||
                other.episodeNumber == episodeNumber) &&
            (identical(other.season, season) || other.season == season) &&
            (identical(other.synopsis, synopsis) ||
                other.synopsis == synopsis) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.airDate, airDate) || other.airDate == airDate) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, dramaId, title,
      episodeNumber, season, synopsis, thumbnailUrl, airDate, duration);

  @override
  String toString() {
    return 'Episode(id: $id, dramaId: $dramaId, title: $title, episodeNumber: $episodeNumber, season: $season, synopsis: $synopsis, thumbnailUrl: $thumbnailUrl, airDate: $airDate, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class $EpisodeCopyWith<$Res> {
  factory $EpisodeCopyWith(Episode value, $Res Function(Episode) _then) =
      _$EpisodeCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String dramaId,
      String title,
      int episodeNumber,
      int season,
      String synopsis,
      String thumbnailUrl,
      DateTime airDate,
      String? duration});
}

/// @nodoc
class _$EpisodeCopyWithImpl<$Res> implements $EpisodeCopyWith<$Res> {
  _$EpisodeCopyWithImpl(this._self, this._then);

  final Episode _self;
  final $Res Function(Episode) _then;

  /// Create a copy of Episode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dramaId = null,
    Object? title = null,
    Object? episodeNumber = null,
    Object? season = null,
    Object? synopsis = null,
    Object? thumbnailUrl = null,
    Object? airDate = null,
    Object? duration = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      dramaId: null == dramaId
          ? _self.dramaId
          : dramaId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      episodeNumber: null == episodeNumber
          ? _self.episodeNumber
          : episodeNumber // ignore: cast_nullable_to_non_nullable
              as int,
      season: null == season
          ? _self.season
          : season // ignore: cast_nullable_to_non_nullable
              as int,
      synopsis: null == synopsis
          ? _self.synopsis
          : synopsis // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _self.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      airDate: null == airDate
          ? _self.airDate
          : airDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: freezed == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Episode implements Episode {
  const _Episode(
      {required this.id,
      required this.dramaId,
      required this.title,
      required this.episodeNumber,
      required this.season,
      required this.synopsis,
      required this.thumbnailUrl,
      required this.airDate,
      this.duration});
  factory _Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);

  @override
  final String id;
  @override
  final String dramaId;
  @override
  final String title;
  @override
  final int episodeNumber;
  @override
  final int season;
  @override
  final String synopsis;
  @override
  final String thumbnailUrl;
  @override
  final DateTime airDate;
  @override
  final String? duration;

  /// Create a copy of Episode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EpisodeCopyWith<_Episode> get copyWith =>
      __$EpisodeCopyWithImpl<_Episode>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EpisodeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Episode &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dramaId, dramaId) || other.dramaId == dramaId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.episodeNumber, episodeNumber) ||
                other.episodeNumber == episodeNumber) &&
            (identical(other.season, season) || other.season == season) &&
            (identical(other.synopsis, synopsis) ||
                other.synopsis == synopsis) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.airDate, airDate) || other.airDate == airDate) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, dramaId, title,
      episodeNumber, season, synopsis, thumbnailUrl, airDate, duration);

  @override
  String toString() {
    return 'Episode(id: $id, dramaId: $dramaId, title: $title, episodeNumber: $episodeNumber, season: $season, synopsis: $synopsis, thumbnailUrl: $thumbnailUrl, airDate: $airDate, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class _$EpisodeCopyWith<$Res> implements $EpisodeCopyWith<$Res> {
  factory _$EpisodeCopyWith(_Episode value, $Res Function(_Episode) _then) =
      __$EpisodeCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String dramaId,
      String title,
      int episodeNumber,
      int season,
      String synopsis,
      String thumbnailUrl,
      DateTime airDate,
      String? duration});
}

/// @nodoc
class __$EpisodeCopyWithImpl<$Res> implements _$EpisodeCopyWith<$Res> {
  __$EpisodeCopyWithImpl(this._self, this._then);

  final _Episode _self;
  final $Res Function(_Episode) _then;

  /// Create a copy of Episode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? dramaId = null,
    Object? title = null,
    Object? episodeNumber = null,
    Object? season = null,
    Object? synopsis = null,
    Object? thumbnailUrl = null,
    Object? airDate = null,
    Object? duration = freezed,
  }) {
    return _then(_Episode(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      dramaId: null == dramaId
          ? _self.dramaId
          : dramaId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      episodeNumber: null == episodeNumber
          ? _self.episodeNumber
          : episodeNumber // ignore: cast_nullable_to_non_nullable
              as int,
      season: null == season
          ? _self.season
          : season // ignore: cast_nullable_to_non_nullable
              as int,
      synopsis: null == synopsis
          ? _self.synopsis
          : synopsis // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _self.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      airDate: null == airDate
          ? _self.airDate
          : airDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: freezed == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
