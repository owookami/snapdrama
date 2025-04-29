import 'package:freezed_annotation/freezed_annotation.dart';

part 'actor.freezed.dart';
part 'actor.g.dart';

@freezed
abstract class Actor with _$Actor {
  const factory Actor({
    required String id,
    required String name,
    String? profileUrl,
    String? role,
    String? description,
  }) = _Actor;

  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);
}
