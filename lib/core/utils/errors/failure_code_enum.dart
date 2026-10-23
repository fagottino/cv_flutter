enum FailureCode {
  serverFailure('xx1'),
  dataParsing('xx2'),
  noConnection('xx3');

  final String value;

  const FailureCode(this.value);
}