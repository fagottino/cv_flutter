import 'package:aorlando/core/utils/errors/failure_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FailureEntity.getMessage', () {
    test('returns the message for server failures', () {
      expect(
        FailureEntity.getMessage(
          failureEntity: Server(),
        ),
        'Server failure',
      );
    });

    test('returns the message for parsing failures', () {
      expect(
        FailureEntity.getMessage(
          failureEntity: DataParsing(),
        ),
        'Data parsing failure',
      );
    });

    test('returns the message for connection failures', () {
      expect(
        FailureEntity.getMessage(
          failureEntity: NoConnection(),
        ),
        'No internet connection',
      );
    });

    test('returns the generic message for custom failures', () {
      expect(
        FailureEntity.getMessage(
          failureEntity: CustomFailure<String>(
            data: 'boom',
          ),
        ),
        'CustomFailure',
      );
    });
  });
}
