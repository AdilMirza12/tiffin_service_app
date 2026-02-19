import 'package:get/get.dart';
import '../models/meal_plan.dart';
import '../routes/app_routes.dart';
import '../services/storage_service.dart';

class DetailsController extends GetxController {
  late MealPlan mealPlan;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Retrieve meal plan from arguments
    mealPlan = Get.arguments as MealPlan;
  }

  Future<void> subscribe() async {
    isLoading.value = true;

    // Get current subscriptions
    List<Map<String, dynamic>> subscriptions = StorageService.getSubscriptions();

    // Check if already subscribed
    bool alreadySubscribed = subscriptions.any((sub) => sub['id'] == mealPlan.id);

    if (alreadySubscribed) {
      Get.snackbar(
        'Already Subscribed',
        'You have already subscribed to this plan',
        snackPosition: SnackPosition.BOTTOM,
      );
      isLoading.value = false;
      return;
    }

    // Add new subscription
    subscriptions.add(mealPlan.toMap());

    // Save to storage
    await StorageService.saveSubscriptions(subscriptions);

    isLoading.value = false;

    // Show success message
    Get.snackbar(
      'Success',
      'Successfully subscribed to ${mealPlan.name}',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );

    // Navigate to subscriptions page
    Get.toNamed(AppRoutes.SUBSCRIPTIONS);
  }
}
