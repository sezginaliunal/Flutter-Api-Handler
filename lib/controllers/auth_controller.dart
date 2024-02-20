import 'package:chatapp/models/auth/login_request.dart';
import 'package:chatapp/models/auth/login_response.dart';
import 'package:chatapp/models/auth/register_request.dart';
import 'package:chatapp/models/auth/register_response.dart';
import 'package:chatapp/service/api/exception.dart';
import 'package:chatapp/service/api/api_response.dart';
import 'package:chatapp/service/auth_service.dart';

class AuthController {
  final AuthService _authService = AuthService();

  Future<RegisterResponse> register(RegisterRequest request) async {
    try {
      final ApiResponse<Map<String, dynamic>> apiResponse =
          await _authService.post('register', request.toJson());

      if (apiResponse.success) {
        final RegisterResponse response =
            RegisterResponse.fromJson(apiResponse.data);
        print(response.toJson());
        return response;
      } else {
        throw ApiException('Failed to register: ${apiResponse.errorMessage}');
      }
    } catch (e) {
      throw ApiException('Failed to register: $e');
    }
  }

  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final ApiResponse<Map<String, dynamic>> apiResponse =
          await _authService.post('register', request.toJson());

      if (apiResponse.success) {
        final LoginResponse response = LoginResponse.fromJson(apiResponse.data);
        print(response.toJson());
        return response;
      } else {
        throw ApiException('Failed to register: ${apiResponse.errorMessage}');
      }
    } catch (e) {
      throw ApiException('Failed to register: $e');
    }
  }
}
