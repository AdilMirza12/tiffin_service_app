import 'package:get_storage/get_storage.dart';

class StorageService {
  static final GetStorage _box = GetStorage();

  // Initialize storage
  static Future<void> init() async {
    await GetStorage.init();
  }

  // Login state
  static bool get isLoggedIn => _box.read('isLoggedIn') ?? false;
  static Future<void> setLoggedIn(bool value) => _box.write('isLoggedIn', value);
  static Future<void> clearLogin() => _box.remove('isLoggedIn');

  // Register state + profile
  static bool get isRegisteredIn => _box.read('isRegisteredIn') ?? false;
  static Future<void> setRegisteredIn(bool value) =>
      _box.write('isRegisteredIn', value);
  static Future<void> saveRegisteredProfile(Map<String, dynamic> profile) =>
      _box.write('registered_profile', profile);
  static Map<String, dynamic>? get registeredProfile {
    final data = _box.read('registered_profile');
    if (data == null) return null;
    return Map<String, dynamic>.from(data);
  }

  static Future<void> clearRegister() async {
    await _box.remove('isRegisteredIn');
    await _box.remove('registered_profile');
  }

  // Subscriptions
  static List<Map<String, dynamic>> getSubscriptions() {
    final data = _box.read('my_subscriptions');
    if (data == null) return [];
    return List<Map<String, dynamic>>.from(data);
  }

  static Future<void> saveSubscriptions(List<Map<String, dynamic>> subscriptions) {
    return _box.write('my_subscriptions', subscriptions);
  }

  static Future<void> clearSubscriptions() {
    return _box.remove('my_subscriptions');
  }
}
