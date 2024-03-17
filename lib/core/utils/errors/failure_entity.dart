import 'package:equatable/equatable.dart';

sealed class FailureEntity extends Equatable {
  static getMessage({
    required FailureEntity failureEntity,
  }) {
    return switch (failureEntity) {
      Server() => "Server failure",
      DataParsing() => "Data parsing failure",
      NoConnection() => "No internet connection",
      CustomFailure<dynamic>() => "CustomFailure"
    };
  }
}

class Server extends FailureEntity {
  @override
  List<Object?> get props => [];
}

class DataParsing extends FailureEntity {
  @override
  List<Object?> get props => [];
}

class NoConnection extends FailureEntity {
  @override
  List<Object?> get props => [];
}

class CustomFailure<T> extends FailureEntity {
  CustomFailure({
    required this.data,
  });

  final T data;

  @override
  List<Object?> get props => [data];
}
