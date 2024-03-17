
import 'package:dartz/dartz.dart';

import '../../../../core/utils/errors/failure_entity.dart';
import '../entities/cv_entity.dart';

abstract class HomeRepository {
  Future<Either<FailureEntity, CvEntity>> getCv({
    required String assetsPath,
  });
}
