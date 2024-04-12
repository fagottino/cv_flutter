import 'package:aorlando/core/utils/errors/failure_entity.dart';
import 'package:aorlando/feature/home/domain/entities/cv_entity.dart';
import 'package:aorlando/feature/home/domain/use_cases/get_cv_use_case.dart';
import 'package:aorlando/core/utils/errors/failure_entity.dart';
import 'package:aorlando/feature/home/domain/entities/cv_entity.dart';
import 'package:aorlando/feature/home/domain/use_cases/get_cv_use_case.dart';
import 'package:aorlando/feature/home/presentation/blocs/home_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_cubit_test.mocks.dart';
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
    blocTest<HomeCubit, HomeState>(
      'emits [InProgress, Error] when use case fails',
      build: () {
        when(mockGetCvUseCase.call(any)).thenAnswer((_) async => Left(Server()));
        return HomeCubit(getCvUseCase: mockGetCvUseCase);
      },
      act: (cubit) => cubit.initData(),
      expect: () => [
        InProgress(),
        Error(errorMessage: FailureEntity.getMessage(failureEntity: Server())),
      ],
    );
  });

  blocTest<HomeCubit, HomeState>(
    'emits [InProgress, Successfully] when use case succeeds',
    build: () {
      when(mockGetCvUseCase.call(any)).thenAnswer((_) async => Right(mockCvEntity));
      return HomeCubit(getCvUseCase: mockGetCvUseCase);
    },
    act: (cubit) => cubit.initData(),
    expect: () => [
      InProgress(),
      Successfully(cvEntity: mockCvEntity),
    ],
  );
}
