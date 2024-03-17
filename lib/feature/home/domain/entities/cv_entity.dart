import 'package:aorlando/feature/home/data/models/dto/skills_and_competences_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import 'contacts_entity.dart';
import 'driving_license_entity.dart';
import 'educations_entity.dart';
import 'languages_entity.dart';
import 'skills_and_competences_entity.dart';
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
  final String privacy;
  final List<ContactsEntity> contactsEntityList;
  final List<SocialLinkEntity> socialLinkEntityList;
  final List<WorkExperiencesEntity> workExperiencesEntityList;
  final List<EducationsEntity> educationsEntityList;
  final List<LanguagesEntity> languagesEntityList;
  final List<DrivingLicenseEntity> drivingLicenseEntityList;
  final List<SkillsAndCompetencesEntity> skillsAndCompetencesEntityList;

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
    this.privacy = '',
    this.contactsEntityList = const [],
    this.socialLinkEntityList = const [],
    this.workExperiencesEntityList = const [],
    this.educationsEntityList = const [],
    this.languagesEntityList = const [],
    this.drivingLicenseEntityList = const [],
    this.skillsAndCompetencesEntityList = const [],
  });

  factory CvEntity.fromJson(Map<String, dynamic> json) {
    return _$CvEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CvEntityToJson(this);
}
