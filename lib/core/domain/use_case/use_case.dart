abstract class UseCase<T, P> {
  Future<T> call(P param);
}

abstract class UseCaseNoParam<T> {
  Future<T> call();
}
