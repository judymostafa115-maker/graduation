import 'package:flutter/material.dart';
import '../../../../core/resources/app_colors.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      "New patient added",
      "Appointment updated",
      "Profile updated successfully",
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          "Notifications",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: notifications.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(
              Icons.notifications,
              color: AppColors.primaryColor,
            ),
            title: Text(notifications[index]),
            subtitle: const Text("Just now"),
          );
        },
      ),
    );
  }
}
