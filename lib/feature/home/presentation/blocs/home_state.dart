part of 'home_cubit.dart';

sealed class HomeState extends Equatable {}

class Initial extends HomeState {
  @override
  List<Object?> get props => [];
}

class InProgress extends HomeState {
  @override
  List<Object?> get props => [];
}

class Successfully extends HomeState {
  Successfully({
    required this.cvEntity,
  });

  final CvEntity cvEntity;

  @override
  List<Object?> get props => [cvEntity];
}

class Error extends HomeState {
  Error({
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
