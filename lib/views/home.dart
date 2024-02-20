import 'package:chatapp/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserController _userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _userController.getUsers();
        },
      ),
      body: GetBuilder<UserController>(
        builder: (userController) {
          return ListView.builder(
            itemCount: userController.users.length,
            itemBuilder: (context, index) {
              final user = userController.users[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.avatar ?? ''),
                ),
                title: Text(user.email ?? ''),
                subtitle: Text(user.firstName ?? ''),
              );
            },
          );
        },
      ),
    );
  }
}
