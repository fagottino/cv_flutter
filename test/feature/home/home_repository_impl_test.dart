import 'dart:convert';

import 'package:aorlando/core/domain/data_sources/local/local_data_source.dart';
import 'package:aorlando/core/utils/errors/failure_entity.dart';
import 'package:aorlando/feature/home/data/repositories_impl/home_repository_impl.dart';
import 'package:aorlando/feature/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../support/cv_test_data.dart';
import 'home_repository_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<LocalDataSource>(),
])
void main() {
  late MockLocalDataSource mockLocalDataSource;
  late HomeRepository homeRepositoryImpl;

  setUp(() {
    mockLocalDataSource = MockLocalDataSource();
    homeRepositoryImpl = HomeRepositoryImpl(
      localDataSource: mockLocalDataSource,
    );
  });

  group(
    'Get CV',
    () {
      test('GetCv - Success', () async {
        final cvResponse = buildTestCvResponse();

        when(mockLocalDataSource.retrieveData<Map<String, dynamic>>(any)).thenAnswer(
          (res) async => await Future.value(jsonDecode(jsonEncode(cvResponse.toJson()))),
        );

        final result = await homeRepositoryImpl.getCv(
          assetsPath: 'assets/files/cv-aorlando.pdf',
        );

        result.fold(
          (_) => fail('Expected a successful result'),
          (value) {
            expect(value.name, cvResponse.name);
            expect(value.surname, cvResponse.surname);
            expect(value.role, cvResponse.role);
            expect(value.contactsEntityList, hasLength(cvResponse.contactsDtoList.length));
            expect(value.socialLinkEntityList, hasLength(cvResponse.socialLinkDtoList.length));
            expect(value.workExperiencesEntityList, hasLength(cvResponse.workExperiencesDtoList.length));
            expect(value.educationsEntityList, hasLength(cvResponse.educationsDtoList.length));
            expect(value.languagesEntityList, hasLength(cvResponse.languagesDtoList.length));
            expect(
              value.skillsAndCompetencesEntityList,
              hasLength(cvResponse.skillsAndCompetences.length),
            );
          },
        );
      });

      test('GetCv - Error', () async {
        when(mockLocalDataSource.retrieveData<Map<String, dynamic>>(any)).thenAnswer(
          (res) async => await Future.value(
            null,
          ),
        );

        expect(
          await homeRepositoryImpl.getCv(assetsPath: ''),
          Left(Server()),
        );
      });

      test('GetCv - AssertionError Exception', () async {
        when(mockLocalDataSource.retrieveData<Map<String, dynamic>>(any)).thenThrow(
          AssertionError('AssertionError'),
        );

        expect(
          await homeRepositoryImpl.getCv(assetsPath: ''),
          Left(CustomFailure(data: 'AssertionError')),
        );
      });

      test('GetCv - UnimplementedError Exception', () async {
        when(mockLocalDataSource.retrieveData<Map<String, dynamic>>(any)).thenThrow(
          UnimplementedError(),
        );

        expect(
          await homeRepositoryImpl.getCv(assetsPath: ''),
          Left(CustomFailure(data: 'notImplementedYet')),
        );
      });

      test('GetCv - FormatException Exception', () async {
        when(mockLocalDataSource.retrieveData<Map<String, dynamic>>(any)).thenThrow(
          const FormatException(),
        );

        expect(
          await homeRepositoryImpl.getCv(assetsPath: ''),
          Left(DataParsing()),
        );
      });

      test('GetCv - default Exception', () async {
        when(mockLocalDataSource.retrieveData<Map<String, dynamic>>(any)).thenThrow(
          Exception(),
        );

        expect(
          await homeRepositoryImpl.getCv(assetsPath: ''),
          Left(CustomFailure(data: 'Exception')),
        );
      });
    },
  );
}
