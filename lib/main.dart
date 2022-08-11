import 'package:flutter/material.dart';
import 'package:mobile_app_corvit/SocialHomeScreen.dart';
import 'package:mobile_app_corvit/firebaseLogin.dart';
import 'package:mobile_app_corvit/foodOnboardingScreen.dart';
import 'package:mobile_app_corvit/homeScreen.dart';
import 'package:mobile_app_corvit/medicalHomeScrreen.dart';
import 'package:mobile_app_corvit/realtime_firbase.dart';
import 'package:mobile_app_corvit/registerScreen.dart';
import 'package:mobile_app_corvit/sampleScreen.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:mobile_app_corvit/shoppingCart.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginScreen(),
  ));
}


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(
          'assets/images/perfume.png'),
      title: Text(
        "SHOPPING APP",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      showLoader: true,
      loadingText: Text("Loading..."),
      navigator: OnBoardingScreen(),
      durationInSeconds: 5,
    );
  }
}






