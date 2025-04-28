// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drama.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Drama _$DramaFromJson(Map<String, dynamic> json) => _Drama(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      genreId: json['genreId'] as String,
      releaseYear: (json['releaseYear'] as num).toInt(),
      totalEpisodes: (json['totalEpisodes'] as num).toInt(),
    );

Map<String, dynamic> _$DramaToJson(_Drama instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'thumbnailUrl': instance.thumbnailUrl,
      'genreId': instance.genreId,
      'releaseYear': instance.releaseYear,
      'totalEpisodes': instance.totalEpisodes,
    };
