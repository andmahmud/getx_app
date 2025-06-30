import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Screens
import 'package:my_getx_app/pages/Sign In sign up/Sign_In.dart';
import 'package:my_getx_app/pages/Splash Screen/Onboarding.dart';
import 'package:my_getx_app/pages/Splash Screen/splash_screen.dart';

// Routes
import 'pages/Forgot Password Flow/Forgot_Password.dart';
import 'pages/Forgot Password Flow/Reset_Password.dart';
import 'pages/Forgot Password Flow/Success_Popup.dart';
import 'pages/Forgot Password Flow/Verify_Code.dart';
import 'pages/Location Access Language Selection Flow/Enable_Location.dart';
import 'pages/Location Access Language Selection Flow/Select_Language.dart';
import 'pages/Sign In sign up/Sign_Up.dart';
import 'pages/Sign In sign up/Success_Popup.dart';
import 'pages/home/home.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SPLASH,
      getPages: [
        GetPage(name: Routes.SPLASH, page: () => const SplashPage()),
        GetPage(name: Routes.ONBOARDING, page: () => const OnboardingPage()),
        GetPage(name: Routes.LOGIN, page: () => const SignInPage()),
        GetPage(name: Routes.SIGNUP, page: () => const SignUpPage()),
        GetPage(name: Routes.SUCCESSPOPUP, page: () => const SuccessPopup()),
        GetPage(name: Routes.FORGOTPASSWORD, page: () => ForgotPasswordPage()),
        GetPage(name: Routes.RESETPASSWORD, page: () => ResetPasswordPage()),
        GetPage(name: Routes.VERIFYCODE, page: () => VerifyCodePage()),
        GetPage(name: Routes.SUCCESSPOPUPPAGE, page: () => SuccessPopuppage()),
        GetPage(name: Routes.ENABLELOCATION, page: () => EnableLocationPage()),
        GetPage(name: Routes.LANGUAGE, page: () => SelectLanguagePage()),
        GetPage(name: Routes.HOME, page: () => HomePage()),
      ],
    ),
  );
}
