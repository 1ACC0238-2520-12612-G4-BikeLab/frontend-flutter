import 'package:flutter/material.dart';
import 'screens/sign_in_screen.dart';
import 'theme/colors.dart';

void main() {
  runApp(const BikeLabApp());
}

class BikeLabApp extends StatelessWidget {
  const BikeLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BikeLab',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: BikeLabColors.limeGreen,
          secondary: BikeLabColors.mutedGreen,
          background: Colors.white,
          surface: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const SignInScreen(),
    );
  }
}
