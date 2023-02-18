import 'package:ecommerce_app/constant/constant.dart';
import 'package:ecommerce_app/view/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';


void main() {
  runApp(ProviderScope(child: const MyApp()));
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ecommerce app',
      debugShowCheckedModeBanner: false,
      navigatorKey: Grock.navigationKey, // added this line
      scaffoldMessengerKey: Grock.scaffoldMessengerKey, // added this line
      theme: ThemeData(
        scaffoldBackgroundColor: Constant.white,
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}

