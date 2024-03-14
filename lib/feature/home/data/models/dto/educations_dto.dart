import 'package:json_annotation/json_annotation.dart';

part 'educations_dto.g.dart';

@JsonSerializable()
class EducationsDto {
  final String? institute;
  final String? cityOfInstitute;
  final String? dateFromTo;
  final String? title;
  final String? description;

  EducationsDto({
    this.institute,
    this.cityOfInstitute,
    this.dateFromTo,
    this.title,
    this.description,
  });

  const EducationsDto.empty()
      : institute = '',
        cityOfInstitute = '',
        dateFromTo = '',
        title = '',
        description = '';

  factory EducationsDto.fromJson(Map<String, dynamic> json) {
    return _$EducationsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EducationsDtoToJson(this);
}
