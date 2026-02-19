# 🍱 Tiffin Service App

A strictly **offline-first** Flutter application designed to simulate a basic Tiffin Service booking system.

## 🛠 Tech Stack

* **Framework:** Flutter (Dart)
* **State Management:** GetX (Strictly required for state & dependency injection)
* **Routing:** GetX Named Routes (`Get.toNamed()`, No `Get.to(Page())`)
* **Local Database:** GetStorage (Key-Value storage)
* **API:** None (All data is mocked locally)

## 📁 Project Structure

```
lib/
├── main.dart                 # App entry point with GetX initialization
├── models/
│   └── meal_plan.dart        # MealPlan data model
├── controllers/
│   ├── auth_controller.dart      # Authentication logic
│   ├── home_controller.dart      # Home screen logic & meal plans
│   ├── details_controller.dart   # Meal details & subscription logic
│   └── subscriptions_controller.dart  # Subscriptions management
├── views/
│   ├── splash/
│   │   └── splash_view.dart     # Splash screen
│   ├── login/
│   │   └── login_view.dart      # Login screen
│   ├── home/
│   │   └── home_view.dart       # Home screen with meal plans list
│   ├── details/
│   │   └── details_view.dart    # Meal details screen
│   └── subscriptions/
│       └── subscriptions_view.dart  # My subscriptions screen
├── routes/
│   ├── app_routes.dart       # Route constants
│   └── app_pages.dart        # GetPage route definitions
└── services/
    └── storage_service.dart  # GetStorage wrapper service
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK
- Android Studio / VS Code with Flutter extensions

### Installation

1. **Install dependencies:**
   ```bash
   flutter pub get
   ```

2. **Run the app:**
   ```bash
   flutter run
   ```

3. **Build APK:**
   ```bash
   flutter build apk --debug
   ```

## 📱 Features

### ✅ Implemented Features

1. **Route Management**
   - Centralized `AppRoutes` file with route constants
   - `app_pages.dart` with `GetPage` definitions
   - Strict use of `Get.toNamed()` for navigation (no direct widget navigation)

2. **Authentication**
   - Login screen with username/password validation
   - Login state persisted using GetStorage
   - Auto-navigation on app launch based on login state
   - Logout functionality

3. **Home Screen**
   - List of meal plans (Veg Standard, Veg Premium, Non-Veg Standard, Non-Veg Premium)
   - Card-based UI with meal plan details
   - Navigation to details screen with meal data passed via `arguments`

4. **Details Screen**
   - Displays meal plan information
   - Menu items list
   - Price display
   - Subscribe functionality (saves to GetStorage)

5. **Subscriptions Screen**
   - Displays active subscriptions from GetStorage
   - Cancel plan functionality
   - Empty state handling

6. **Data Persistence**
   - Login state persists across app restarts
   - Subscriptions list persists across app restarts
   - Uses GetStorage for offline-first storage

## 🎯 Key Implementation Details

### Route Management
- All routes are defined in `app_routes.dart` as constants
- Route definitions in `app_pages.dart` use `GetPage`
- Controllers are lazy-loaded using `Get.lazyPut()` in bindings
- Navigation strictly uses `Get.toNamed()` with route names

### Data Passing
- Meal plan data passed from Home to Details using `Get.toNamed('/details', arguments: mealPlan)`
- Data retrieved in DetailsController using `Get.arguments`

### Storage
- `StorageService` wraps GetStorage operations
- Login state stored with key: `'isLoggedIn'`
- Subscriptions stored with key: `'my_subscriptions'`
- All storage operations are synchronous

## 📋 Evaluation Checklist

- ✅ **Named Routing:** Uses `Get.toNamed()` everywhere (no `Get.to(Page())`)
- ✅ **Argument Passing:** Correctly passes data between Home and Details using arguments
- ✅ **Code Structure:** Routes defined separately from `main.dart`
- ✅ **Storage:** Login state and subscription list persist after killing the app

## 🎨 UI Features

- Material Design 3
- Orange color scheme (Tiffin/restaurant theme)
- Card-based layouts
- Responsive design
- Loading states
- Empty states
- Snackbar notifications for user feedback

## 📝 Notes

- All data is mocked locally (no API calls)
- App is strictly offline-first
- GetStorage is used for all persistence needs
- Controllers use GetX reactive programming (`Rx` variables)

## 🔧 Development

### Adding New Routes

1. Add route constant to `app_routes.dart`
2. Add `GetPage` definition to `app_pages.dart`
3. Create view and controller files
4. Use `Get.toNamed()` for navigation

### Adding New Features

- Follow the existing architecture pattern
- Use GetX controllers for business logic
- Use GetStorage for persistence
- Keep views clean and focused on UI

---

**Good Luck! 🚀**
