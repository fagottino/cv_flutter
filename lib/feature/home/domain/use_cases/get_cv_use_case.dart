import 'package:dartz/dartz.dart';

import '../../../../core/domain/use_case/use_case.dart';
import '../../../../core/utils/errors/failure_entity.dart';
import '../entities/cv_entity.dart';
import '../repositories/home_repository.dart';

class GetCvUseCase implements UseCase<Either, String> {
  final HomeRepository homeRepository;

  GetCvUseCase({
    required this.homeRepository,
  });

  @override
  Future<Either<FailureEntity, CvEntity>> call(String assetPath) async {
    return await homeRepository.getCv(assetsPath: assetPath);
  }
}
