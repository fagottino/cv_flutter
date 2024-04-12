import 'package:aorlando/core/domain/data_sources/local/local_data_source.dart';
import 'package:aorlando/core/utils/errors/failure_entity.dart';
import 'package:aorlando/feature/home/data/repositories_impl/home_repository_impl.dart';
import 'package:aorlando/feature/home/domain/entities/cv_entity.dart';
import 'package:aorlando/feature/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_repository_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<LocalDataSource>(),
  MockSpec<CvEntity>(),
])
void main() {
  late MockLocalDataSource mockLocalDataSource;
  late MockCvEntity mockCvEntity;
  late HomeRepository homeRepositoryImpl;

  setUpAll(() {
    mockLocalDataSource = MockLocalDataSource();
    mockCvEntity = MockCvEntity();
    homeRepositoryImpl = HomeRepositoryImpl(
      localDataSource: mockLocalDataSource,
    );
  });

  group(
    'Get CV',
    () {
      test('GetCv - Success', () async {
        when(mockLocalDataSource.retrieveData<Map<String, dynamic>>(any)).thenAnswer(
          (res) async => await Future.value(
            mockCvEntity.toJson(),
          ),
        );

        expect(
          await homeRepositoryImpl.getCv(assetsPath: 'assets/files/cv-aorlando.pdf'),
          Right(mockCvEntity),
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
          AssertionError(),
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
