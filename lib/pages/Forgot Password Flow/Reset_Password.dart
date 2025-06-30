import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController newPassController = TextEditingController(
    text: 'password',
  );
  final TextEditingController confirmPassController = TextEditingController(
    text: 'password',
  );
  final _formKey = GlobalKey<FormState>();
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double fontScale = size.width / 375;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                SizedBox(height: size.height * 0.02),
               

                SizedBox(height: size.height * 0.06),

                Center(
                  child: Text(
                    'Reset Password',
                    style: TextStyle(
                      fontSize: 26 * fontScale,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    'Your password must be at least 8 characters\nand include letters, numbers & symbols.',
                    style: TextStyle(
                      fontSize: 14 * fontScale,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(height: size.height * 0.06),

                // New Password
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'New Password',
                    style: TextStyle(fontSize: 16 * fontScale),
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: newPassController,
                  obscureText: _obscureNew,
                  decoration: _inputDecoration().copyWith(
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureNew ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed:
                          () => setState(() => _obscureNew = !_obscureNew),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Please enter a new password.';
                    return null;
                  },
                ),

                SizedBox(height: 20),

                // Confirm Password
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Confirm Password',
                    style: TextStyle(fontSize: 16 * fontScale),
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: confirmPassController,
                  obscureText: _obscureConfirm,
                  decoration: _inputDecoration().copyWith(
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirm
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed:
                          () => setState(
                            () => _obscureConfirm = !_obscureConfirm,
                          ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Please confirm your password.';
                    if (value != newPassController.text)
                      return 'Passwords do not match.';
                    return null;
                  },
                ),

                SizedBox(height: 30),

                // Submit Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Get.toNamed('/VerifyCodePage');
                      }
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 16 * fontScale,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    );
  }
}
