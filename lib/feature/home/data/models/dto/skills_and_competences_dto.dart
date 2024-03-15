import 'package:json_annotation/json_annotation.dart';

part 'skills_and_competences_dto.g.dart';

@JsonSerializable()
class SkillsAndCompetencesDto {
  final String? title, description;

  SkillsAndCompetencesDto({
    this.title,
    this.description,
  });

  factory SkillsAndCompetencesDto.fromJson(Map<String, dynamic> json) {
    return _$SkillsAndCompetencesDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SkillsAndCompetencesDtoToJson(this);
}
