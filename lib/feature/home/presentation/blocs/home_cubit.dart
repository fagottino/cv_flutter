import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/errors/failure_entity.dart';
import '../../domain/entities/cv_entity.dart';
import '../../domain/repositories/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.homeRepository,
  }) : super(Initial());

  final HomeRepository homeRepository;

  Future<void> initData() async {
    emit(InProgress());

    final result = await homeRepository.getCv(
      assetsPath: 'assets/files/data.json',
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
