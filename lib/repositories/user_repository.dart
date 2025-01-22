import 'package:bilytica_task/services/api_service.dart';

class UserRepository {
  final ApiService _apiService = ApiService();

  dynamic getUserList({
    required Function(dynamic) onSuccess,
    required Function(String, String) onFailure,
    int pageNumber = 1,
    int? limit = 10,
  }) async {
    try {
      final response = await _apiService.get(
        '/',
        queryParams: {
          'page': pageNumber,
          'results': limit,
        },
      );

      if (response != null) {
        onSuccess(
          response.data,
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
