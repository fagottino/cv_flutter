import 'package:aorlando/core/utils/errors/failure_entity.dart';
import 'package:aorlando/feature/home/domain/entities/cv_entity.dart';
import 'package:aorlando/feature/home/domain/use_cases/get_cv_use_case.dart';
import 'package:aorlando/feature/home/presentation/blocs/home_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_cubit_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GetCvUseCase>(),
  MockSpec<CvEntity>(),
])
void main() {
  late MockGetCvUseCase mockGetCvUseCase;
  late MockCvEntity mockCvEntity;

  setUp(() {
    mockGetCvUseCase = MockGetCvUseCase();
    mockCvEntity = MockCvEntity();
  });

  group('HomeCubit', () {
    test('emits [InProgress, Error] when use case fails', () async {
      when(mockGetCvUseCase.call(any)).thenAnswer((_) async => Left(Server()));
      final cubit = HomeCubit(getCvUseCase: mockGetCvUseCase);

      final expectation = expectLater(
        cubit.stream,
        emitsInOrder([
          InProgress(),
          Error(errorMessage: FailureEntity.getMessage(failureEntity: Server())),
        ]),
      );

      await cubit.initData();
      await expectation;
      await cubit.close();
    });

    test('emits [InProgress, Successfully] when use case succeeds', () async {
      when(mockGetCvUseCase.call(any)).thenAnswer((_) async => Right(mockCvEntity));
      final cubit = HomeCubit(getCvUseCase: mockGetCvUseCase);

      final expectation = expectLater(
        cubit.stream,
        emitsInOrder([
          InProgress(),
          Successfully(cvEntity: mockCvEntity),
        ]),
      );

      await cubit.initData();
      await expectation;
      await cubit.close();
    });
  });
}
