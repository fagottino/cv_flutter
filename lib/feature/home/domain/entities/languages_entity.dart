import 'package:json_annotation/json_annotation.dart';

part 'languages_entity.g.dart';

@JsonSerializable()
class LanguagesEntity {
  final String title, level;

  LanguagesEntity({
    required this.title,
    required this.level,
  });

  const LanguagesEntity.empty()
      : title = '',
        level = '';

  factory LanguagesEntity.fromJson(Map<String, dynamic> json) {
    return _$LanguagesEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LanguagesEntityToJson(this);
}
