import 'package:aorlando/feature/home/domain/entities/cv_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/utils/errors/failure_entity.dart';

abstract class HomeRepository {
  Future<Either<FailureEntity, CvEntity>> getCv({
    required String assetsPath,
  });
}
