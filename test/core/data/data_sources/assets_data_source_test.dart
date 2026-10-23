import 'package:aorlando/core/data/data_sources/assets_data_source.dart';
import 'package:aorlando/core/data/requests/base_local_request.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('AssetsDataSource', () {
    final dataSource = AssetsDataSource();

    test('retrieveData loads and parses the cv json asset', () async {
      final result = await dataSource.retrieveData<Map<String, dynamic>>(
        BaseLocalRequest(
          key: 'assets/files/data.json',
        ),
      );

      expect(result, isA<Map<String, dynamic>>());
      expect(result?['name'], 'Antonio');
      expect(result?['surname'], 'Orlando');
      expect(result?['contacts'], isA<List<dynamic>>());
      expect((result?['contacts'] as List<dynamic>).length, greaterThan(0));
    });

    test('saveData is not implemented', () {
      expect(
        () => dataSource.saveData(
          BaseLocalRequest(
            key: 'assets/files/data.json',
          ),
        ),
        throwsUnimplementedError,
      );
    });

    test('clearData is not implemented', () {
      expect(
        () => dataSource.clearData(
          BaseLocalRequest(
            key: 'assets/files/data.json',
          ),
        ),
        throwsUnimplementedError,
      );
    });
  });
}
