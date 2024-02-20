import 'package:chatapp/models/user/user.dart';
import 'package:get/get.dart';

import 'package:chatapp/service/api/exception.dart';
import 'package:chatapp/service/api/api_response.dart';
import 'package:chatapp/service/auth_service.dart';

class UserController extends GetxController {
  final AuthService _authService = AuthService();
  final RxList<Data> users = <Data>[].obs;

  Future<List<Data>> getUsers() async {
    try {
      final ApiResponse<Map<String, dynamic>> apiResponse =
          await _authService.get('users');
      if (apiResponse.success) {
        final Users response = Users.fromJson(apiResponse.data);
        final List<Data> userList =
            response.data!.map((data) => Data.fromJson(data.toJson())).toList();
        users.assignAll(userList);
        print(users);
        return users.toList();
      } else {
        throw ApiException('Failed to get users: ${apiResponse.errorMessage}');
      }
    } catch (e) {
      throw ApiException('Failed to get users: $e');
    }
  }
}
