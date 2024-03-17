import 'package:json_annotation/json_annotation.dart';

part 'work_experiences_entity.g.dart';

@JsonSerializable()
class WorkExperiencesEntity {
  final String company;
  final String city;
  final String dateFromTo;
  final String title;
  final String description;

  WorkExperiencesEntity({
    required this.company,
    required this.city,
    required this.dateFromTo,
    required this.title,
    required this.description,
  });

  const WorkExperiencesEntity.empty()
      : company = '',
        city = '',
        dateFromTo = '',
        title = '',
        description = '';

  factory WorkExperiencesEntity.fromJson(Map<String, dynamic> json) {
    return _$WorkExperiencesEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WorkExperiencesEntityToJson(this);
}
