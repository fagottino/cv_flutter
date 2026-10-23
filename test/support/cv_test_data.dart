import 'package:aorlando/feature/home/data/models/dto/contacts_dto.dart';
import 'package:aorlando/feature/home/data/models/dto/driving_license_dto.dart';
import 'package:aorlando/feature/home/data/models/dto/educations_dto.dart';
import 'package:aorlando/feature/home/data/models/dto/languages_dto.dart';
import 'package:aorlando/feature/home/data/models/dto/skills_and_competences_dto.dart';
import 'package:aorlando/feature/home/data/models/dto/social_link_dto.dart';
import 'package:aorlando/feature/home/data/models/dto/work_experiences_dto.dart';
import 'package:aorlando/feature/home/data/models/response/cv_response.dart';
import 'package:aorlando/feature/home/domain/entities/contacts_entity.dart';
import 'package:aorlando/feature/home/domain/entities/cv_entity.dart';
import 'package:aorlando/feature/home/domain/entities/driving_license_entity.dart';
import 'package:aorlando/feature/home/domain/entities/educations_entity.dart';
import 'package:aorlando/feature/home/domain/entities/languages_entity.dart';
import 'package:aorlando/feature/home/domain/entities/skills_and_competences_entity.dart';
import 'package:aorlando/feature/home/domain/entities/social_link_entity.dart';
import 'package:aorlando/feature/home/domain/entities/work_experiences_entity.dart';

CvEntity buildTestCvEntity({
  String name = 'Antonio',
  String surname = 'Orlando',
  String role = 'Flutter Developer',
  String city = 'Rome',
  String birthDate = '01/01/1990',
  String description = 'Cross-platform developer.',
  String privacy = 'Privacy text',
  List<ContactsEntity>? contacts,
  List<SocialLinkEntity>? socialLinks,
  List<WorkExperiencesEntity>? workExperiences,
  List<EducationsEntity>? educations,
  List<LanguagesEntity>? languages,
  List<DrivingLicenseEntity>? drivingLicenses,
  List<SkillsAndCompetencesEntity>? skills,
}) {
  return CvEntity(
    name: name,
    surname: surname,
    role: role,
    city: city,
    birthDate: birthDate,
    description: description,
    privacy: privacy,
    contactsEntityList:
        contacts ??
        [
          ContactsEntity(
            label: 'antonio@example.com',
            link: 'mailto:antonio@example.com',
            icon: 'inbox',
          ),
        ],
    socialLinkEntityList:
        socialLinks ??
        [
          SocialLinkEntity(
            link: 'https://example.com/linkedin',
            icon: 'linkedin',
            name: 'LinkedIn',
            label: 'LinkedIn',
            showInHeader: true,
          ),
          SocialLinkEntity(
            link: 'https://example.com/github',
            icon: 'github',
            name: 'GitHub',
            label: 'GitHub',
          ),
        ],
    workExperiencesEntityList:
        workExperiences ??
        [
          WorkExperiencesEntity(
            company: 'Example Inc.',
            city: 'Rome',
            dateFromTo: '2020 - today',
            title: 'Engineer',
            description: 'Built Flutter apps.',
          ),
        ],
    educationsEntityList:
        educations ??
        [
          EducationsEntity(
            institute: 'Example University',
            cityOfInstitute: 'Rome',
            dateFromTo: '2010 - 2013',
            title: 'Computer Science',
            description: 'Graduated with honors.',
          ),
        ],
    languagesEntityList:
        languages ??
        [
          LanguagesEntity(
            title: 'Italian',
            level: 'Native',
          ),
        ],
    drivingLicenseEntityList:
        drivingLicenses ??
        [
          DrivingLicenseEntity(
            value: 'B',
          ),
        ],
    skillsAndCompetencesEntityList:
        skills ??
        [
          SkillsAndCompetencesEntity(
            title: 'Technical',
            description: 'Flutter, Dart, BLoC',
          ),
        ],
  );
}

CvResponse buildTestCvResponse({
  String? name = 'Antonio',
  String? surname = 'Orlando',
  String? role = 'Flutter Developer',
  String? email = 'antonio@example.com',
  String? website = 'example.com',
  String? docUrl = 'https://example.com/cv.pdf',
  String? city = 'Rome',
  String? birthDate = '01/01/1990',
  String? description = 'Cross-platform developer.',
  String? privacy = 'Privacy text',
  List<ContactsDto>? contacts,
  List<SocialLinkDto>? socialLinks,
  List<WorkExperiencesDto>? workExperiences,
  List<EducationsDto>? educations,
  List<LanguagesDto>? languages,
  List<DrivingLicenseDto>? drivingLicenses,
  List<SkillsAndCompetencesDto>? skills,
}) {
  return CvResponse(
    name: name,
    surname: surname,
    role: role,
    email: email,
    website: website,
    docUrl: docUrl,
    city: city,
    birthDate: birthDate,
    description: description,
    privacy: privacy,
    contactsDtoList:
        contacts ??
        [
          ContactsDto(
            label: 'antonio@example.com',
            link: 'mailto:antonio@example.com',
            icon: 'inbox',
          ),
        ],
    socialLinkDtoList:
        socialLinks ??
        [
          SocialLinkDto(
            link: 'https://example.com/linkedin',
            icon: 'linkedin',
            name: 'LinkedIn',
            label: 'LinkedIn',
            showInHeader: true,
          ),
        ],
    workExperiencesDtoList:
        workExperiences ??
        [
          WorkExperiencesDto(
            company: 'Example Inc.',
            city: 'Rome',
            dateFromTo: '2020 - today',
            title: 'Engineer',
            description: 'Built Flutter apps.',
          ),
        ],
    educationsDtoList:
        educations ??
        [
          EducationsDto(
            institute: 'Example University',
            cityOfInstitute: 'Rome',
            dateFromTo: '2010 - 2013',
            title: 'Computer Science',
            description: 'Graduated with honors.',
          ),
        ],
    languagesDtoList:
        languages ??
        [
          LanguagesDto(
            title: 'Italian',
            level: 'Native',
          ),
        ],
    drivingLicenseDtoList:
        drivingLicenses ??
        [
          DrivingLicenseDto(
            value: 'B',
          ),
        ],
    skillsAndCompetences:
        skills ??
        [
          SkillsAndCompetencesDto(
            title: 'Technical',
            description: 'Flutter, Dart, BLoC',
          ),
        ],
  );
}
