import 'package:dartz/dartz.dart';

import '../../../../core/data/requests/base_local_request.dart';
import '../../../../core/domain/data_sources/local/local_data_source.dart';
import '../../../../core/utils/errors/failure_entity.dart';
import '../../domain/entities/cv_entity.dart';
import '../../domain/mapper/cv_entity_mapper.dart';
import '../../domain/repositories/home_repository.dart';
import '../models/response/cv_response.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({
    required this.localDataSource,
  });

  final LocalDataSource localDataSource;
  final CvEntityMapper _cvEntityMapper = CvEntityMapper();

  @override
  Future<Either<FailureEntity, CvEntity>> getCv({
    required String assetsPath,
  }) async {
    try {
      final cvResponseJson = await localDataSource.retrieveData<Map<String, dynamic>>(
        BaseLocalRequest(
          key: assetsPath,
        ),
      );

      if (cvResponseJson != null) {
        final cvResponse = CvResponse.fromJson(cvResponseJson);

        final cvEntity = _cvEntityMapper.apply(
          cvResponse,
        );

        return Right(
          cvEntity,
        );
      } else {
        return Left(
          Server(),
        );
      }
    } catch (ex) {
      switch (ex.runtimeType) {
        case const (AssertionError):
          ex as AssertionError;
          return Left(
            CustomFailure<String>(
              data: ex.message.toString(),
            ),
          );
        case const (UnimplementedError):
          return Left(
            CustomFailure<String>(
              data: 'notImplementedYet',
            ),
          );
        case const (FormatException):
          return Left(
            DataParsing(),
          );
        default:
          return Left(
            CustomFailure<String>(
              data: ex.toString(),
            ),
          );
      }
    }
  }
}
