import 'package:flutter/material.dart';
import '../../../core/resources/app_colors.dart';
import '../../home/ui/widgets/logout_dialog.dart';
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
  String language = "English";

  int notificationCount = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// APP BAR
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "More Screen",
          style: TextStyle(color: Colors.black),
        ),

        ///  NOTIFICATIONS WITH BADGE
        leading: Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications, color: Colors.black),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const NotificationsScreen(),
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
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    notificationCount.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),

        /// LOGOUT
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black),
            onPressed: () {
              showLogoutDialog(context);
            },
          ),
        ],
      ),

      /// BODY
      body: Column(
        children: [

          /// CHANGE LANGUAGE
          ListTile(
            leading: const Icon(
              Icons.language,
              color: AppColors.primaryColor,
            ),
            title: const Text("Change language"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  language,
                  style: const TextStyle(
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(width: 6),
                const Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
            onTap: () {
              setState(() {
                language =
                language == "English" ? "Arabic" : "English";
              });
            },
          ),

          const Divider(),

          /// NOTIFICATIONS SWITCH
          ListTile(
            leading: const Icon(
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

          const Divider(),

          /// TERMS
          ListTile(
            leading: const Icon(
              Icons.description,
              color: AppColors.primaryColor,
            ),
            title: const Text("Terms"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const TermsScreen(),
                ),
              );
            },

          ),

          const Divider(),

          ListTile(
            leading: const Icon(
              Icons.info,
              color: AppColors.primaryColor,
            ),
            title: const Text("About App"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AboutAppScreen(),
                ),
              );
            },

          ),
        ],
      ),
    );
  }
}
