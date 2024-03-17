import '../../../../core/domain/mapper/mapper.dart';
import '../../data/models/response/cv_response.dart';
import '../entities/contacts_entity.dart';
import '../entities/cv_entity.dart';
import '../entities/driving_license_entity.dart';
import '../entities/educations_entity.dart';
import '../entities/languages_entity.dart';
import '../entities/skills_and_competences_entity.dart';
import '../entities/social_link_entity.dart';
import '../entities/work_experiences_entity.dart';

class CvEntityMapper implements Mapper<CvResponse, CvEntity> {
  @override
  CvEntity apply(CvResponse response) => CvEntity(
        name: response.name ?? '',
        surname: response.surname ?? '',
        role: response.role ?? '',
        email: response.email ?? '',
        website: response.website ?? '',
        docUrl: response.docUrl ?? '',
        city: response.city ?? '',
        birthDate: response.birthDate ?? '',
        description: response.description ?? '',
        privacy: response.privacy ?? '',
        contactsEntityList: response.contactsDtoList
            .map(
              (e) => ContactsEntity(
                label: e.label ?? '',
                link: e.link ?? '',
                icon: e.icon ?? '',
              ),
            )
            .toList(),
        educationsEntityList: response.educationsDtoList
            .map((e) => EducationsEntity(
                  institute: e.institute ?? '',
                  cityOfInstitute: e.cityOfInstitute ?? '',
                  dateFromTo: e.dateFromTo ?? '',
                  title: e.title ?? '',
                  description: e.description ?? '',
                ))
            .toList(),
        languagesEntityList: response.languagesDtoList
            .map((e) => LanguagesEntity(
                  title: e.title ?? '',
                  level: e.level ?? '',
                ))
            .toList(),
        workExperiencesEntityList: response.workExperiencesDtoList
            .map((e) => WorkExperiencesEntity(
                  company: e.company ?? '',
                  dateFromTo: e.dateFromTo ?? '',
                  description: e.description ?? '',
                  city: e.city ?? '',
                  title: e.title ?? '',
                ))
            .toList(),
        skillsAndCompetencesEntityList: response.skillsAndCompetences
            .map((e) => SkillsAndCompetencesEntity(
                  title: e.title ?? '',
                  description: e.description ?? '',
                ))
            .toList(),
        drivingLicenseEntityList: response.drivingLicenseDtoList
            .map(
              (e) => DrivingLicenseEntity(
                value: e.value,
              ),
            )
            .toList(),
        socialLinkEntityList: response.socialLinkDtoList
            .map(
              (e) => SocialLinkEntity(
                link: e.link ?? '',
                icon: e.icon ?? '',
                name: e.name ?? '',
                label: e.label ?? '',
                showInHeader: e.showInHeader ?? false,
              ),
            )
            .toList(),
      );

  // CvEntity applyFromMap(Map<String, dynamic> user) {
  //   return CvEntity.fromJson(user);
  // }
}
