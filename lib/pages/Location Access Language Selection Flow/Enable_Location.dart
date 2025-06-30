import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnableLocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final fontScale = width / 375;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.06),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/img7.png',
                  height: height * 0.32,
                  width: height * 0.32,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: height * 0.05),

                Text(
                  'Enable Location',
                  style: TextStyle(
                    fontSize: 24 * fontScale,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),

                Text(
                  'Kindly allow us to access your location to\nprovide you with suggestions for nearby salons.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14 * fontScale,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: height * 0.06),

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
                      Get.toNamed('/SelectLanguagePage');
                    },
                    child: const Text(
                      'Enable',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                TextButton(
                  onPressed: () => Get.toNamed('/SelectLanguagePage'),
                  child: const Text(
                    'Skip, Not Now',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
