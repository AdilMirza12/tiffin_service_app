import 'package:get/get.dart';
import '../models/meal_plan.dart';
import '../services/storage_service.dart';

class SubscriptionsController extends GetxController {
  final subscriptions = <MealPlan>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadSubscriptions();
  }

  @override
  void onReady() {
    super.onReady();
    // Refresh when screen becomes visible
    loadSubscriptions();
  }

  void loadSubscriptions() {
    final data = StorageService.getSubscriptions();
    subscriptions.value = data.map((map) => MealPlan.fromMap(map)).toList();
  }

  Future<void> cancelPlan(String planId) async {
    // Get current subscriptions
    List<Map<String, dynamic>> currentSubs = StorageService.getSubscriptions();

    // Remove the plan
    currentSubs.removeWhere((sub) => sub['id'] == planId);

    // Save updated list
    await StorageService.saveSubscriptions(currentSubs);

    // Reload UI
    loadSubscriptions();

    // Show confirmation
    Get.snackbar(
      'Cancelled',
      'Plan cancelled successfully',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }
}
