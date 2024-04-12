import 'dart:convert';

import 'package:flutter/services.dart';

import '../../domain/data_sources/local/local_data_source.dart';
import '../requests/base_local_request.dart';

class AssetsDataSource extends LocalDataSource {
  @override
  Future<void> clearData(BaseLocalRequest request) {
    throw UnimplementedError();
  }

  @override
  Future<T?> retrieveData<T>(BaseLocalRequest request) async {
    final String jsonString = await rootBundle.loadString(request.key);
    return jsonDecode(jsonString);
  }

  @override
  Future<void> saveData(BaseLocalRequest request) {
    throw UnimplementedError();
  }
}
