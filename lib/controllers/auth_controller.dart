import 'package:get/get.dart';
import '../routes/app_routes.dart';
import '../services/storage_service.dart';

class AuthController extends GetxController {
  final usernameController = ''.obs;
  final passwordController = ''.obs;
  final firstNameController = ''.obs;
  final lastNameController = ''.obs;
  final emailController = ''.obs;
  final phoneController = ''.obs;
  final isLoading = false.obs;

  // App launch logic
  // - If registered -> go Login
  // - Else -> go Register
  void checkRegistrationStatus() {
    if (StorageService.isRegisteredIn) {
      Get.offAllNamed(AppRoutes.LOGIN);
    } else {
      Get.offAllNamed(AppRoutes.REGISTER);
    }
  }

  Future<void> register() async {
    if (firstNameController.value.isEmpty ||
        lastNameController.value.isEmpty ||
        emailController.value.isEmpty ||
        phoneController.value.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill all fields',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 400));

    await StorageService.saveRegisteredProfile({
      'firstName': firstNameController.value.trim(),
      'lastName': lastNameController.value.trim(),
      'email': emailController.value.trim(),
      'phone': phoneController.value.trim(),
    });
    await StorageService.setRegisteredIn(true);

    isLoading.value = false;

    Get.offAllNamed(AppRoutes.LOGIN);
  }

  Future<void> login() async {
    if (usernameController.value.isEmpty || passwordController.value.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter both username and password',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;

    // Simulate login delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Save login state
    await StorageService.setLoggedIn(true);

    isLoading.value = false;

    // Navigate to home
    Get.offAllNamed(AppRoutes.HOME);
  }

  void logout() {
    StorageService.clearLogin();
    StorageService.clearSubscriptions();
    // Keep registration; user can log back in without re-registering.
    Get.offAllNamed(AppRoutes.LOGIN);
  }
}
