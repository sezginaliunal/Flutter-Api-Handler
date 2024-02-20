import 'package:chatapp/constans/strings.dart';
import 'package:chatapp/helper/snackbar_helper.dart';
import 'package:chatapp/service/api/api_response.dart';
import 'package:chatapp/service/api/base_api_service.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService implements BaseApiService {
  final Map<String, String> customHeaders = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer YOUR_ACCESS_TOKEN',
    'Accept': 'application/json',
  };

  @override
  String get baseApiUrl => AppStrings.baseUrl;

  @override
  Future<ApiResponse<Map<String, dynamic>>> get(String endpoint) async {
    final response = await http.get(
      Uri.parse('$baseApiUrl/$endpoint'),
      headers: customHeaders,
    );
    if (response.statusCode == HttpStatus.ok) {
      SnackbarHelper.showSuccessSnackbar('Success', 'Congratulations');
      return ApiResponse(
          success: true, data: jsonDecode(response.body), errorMessage: '');
    } else {
      final data = jsonDecode(response.body);
      SnackbarHelper.showErrorSnackbar('Error', data['error']);
      return ApiResponse(
        success: false,
        errorMessage: 'HTTP Error: ${response.statusCode}',
        data: data,
      );
    }
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> post(
      String endpoint, Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse('$baseApiUrl/$endpoint'),
      headers: customHeaders,
      body: jsonEncode(body),
    );
    if (response.statusCode == HttpStatus.ok) {
      SnackbarHelper.showSuccessSnackbar('Success', 'Congratulations');
      return ApiResponse(
          success: true, data: jsonDecode(response.body), errorMessage: '');
    } else {
      final data = jsonDecode(response.body);
      SnackbarHelper.showErrorSnackbar('Error', data['error']);
      return ApiResponse(
        success: false,
        errorMessage: 'HTTP Error: ${response.statusCode}',
        data: data,
      );
    }
  }
}
