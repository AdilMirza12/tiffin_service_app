import 'package:get/get.dart';
import '../models/meal_plan.dart';
import '../routes/app_routes.dart';

class HomeController extends GetxController {
  final mealPlans = <MealPlan>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadMealPlans();
  }

  void loadMealPlans() {
    // Dummy data for meal plans
    mealPlans.value = [
      MealPlan(
        id: '1',
        name: 'Veg Standard',
        description: 'Delicious vegetarian meals with daily variety',
        type: 'Veg',
        category: 'Standard',
        price: 1200.0,
        imageUrl: 'https://via.placeholder.com/300x200?text=Veg+Standard',
        menuItems: [
          'Dal Rice',
          'Sabzi Roti',
          'Salad',
          'Pickle',
          'Sweet Dish',
        ],
      ),
      MealPlan(
        id: '2',
        name: 'Veg Premium',
        description: 'Premium vegetarian meals with gourmet options',
        type: 'Veg',
        category: 'Premium',
        price: 1800.0,
        imageUrl: 'https://via.placeholder.com/300x200?text=Veg+Premium',
        menuItems: [
          'Paneer Curry',
          'Special Dal',
          'Naan/Roti',
          'Fresh Salad',
          'Raita',
          'Dessert',
        ],
      ),
      MealPlan(
        id: '3',
        name: 'Non-Veg Standard',
        description: 'Tasty non-vegetarian meals for meat lovers',
        type: 'Non-Veg',
        category: 'Standard',
        price: 1500.0,
        imageUrl: 'https://via.placeholder.com/300x200?text=Non-Veg+Standard',
        menuItems: [
          'Chicken Curry',
          'Rice',
          'Roti',
          'Salad',
          'Pickle',
        ],
      ),
      MealPlan(
        id: '4',
        name: 'Non-Veg Premium',
        description: 'Premium non-vegetarian meals with exotic dishes',
        type: 'Non-Veg',
        category: 'Premium',
        price: 2200.0,
        imageUrl: 'https://via.placeholder.com/300x200?text=Non-Veg+Premium',
        menuItems: [
          'Mutton Curry',
          'Biryani',
          'Naan',
          'Salad',
          'Raita',
          'Ice Cream',
        ],
      ),
    ];
  }

  void navigateToDetails(MealPlan mealPlan) {
    Get.toNamed(AppRoutes.DETAILS, arguments: mealPlan);
  }
}
