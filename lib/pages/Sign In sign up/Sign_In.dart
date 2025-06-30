import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_app/routes/app_routes.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _obscurePassword = true;
  bool _rememberMe = false;

  final _emailController = TextEditingController(text: 'pristia@gmail.com');
  final _passwordController = TextEditingController(text: 'password');
  final _formKey = GlobalKey<FormState>();

  void _togglePasswordVisibility() {
    setState(() => _obscurePassword = !_obscurePassword);
  }

 

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fontScale = size.width / 375;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(), // dismiss keyboard
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  SizedBox(height: size.height * 0.05),

                  // Logo & Welcome
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/img4.png',
                        height: size.height * 0.22,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Welcome Back!',
                        style: TextStyle(
                          fontSize: 22 * fontScale,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Please log in first to start your Theory Test.',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14 * fontScale,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),

                  SizedBox(height: size.height * 0.05),

                  // Email Field
                  _buildLabel('Email Address', fontScale),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: const [AutofillHints.email],
                    decoration: _inputDecoration(),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your email.';
                      } else if (!value.contains('@') || !value.contains('.')) {
                        return 'Enter a valid email address.';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // Password Field
                  _buildLabel('Password', fontScale),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    autofillHints: const [AutofillHints.password],
                    decoration: _inputDecoration().copyWith(
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
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters.';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 12),

                  // Remember & Forgot
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: _rememberMe,
                            onChanged: (val) =>
                                setState(() => _rememberMe = val ?? false),
                            activeColor: Colors.blue,
                          ),
                          const Text('Remember Me'),
                        ],
                      ),
                      TextButton(
                        onPressed: () => Get.toNamed(Routes.FORGOTPASSWORD),
                        child: const Text('Forgot Password?'),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Sign In Button
                  ElevatedButton(
                    onPressed: () => Get.toNamed(Routes.HOME),
                  
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Create Account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('New to Theory Test? '),
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.SIGNUP),
                        child: const Text(
                          'Create Account',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text, double scale) {
    return Text(
      text,
      style: TextStyle(fontSize: 16 * scale, fontWeight: FontWeight.w500),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    );
  }
}
