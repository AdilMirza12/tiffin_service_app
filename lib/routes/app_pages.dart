import 'package:get/get.dart';
import 'app_routes.dart';
import '../views/splash/splash_view.dart';
import '../views/register/register_view.dart';
import '../views/login/login_view.dart';
import '../views/home/home_view.dart';
import '../views/details/details_view.dart';
import '../views/subscriptions/subscriptions_view.dart';
import '../controllers/auth_controller.dart';
import '../controllers/home_controller.dart';
import '../controllers/details_controller.dart';
import '../controllers/subscriptions_controller.dart';

class AppPages {
  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => AuthController());
      }),
    ),
    GetPage(
      name: AppRoutes.REGISTER,
      page: () => RegisterView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => AuthController());
      }),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => AuthController());
      }),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomeView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => AuthController());
        Get.lazyPut(() => HomeController());
      }),
    ),
    GetPage(
      name: AppRoutes.DETAILS,
      page: () => const DetailsView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => DetailsController());
      }),
    ),
    GetPage(
      name: AppRoutes.SUBSCRIPTIONS,
      page: () => const SubscriptionsView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => SubscriptionsController());
      }),
    ),
  ];
}
