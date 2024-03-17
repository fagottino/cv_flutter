import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

import '../../../../core/utils/errors/failure_entity.dart';
import '../../domain/entities/cv_entity.dart';
import '../../domain/mapper/cv_entity_mapper.dart';
import '../../domain/repositories/home_repository.dart';
import '../models/response/cv_response.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl();

  final CvEntityMapper _cvEntityMapper = CvEntityMapper();

  @override
  Future<Either<FailureEntity, CvEntity>> getCv({
    required String assetsPath,
  }) async {
    try {
      final String jsonString = await rootBundle.loadString(assetsPath);
      final Map<String, dynamic> cvResponseJson = jsonDecode(jsonString);
      final cvResponse = CvResponse.fromJson(cvResponseJson);

      final cvEntity = _cvEntityMapper.apply(
        cvResponse,
      );

      return Right(
        cvEntity,
      );
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
