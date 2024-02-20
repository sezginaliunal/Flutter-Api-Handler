import 'package:chatapp/constans/color.dart';
import 'package:get/get.dart';

class SnackbarHelper {
  static void showErrorSnackbar(String title, String message) {
    Get.snackbar(title, message,
        colorText: Get.textTheme.bodyMedium?.color,
        backgroundColor: AppColors.errorColor);
  }

  static void showSuccessSnackbar(String title, String message) {
    Get.snackbar(title, message,
        colorText: Get.textTheme.titleMedium?.color,
        backgroundColor: AppColors.primaryColor);
  }
}
