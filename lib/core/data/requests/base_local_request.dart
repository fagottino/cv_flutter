class BaseLocalRequest<T> {
  final String key;
  final T? value;

  BaseLocalRequest({
    required this.key,
    this.value,
  });
}
