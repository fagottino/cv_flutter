import 'package:json_annotation/json_annotation.dart';

import 'contact_link_entity.dart';
import 'driving_license_entity.dart';
import 'educations_entity.dart';
import 'languages_entity.dart';
import 'social_link_entity.dart';
import 'work_experiences_entity.dart';

part 'cv_entity.g.dart';

@JsonSerializable()
class CvEntity {
  final String name;
  final String surname;
  final String role;
  final String email;
  final String website;
  final String docUrl;
  final String city;
  final String birthDate;
  final String description;
  final List<ContactLinkEntity> contactLinkEntityList;
  final List<SocialLinkEntity> socialLinkEntityList;
  final List<WorkExperiencesEntity> workExperiencesEntityList;
  final List<EducationsEntity> educationsEntityList;
  final List<LanguagesEntity> languagesEntityList;
  final List<DrivingLicenseEntity> drivingLicenseEntityList;

  CvEntity({
    this.name = '',
    this.surname = '',
    this.role = '',
    this.email = '',
    this.website = '',
    this.docUrl = '',
    this.city = '',
    this.birthDate = '',
    this.description = '',
    this.contactLinkEntityList = const [],
    this.socialLinkEntityList = const [],
    this.workExperiencesEntityList = const [],
    this.educationsEntityList = const [],
    this.languagesEntityList = const [],
    this.drivingLicenseEntityList = const [],
  });

  factory CvEntity.fromJson(Map<String, dynamic> json) {
    return _$CvEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CvEntityToJson(this);
}
