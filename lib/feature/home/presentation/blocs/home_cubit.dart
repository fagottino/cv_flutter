import 'package:aorlando/core/utils/errors/failure_entity.dart';
import 'package:aorlando/feature/home/domain/entities/cv_entity.dart';
import 'package:aorlando/feature/home/domain/use_cases/get_cv_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.getCvUseCase,
  }) : super(Initial());

  final GetCvUseCase getCvUseCase;

  Future<void> initData() async {
    emit(InProgress());

    final result = await getCvUseCase.call(
      'assets/files/data.json',
    );

    result.fold(
      (l) {
        emit(
          Error(
            errorMessage: FailureEntity.getMessage(
              failureEntity: l,
            ),
          ),
        );
      },
      (r) => emit(
        Successfully(
          cvEntity: r,
        ),
      ),
    );
  }
}
