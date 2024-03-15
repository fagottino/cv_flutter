import 'package:json_annotation/json_annotation.dart';

part 'skills_and_competences_entity.g.dart';

@JsonSerializable()
class SkillsAndCompetencesEntity {
  final String title, description;

  SkillsAndCompetencesEntity({
    required this.title,
    required this.description,
  });

  factory SkillsAndCompetencesEntity.fromJson(Map<String, dynamic> json) {
    return _$SkillsAndCompetencesEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SkillsAndCompetencesEntityToJson(this);
}
