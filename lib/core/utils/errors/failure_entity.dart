import 'package:aorlando/core/utils/errors/failure_code_enum.dart';
import 'package:equatable/equatable.dart';

sealed class FailureEntity extends Equatable {
  static getMessage({
    required FailureEntity failureEntity,
  }) {
    return switch (failureEntity) {
      Server() => FailureCode.serverFailure,
      DataParsing() => FailureCode.dataParsing,
      NoConnection() => FailureCode.noConnection,
      CustomFailure<dynamic>(:final data) => data.toString(),
    };
  }

  @override
  List<Object?> get props => [];
}

class Server extends FailureEntity {}

class DataParsing extends FailureEntity {}

class NoConnection extends FailureEntity {}

class CustomFailure<T> extends FailureEntity {
  CustomFailure({
    required this.data,
  });

  final T data;

  @override
  List<Object?> get props => [data];
}
