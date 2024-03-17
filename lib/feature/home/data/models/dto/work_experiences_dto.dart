import 'package:json_annotation/json_annotation.dart';

part 'work_experiences_dto.g.dart';

@JsonSerializable()
class WorkExperiencesDto {
  final String? company;
  final String? city;
  final String? dateFromTo;
  final String? title;
  final String? description;

  WorkExperiencesDto({
    this.company,
    this.city,
    this.dateFromTo,
    this.title,
    this.description,
  });

  const WorkExperiencesDto.empty()
      : company = '',
        city = '',
        dateFromTo = '',
        title = '',
        description = '';

  factory WorkExperiencesDto.fromJson(Map<String, dynamic> json) {
    return _$WorkExperiencesDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WorkExperiencesDtoToJson(this);
}
