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
      rating: (json['rating'] as num).toDouble(),
      releaseYear: (json['releaseYear'] as num).toInt(),
      totalEpisodes: (json['totalEpisodes'] as num).toInt(),
      totalSeasons: (json['totalSeasons'] as num).toInt(),
      country: json['country'] as String,
      posterUrl: json['posterUrl'] as String?,
      bannerUrl: json['bannerUrl'] as String?,
      studio: json['studio'] as String?,
      director: json['director'] as String?,
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      cast: (json['cast'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DramaToJson(_Drama instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'thumbnailUrl': instance.thumbnailUrl,
      'genreId': instance.genreId,
      'rating': instance.rating,
      'releaseYear': instance.releaseYear,
      'totalEpisodes': instance.totalEpisodes,
      'totalSeasons': instance.totalSeasons,
      'country': instance.country,
      'posterUrl': instance.posterUrl,
      'bannerUrl': instance.bannerUrl,
      'studio': instance.studio,
      'director': instance.director,
      'genres': instance.genres,
      'cast': instance.cast,
    };
