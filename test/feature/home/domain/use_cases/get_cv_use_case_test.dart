import 'package:aorlando/core/utils/errors/failure_entity.dart';
import 'package:aorlando/feature/home/domain/entities/cv_entity.dart';
import 'package:aorlando/feature/home/domain/repositories/home_repository.dart';
import 'package:aorlando/feature/home/domain/use_cases/get_cv_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../support/cv_test_data.dart';

class RecordingHomeRepository implements HomeRepository {
  RecordingHomeRepository({
    required this.result,
  });

  final Either<FailureEntity, CvEntity> result;
  String? receivedAssetsPath;

  @override
  Future<Either<FailureEntity, CvEntity>> getCv({
    required String assetsPath,
  }) async {
    receivedAssetsPath = assetsPath;
    return result;
  }
}

void main() {
  group('GetCvUseCase', () {
    test('forwards the asset path to the repository and returns the cv', () async {
      final cvEntity = buildTestCvEntity();
      final repository = RecordingHomeRepository(
        result: Right(cvEntity),
      );
      final useCase = GetCvUseCase(
        homeRepository: repository,
      );

      final result = await useCase('assets/files/data.json');

      expect(repository.receivedAssetsPath, 'assets/files/data.json');
      result.fold(
        (_) => fail('Expected a successful result'),
        (value) => expect(value, same(cvEntity)),
      );
    });

    test('returns repository failures unchanged', () async {
      final repository = RecordingHomeRepository(
        result: Left(Server()),
      );
      final useCase = GetCvUseCase(
        homeRepository: repository,
      );

      final result = await useCase('assets/files/data.json');

      expect(repository.receivedAssetsPath, 'assets/files/data.json');
      result.fold(
        (failure) => expect(failure, equals(Server())),
        (_) => fail('Expected a failure result'),
      );
    });
  });
}
