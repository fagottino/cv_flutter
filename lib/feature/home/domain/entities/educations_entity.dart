import 'package:json_annotation/json_annotation.dart';

part 'educations_entity.g.dart';

@JsonSerializable()
class EducationsEntity {
  final String institute;
  final String cityOfInstitute;
  final String dateFromTo;
  final String title;
  final String description;

  EducationsEntity({
    required this.institute,
    required this.cityOfInstitute,
    required this.dateFromTo,
    required this.title,
    required this.description,
  });

  const EducationsEntity.empty()
      : institute = '',
        cityOfInstitute = '',
        dateFromTo = '',
        title = '',
        description = '';

  factory EducationsEntity.fromJson(Map<String, dynamic> json) {
    return _$EducationsEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EducationsEntityToJson(this);
}
