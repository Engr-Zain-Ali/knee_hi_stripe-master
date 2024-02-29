/// This is the main.dart file of the Flutter project.
/// It imports various packages and defines the main function.
/// The main function initializes Firebase, sets up Stripe, and runs the app.
/// The app is wrapped in a MultiProvider to provide state management using ChangeNotifierProvider.
/// The app's root widget is MyApp, which is a MaterialApp with debug mode disabled and the home screen set to IntroScreen.
// ignore_for_file: dangling_library_doc_comments


import 'package:ecommmeranceeeee/intro_screen.dart';
import 'package:ecommmeranceeeee/l000ginn/Signip%20account.dart';
import 'package:ecommmeranceeeee/l000ginn/login.dart';
import 'package:ecommmeranceeeee/provider_statemanagement/main_screen_provider_pagechanger.dart';
import 'package:ecommmeranceeeee/views/CartPage.dart';
import 'package:ecommmeranceeeee/views/shared/kkkk.dart';
import 'package:ecommmeranceeeee/views/shared/product_provider.dart';
import 'package:ecommmeranceeeee/views/shared/show_all.dart';
import 'package:ecommmeranceeeee/views/ui/Shopping_Cart111.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';


void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // Set Stripe publishable key outside of Firebase.initializeApp
  // Stripe.publishableKey =
  //     'pk_test_51OS2npCAGgvyZHriUbIWJm9h2ipYoyjSvAzRMwOM9bUKzSWQPhXh4mtm5Yc5eJdO6X1mL4VESrymwy8DBZMfjC4k00yheRtUl0';
  // await Stripe.instance.applySettings();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => MainScreenNotifier(),
      ),
      ChangeNotifierProvider(
        create: (context) => ProductNotifier(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: IntroScreen());
  }
}
