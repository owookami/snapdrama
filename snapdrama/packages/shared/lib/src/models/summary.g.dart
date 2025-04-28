// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Summary _$SummaryFromJson(Map<String, dynamic> json) => _Summary(
      id: json['id'] as String,
      content: json['content'] as String,
      episodeId: json['episodeId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      userId: json['userId'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SummaryToJson(_Summary instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'episodeId': instance.episodeId,
      'createdAt': instance.createdAt.toIso8601String(),
      'userId': instance.userId,
      'rating': instance.rating,
    };
