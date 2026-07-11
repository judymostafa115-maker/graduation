import 'package:flutter/material.dart';
import '../../../../../core/resources/app_colors.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Notifications",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: notifications.length,
        separatorBuilder: (_, __) => Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(
              Icons.notifications,
              color: AppColors.primaryColor,
            ),
            title: Text(notifications[index]),
            subtitle:  Text("Just now"),
          );
        },
      ),
    );
  }
}
