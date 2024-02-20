import 'package:chatapp/service/api/api_response.dart';

abstract class BaseApiService {
  final String baseApiUrl;

  BaseApiService(this.baseApiUrl);

  Future<ApiResponse<Map<String, dynamic>>> get(String endpoint);

  Future<ApiResponse<Map<String, dynamic>>> post(
      String endpoint, Map<String, dynamic> body);
}
