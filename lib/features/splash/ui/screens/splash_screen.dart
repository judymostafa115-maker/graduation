import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../widgets/splash_body.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body:SplashBody() ,
    );
  }
}
