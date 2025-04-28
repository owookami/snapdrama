// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Episode _$EpisodeFromJson(Map<String, dynamic> json) => _Episode(
      id: json['id'] as String,
      dramaId: json['dramaId'] as String,
      title: json['title'] as String,
      episodeNumber: (json['episodeNumber'] as num).toInt(),
      season: (json['season'] as num).toInt(),
      synopsis: json['synopsis'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      airDate: DateTime.parse(json['airDate'] as String),
      duration: json['duration'] as String?,
    );

Map<String, dynamic> _$EpisodeToJson(_Episode instance) => <String, dynamic>{
      'id': instance.id,
      'dramaId': instance.dramaId,
      'title': instance.title,
      'episodeNumber': instance.episodeNumber,
      'season': instance.season,
      'synopsis': instance.synopsis,
      'thumbnailUrl': instance.thumbnailUrl,
      'airDate': instance.airDate.toIso8601String(),
      'duration': instance.duration,
    };
