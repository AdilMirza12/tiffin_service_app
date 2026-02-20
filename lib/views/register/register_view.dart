import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Header Section
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.orange.shade400,
                          Colors.orange.shade600
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.orange.withOpacity(0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.person_add_alt_1_rounded,
                      size: 48,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 28),
                  const Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Join us for fresh meal deliveries',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade600,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 36),
                  // First Name Field
                  TextFormField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      prefixIcon: Icon(Icons.badge_outlined,
                          color: Colors.orange.shade600),
                      prefixIconConstraints: const BoxConstraints(minWidth: 48),
                    ),
                    validator: (value) =>
                        (value == null || value.trim().isEmpty)
                            ? 'Please enter first name'
                            : null,
                    onChanged: (v) =>
                        authController.firstNameController.value = v,
                  ),
                  const SizedBox(height: 18),
                  // Last Name Field
                  TextFormField(
                    controller: _lastNameController,
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                      prefixIcon: Icon(Icons.badge_rounded,
                          color: Colors.orange.shade600),
                      prefixIconConstraints: const BoxConstraints(minWidth: 48),
                    ),
                    validator: (value) =>
                        (value == null || value.trim().isEmpty)
                            ? 'Please enter last name'
                            : null,
                    onChanged: (v) =>
                        authController.lastNameController.value = v,
                  ),
                  const SizedBox(height: 18),
                  // Email Field
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      prefixIcon: Icon(Icons.email_outlined,
                          color: Colors.orange.shade600),
                      prefixIconConstraints: const BoxConstraints(minWidth: 48),
                    ),
                    validator: (value) =>
                        (value == null || value.trim().isEmpty)
                            ? 'Please enter email'
                            : null,
                    onChanged: (v) => authController.emailController.value = v,
                  ),
                  const SizedBox(height: 18),
                  // Phone Number Field
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      hintText: '+91XXXXXXXXXX',
                      prefixIcon: Icon(Icons.phone_outlined,
                          color: Colors.orange.shade600),
                      prefixIconConstraints: const BoxConstraints(minWidth: 48),
                    ),
                    validator: (value) =>
                        (value == null || value.trim().isEmpty)
                            ? 'Please enter phone number'
                            : null,
                    onChanged: (v) => authController.phoneController.value = v,
                  ),
                  const SizedBox(height: 32),
                  // Register Button
                  Obx(
                    () => SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: authController.isLoading.value
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  authController.register();
                                }
                              },
                        child: authController.isLoading.value
                            ? const SizedBox(
                                height: 24,
                                width: 24,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                  strokeWidth: 2.5,
                                ),
                              )
                            : const Text(
                                'Create Account',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                ),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Login Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.orange.shade600,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.orange.shade600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
