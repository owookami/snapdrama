import 'package:freezed_annotation/freezed_annotation.dart';

part 'summary.freezed.dart';
part 'summary.g.dart';

@freezed
abstract class Summary with _$Summary {
  const factory Summary({
    required String id,
    required String content,
    required String episodeId,
    required DateTime createdAt,
    String? userId,
    double? rating,
  }) = _Summary;

  factory Summary.fromJson(Map<String, dynamic> json) =>
      _$SummaryFromJson(json);
}
