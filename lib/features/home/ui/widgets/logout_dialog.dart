import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../login/ui/screens/login_screen.dart';


void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text("Logout"),
      content: const Text("Do you want to logout?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); // close dialog
          },
          child: const Text("Cancel",style: TextStyle(color: Colors.white),),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (_) => const LoginScreen(),
              ),
                  (route) => false,
            );
          },
          child: const Text(
            "OK",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  );
}
