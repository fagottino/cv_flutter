import 'package:aorlando/feature/home/data/models/dto/contacts_dto.dart';
import 'package:aorlando/feature/home/data/models/dto/driving_license_dto.dart';
import 'package:aorlando/feature/home/data/models/dto/educations_dto.dart';
import 'package:aorlando/feature/home/data/models/dto/languages_dto.dart';
import 'package:aorlando/feature/home/data/models/dto/skills_and_competences_dto.dart';
import 'package:aorlando/feature/home/data/models/dto/social_link_dto.dart';
import 'package:aorlando/feature/home/data/models/dto/work_experiences_dto.dart';
import 'package:aorlando/feature/home/domain/mapper/cv_entity_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../support/cv_test_data.dart';

void main() {
  group('CvEntityMapper', () {
    test('maps response fields and nested collections into the domain entity', () {
      final response = buildTestCvResponse(
        name: null,
        website: null,
        contacts: [
          ContactsDto(
            label: 'antonio@example.com',
            link: 'mailto:antonio@example.com',
            icon: 'inbox',
          ),
        ],
        socialLinks: [
          SocialLinkDto(
            link: 'https://example.com/github',
            icon: 'github',
            name: 'GitHub',
            label: 'GitHub',
            showInHeader: true,
          ),
        ],
        workExperiences: [
          WorkExperiencesDto(
            company: 'Example Inc.',
            city: 'Rome',
            dateFromTo: '2020 - today',
            title: 'Engineer',
            description: 'Built Flutter apps.',
          ),
        ],
        educations: [
          EducationsDto(
            institute: 'Example University',
            cityOfInstitute: 'Rome',
            dateFromTo: '2010 - 2013',
            title: 'Computer Science',
            description: 'Graduated with honors.',
          ),
        ],
        languages: [
          LanguagesDto(
            title: 'Italian',
            level: 'Native',
          ),
        ],
        drivingLicenses: [
          DrivingLicenseDto(
            value: 'B',
          ),
        ],
        skills: [
          SkillsAndCompetencesDto(
            title: 'Technical',
            description: 'Flutter, Dart, BLoC',
          ),
        ],
      );

      final entity = CvEntityMapper().apply(response);

      expect(entity.name, isEmpty);
      expect(entity.surname, 'Orlando');
      expect(entity.website, isEmpty);
      expect(entity.contactsEntityList.single.label, 'antonio@example.com');
      expect(entity.contactsEntityList.single.link, 'mailto:antonio@example.com');
      expect(entity.socialLinkEntityList.single.icon, 'github');
      expect(entity.socialLinkEntityList.single.showInHeader, isTrue);
      expect(entity.workExperiencesEntityList.single.company, 'Example Inc.');
      expect(entity.educationsEntityList.single.institute, 'Example University');
      expect(entity.languagesEntityList.single.level, 'Native');
      expect(entity.drivingLicenseEntityList.single.value, 'B');
      expect(entity.skillsAndCompetencesEntityList.single.description, 'Flutter, Dart, BLoC');
    });
  });
}
