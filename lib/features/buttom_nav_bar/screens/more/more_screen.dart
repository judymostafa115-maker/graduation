import 'package:flutter/material.dart';
import '../../../../core/resources/app_colors.dart';
import '../../widgets/logout_dialog.dart';
import 'about_app_screen.dart';
import 'notification_screen.dart';
import 'terms_screen.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  bool notificationsEnabled = true;
  int notificationCount = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title:  Text(
          "More Screen",
          style: TextStyle(color: Colors.black),
        ),

        leading: Stack(
          children: [
            IconButton(
              icon:  Icon(Icons.notifications, color: Colors.black),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => NotificationsScreen(),
                  ),
                );

                setState(() {
                  notificationCount = 0;
                });
              },
            ),

            if (notificationCount > 0)
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  padding:EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    notificationCount.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),

        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.black),
            onPressed: () {
              showLogoutDialog(context);
            },
          ),
        ],
      ),

      body: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.notifications_active,
              color: AppColors.primaryColor,
            ),
            title: const Text("Allow Notifications"),
            trailing: Switch(
              value: notificationsEnabled,
              activeColor: AppColors.primaryColor,
              onChanged: (value) {
                setState(() {
                  notificationsEnabled = value;
                });
              },
            ),
          ),

          //Divider(),


          ListTile(
            leading: const Icon(
              Icons.description,
              color: AppColors.primaryColor,
            ),
            title:  Text("Terms"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TermsScreen(),
                ),
              );
            },
          ),

          //Divider(),


          ListTile(
            leading: Icon(
              Icons.info,
              color: AppColors.primaryColor,
            ),
            title:  Text("About App"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>  AboutAppScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
