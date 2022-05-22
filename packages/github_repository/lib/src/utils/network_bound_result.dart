import 'package:github_repository/src/utils/api_response.dart';
import 'package:github_repository/src/utils/result.dart';

/// Useful is you need to load the data from the database and/or fetch from network
/// [forceFetch] true to skip the load from the database and download the data from the server
abstract class NetworkBoundResult<T, R> {
  /// Start requesting the data from the db, if return a ResultType null load the data in background
  /// [return] ResultType or null
  Future<T?> loadFromDatabase();

  /// Check if use the local data or fetch from server
  /// @param data local data
  /// @return true if fetch from server, false otherwise
  bool shouldFetch(T? data);

  /// Store the server data for later use
  /// [item] the data fetched from the network method
  void saveNetworkResult(R item);

  /// Fetch the data from network
  Future<ApiResponse<R>> fetchFromNetwork();

  ///Fetch the data from the server, if ok it will be saved on the database and retrieved
  Future<Result<T>> _network() async {
    final data = await fetchFromNetwork();
    if (data.isSuccess) {
      saveNetworkResult(data.data as R);
      final dbData = await loadFromDatabase();
      if (dbData != null) {
        return Result.success(dbData);
      } else {
        return Result.failure(
            Exception("Error while loading data from database"));
      }
    } else {
      return Result.failure(data.exception ??
          Exception("Errore while fetching data from server"));
    }
  }

  ///Flow to fetch and the store the data from the network and return it
  Future<Result<T>> getResult([bool forceFetch = false]) async {
    if (forceFetch) {
      return await _network();
    } else {
      final data = await loadFromDatabase();
      if (shouldFetch(data)) {
        return await _network();
      } else {
        if (data != null) {
          return Result.success(data);
        } else {
          return Result.failure(Exception(""));
        }
      }
    }
  }
}
