import 'package:flutter/material.dart';
import 'package:medical_app/features/buttom_nav_bar/screens/profile/widgets/profile_body.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../widgets/logout_dialog.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: const Text(
            "Profile",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.logout, color: Colors.white),
              onPressed: () {
                showLogoutDialog(context);
              },
            ),
          ],
        ),
        body:ProfileBody()
    );
  }
}
