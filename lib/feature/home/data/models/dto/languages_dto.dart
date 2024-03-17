import 'package:json_annotation/json_annotation.dart';

part 'languages_dto.g.dart';

@JsonSerializable()
class LanguagesDto {
  final String? title, level;

  LanguagesDto({
    this.title,
    this.level,
  });

  const LanguagesDto.empty()
      : title = '',
        level = '';

  factory LanguagesDto.fromJson(Map<String, dynamic> json) {
    return _$LanguagesDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LanguagesDtoToJson(this);
}
