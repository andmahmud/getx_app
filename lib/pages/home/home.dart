import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 90),

            // Welcome Text
            const Text(
              'Welcome to Theory Test App!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),

            const Text(
              'Prepare for your driving theory test in your preferred language.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 30),

            // Home Illustration or Logo
            Image.asset(
              'assets/images/img4.png',
              height: size.height * 0.3,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 40),

            // Start Test Button
            ElevatedButton.icon(
              onPressed: () {
                // Get.toNamed(Routes.TESTPAGE); // Replace with your test route
              },
              icon: const Icon(Icons.play_arrow),
              label: const Text('Start Test'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Settings Button
            OutlinedButton.icon(
              onPressed: () {
                // Get.toNamed(Routes.SETTINGS); // Replace with your settings route
              },
              icon: const Icon(Icons.settings),
              label: const Text('Settings'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.blue,
                side: const BorderSide(color: Colors.blue),
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
