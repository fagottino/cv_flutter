import '../../../../core/domain/mapper/mapper.dart';
import '../../data/models/response/cv_response.dart';
import '../entities/cv_entity.dart';
import '../entities/educations_entity.dart';
import '../entities/languages_entity.dart';

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
      );

  // CvEntity applyFromMap(Map<String, dynamic> user) {
  //   return CvEntity.fromJson(user);
  // }
}
