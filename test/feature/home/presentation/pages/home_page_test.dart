import 'dart:async';

import 'package:aorlando/core/presentation/widgets/app_error_state_widget.dart';
import 'package:aorlando/core/utils/errors/failure_entity.dart';
import 'package:aorlando/feature/home/domain/entities/cv_entity.dart';
import 'package:aorlando/feature/home/domain/repositories/home_repository.dart';
import 'package:aorlando/feature/home/domain/use_cases/get_cv_use_case.dart';
import 'package:aorlando/feature/home/presentation/blocs/home_cubit.dart';
import 'package:aorlando/feature/home/presentation/blocs/vertical_divider_cubit.dart';
import 'package:aorlando/feature/home/presentation/pages/home_page.dart';
import 'package:aorlando/feature/home/presentation/widgets/mobile/'
    'home_page_body_mobile_widget.dart';
import 'package:aorlando/feature/home/presentation/widgets/web/'
    'home_page_body_web_widget.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../support/cv_test_data.dart';

class StubHomeRepository implements HomeRepository {
  StubHomeRepository.success(this.cvEntity)
    : failure = null,
      _responseFuture = null,
      _responses = null;

  StubHomeRepository.failure(this.failure)
    : cvEntity = null,
      _responseFuture = null,
      _responses = null;

  StubHomeRepository.pending(this._responseFuture)
    : cvEntity = null,
      failure = null,
      _responses = null;

  StubHomeRepository.sequence(this._responses)
    : cvEntity = null,
      failure = null,
      _responseFuture = null;

  final CvEntity? cvEntity;
  final FailureEntity? failure;
  final Future<Either<FailureEntity, CvEntity>>? _responseFuture;
  final List<FutureOr<Either<FailureEntity, CvEntity>>>? _responses;
  final List<String> receivedAssetsPaths = [];
  int _callCount = 0;

  @override
  Future<Either<FailureEntity, CvEntity>> getCv({
    required String assetsPath,
  }) async {
    receivedAssetsPaths.add(assetsPath);

    if (_responses != null) {
      final response = _responses[_callCount];
      _callCount++;
      return await Future.value(response);
    }

    if (_responseFuture != null) {
      return _responseFuture;
    }

    if (failure != null) {
      return Left(failure!);
    }

    return Right(cvEntity!);
  }
}

void main() {
  Future<void> pumpHomePage(
    WidgetTester tester, {
    required HomeCubit homeCubit,
    required double width,
  }) async {
    await tester.binding.setSurfaceSize(
      Size(width, 1600),
    );
    addTearDown(() => tester.binding.setSurfaceSize(null));
    addTearDown(homeCubit.close);

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<HomeCubit>.value(value: homeCubit),
          BlocProvider<VerticalDividerCubit>(
            create: (_) => VerticalDividerCubit(),
          ),
        ],
        child: const MaterialApp(
          home: HomePage(),
        ),
      ),
    );
  }

  group('HomePage', () {
    testWidgets('shows a loading indicator while the cv is being loaded', (tester) async {
      final completer = Completer<Either<FailureEntity, CvEntity>>();
      final repository = StubHomeRepository.pending(completer.future);
      final homeCubit = HomeCubit(
        getCvUseCase: GetCvUseCase(
          homeRepository: repository,
        ),
      );

      await pumpHomePage(
        tester,
        homeCubit: homeCubit,
        width: 800,
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pump();

      expect(repository.receivedAssetsPaths.single, 'assets/files/data.json');
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders the mobile body on narrow viewports', (tester) async {
      final repository = StubHomeRepository.success(
        buildTestCvEntity(),
      );
      final homeCubit = HomeCubit(
        getCvUseCase: GetCvUseCase(
          homeRepository: repository,
        ),
      );

      await pumpHomePage(
        tester,
        homeCubit: homeCubit,
        width: 800,
      );

      await tester.pump();
      await tester.pump();

      expect(repository.receivedAssetsPaths.single, 'assets/files/data.json');
      expect(find.byType(HomePageBodyMobileWidget), findsOneWidget);
      expect(find.byType(HomePageBodyWebWidget), findsNothing);
      expect(find.text('Antonio'), findsOneWidget);
      expect(find.text('Orlando'), findsOneWidget);
    });

    testWidgets('renders the web body on wide viewports', (tester) async {
      final repository = StubHomeRepository.success(
        buildTestCvEntity(),
      );
      final homeCubit = HomeCubit(
        getCvUseCase: GetCvUseCase(
          homeRepository: repository,
        ),
      );

      await pumpHomePage(
        tester,
        homeCubit: homeCubit,
        width: 1300,
      );

      await tester.pump();
      await tester.pump();

      expect(repository.receivedAssetsPaths.single, 'assets/files/data.json');
      expect(find.byType(HomePageBodyWebWidget), findsOneWidget);
      expect(find.byType(HomePageBodyMobileWidget), findsNothing);
      expect(find.text('Antonio Orlando'), findsOneWidget);
    });

    testWidgets('renders the full-screen error widget when loading fails', (tester) async {
      final repository = StubHomeRepository.failure(
        Server(),
      );
      final homeCubit = HomeCubit(
        getCvUseCase: GetCvUseCase(
          homeRepository: repository,
        ),
      );

      await pumpHomePage(
        tester,
        homeCubit: homeCubit,
        width: 800,
      );

      await tester.pump();
      await tester.pump();

      expect(repository.receivedAssetsPaths.single, 'assets/files/data.json');
      expect(find.byType(AppErrorStateWidget), findsOneWidget);
      expect(find.text('Server failure'), findsOneWidget);
      expect(find.text('Riprova'), findsOneWidget);
    });

    testWidgets('retries the request from the error widget and shows loading before success', (
      tester,
    ) async {
      final retryCompleter = Completer<Either<FailureEntity, CvEntity>>();
      final repository = StubHomeRepository.sequence([
        Left<FailureEntity, CvEntity>(Server()),
        retryCompleter.future,
      ]);
      final homeCubit = HomeCubit(
        getCvUseCase: GetCvUseCase(
          homeRepository: repository,
        ),
      );

      await pumpHomePage(
        tester,
        homeCubit: homeCubit,
        width: 800,
      );

      await tester.pump();
      await tester.pump();

      expect(find.byType(AppErrorStateWidget), findsOneWidget);

      await tester.tap(find.text('Riprova'));
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      retryCompleter.complete(
        Right<FailureEntity, CvEntity>(
          buildTestCvEntity(),
        ),
      );

      await tester.pump();
      await tester.pump();

      expect(repository.receivedAssetsPaths, [
        'assets/files/data.json',
        'assets/files/data.json',
      ]);
      expect(find.byType(HomePageBodyMobileWidget), findsOneWidget);
      expect(find.byType(AppErrorStateWidget), findsNothing);
    });
  });
}
