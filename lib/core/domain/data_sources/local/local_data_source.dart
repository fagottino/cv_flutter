import '../../../data/requests/base_local_request.dart';

abstract class LocalDataSource {
  Future<T?> retrieveData<T>(BaseLocalRequest request);
  
  Future<void> saveData(BaseLocalRequest request);

  Future<void> clearData(BaseLocalRequest request);
}
