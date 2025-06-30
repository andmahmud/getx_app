import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Success_Popup.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscurePassword = true;

  final _emailController = TextEditingController(text: 'pristia@gmail.com');
  final _fullNameController = TextEditingController(text: 'Pristia Candra');
  final _passwordController = TextEditingController(text: 'password');

  final _formKey = GlobalKey<FormState>();

  double _passwordStrength = 0;

  void _checkPasswordStrength(String password) {
    double strength = 0;
    if (password.length >= 8) strength += 0.5;
    if (RegExp(r'[A-Za-z]').hasMatch(password)) strength += 0.25;
    if (RegExp(r'\d').hasMatch(password)) strength += 0.25;

    setState(() {
      _passwordStrength = strength.clamp(0, 1);
    });
  }

  Color get strengthColor {
    if (_passwordStrength <= 0.3) return Colors.red;
    if (_passwordStrength <= 0.7) return Colors.orange;
    return Colors.green;
  }

  String get strengthLabel {
    if (_passwordStrength <= 0.3) return 'Weak';
    if (_passwordStrength <= 0.7) return 'Medium';
    return 'Strong';
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  void initState() {
    super.initState();
    _checkPasswordStrength(_passwordController.text);
    _passwordController.addListener(() {
      _checkPasswordStrength(_passwordController.text);
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _fullNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                'Welcome to Eduline',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Let’s join to Eduline learning ecosystem & meet our professional mentor. It’s Free!',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 30),

              // Email
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Email Address', style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: _inputDecoration(''),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email.';
                      } else if (!value.contains('@')) {
                        return 'Enter a valid email address.';
                      }
                      return null;
                    },
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Full Name
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Full Name', style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _fullNameController,
                    keyboardType: TextInputType.name,
                    decoration: _inputDecoration(''),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name.';
                      }
                      return null;
                    },
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Password
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Password', style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: _inputDecoration('').copyWith(
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: _togglePasswordVisibility,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password.';
                      } else if (value.length < 8) {
                        return 'Password must be at least 8 characters.';
                      }
                      return null;
                    },
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // Password Strength Bar + Label
              Row(
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value: _passwordStrength,
                      backgroundColor: Colors.grey[300],
                      color: strengthColor,
                      minHeight: 6,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(strengthLabel, style: TextStyle(color: strengthColor)),
                ],
              ),

              const SizedBox(height: 8),

              Row(
                children: const [
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.green,
                    child: Icon(Icons.done, size: 14, color: Colors.white),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'At least 8 characters with a combination of letters and numbers',
                      style: TextStyle(color: Colors.green, fontSize: 15),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 50),

              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      barrierColor: Colors.black.withOpacity(0.4),
                      builder: (context) => const SuccessPopup(),
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account? '),
                  GestureDetector(
                    onTap: () {
                      Get.offNamed('/login');
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    );
  }
}
