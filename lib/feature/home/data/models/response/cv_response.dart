import 'package:json_annotation/json_annotation.dart';

import '../dto/contact_link_dto.dart';
import '../dto/driving_license_dto.dart';
import '../dto/educations_dto.dart';
import '../dto/languages_dto.dart';
import '../dto/social_link_dto.dart';
import '../dto/work_experiences_dto.dart';

part 'cv_response.g.dart';

@JsonSerializable()
class CvResponse {
  final String? name;
  final String? surname;
  final String? role;
  final String? email;
  final String? website;
  final String? docUrl;
  final String? city;
  final String? birthDate;
  final String? description;
  @JsonKey(name: 'contactLink') List<ContactLinkDto> contactLinkDtoList;
  @JsonKey(name: 'socialLink') final List<SocialLinkDto> socialLinkDtoList;
  @JsonKey(name: 'workExperience') final List<WorkExperiencesDto> workExperiencesDtoList;
  @JsonKey(name: 'educations') final List<EducationsDto> educationsDtoList;
  @JsonKey(name: 'languages') final List<LanguagesDto> languagesDtoList;
  @JsonKey(name: 'drivingLicense') final List<DrivingLicenseDto> drivingLicenseDtoList;

  CvResponse({
    this.name,
    this.surname,
    this.role,
    this.email = '',
    this.website = '',
    this.docUrl = '',
    this.city = '',
    this.birthDate = '',
    this.description = '',
    this.contactLinkDtoList = const [],
    this.socialLinkDtoList = const [],
    this.workExperiencesDtoList = const [],
    this.educationsDtoList = const [],
    this.languagesDtoList = const [],
    this.drivingLicenseDtoList = const [],
  });

  factory CvResponse.fromJson(Map<String, dynamic> json) => _$CvResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CvResponseToJson(this);
}
