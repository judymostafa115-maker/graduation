import 'package:flutter/material.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../buttom_nav_bar/screens/more_screen.dart';
import '../../../buttom_nav_bar/screens/profile_screen.dart';
import '../../../buttom_nav_bar/screens/report_screen.dart';
import '../../data/model/patient_model.dart';
import '../widgets/home_body.dart';
import 'add_patient_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Patient> patients = [];
  String searchQuery = "";

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final filteredPatients = patients
        .where(
          (p) => p.name.toLowerCase().contains(searchQuery.toLowerCase()),
    )
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,

      /// APP BAR
      appBar: currentIndex == 0
          ? AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          "Patients",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search patient...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
        ),
      )
          : null,


      body: currentIndex == 0
          ? HomeBody(patients: filteredPatients)
          : currentIndex == 1
          ? ReportsScreen(patients: patients)
          : currentIndex == 2
          ? const ProfileScreen()
          : const MoreScreen(),

      /// PLUS BUTTON
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,

      floatingActionButton: currentIndex == 0
          ? FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddPatientScreen(),
            ),
          );

          if (result != null && result is Patient) {
            setState(() {
              patients.add(result);
            });
          }
        },
        child: const Icon(Icons.add,
            size: 28, color: Colors.white),
      )
          : null,

      /// BOTTOM BAR
      bottomNavigationBar: BottomAppBar(
        color: AppColors.primaryColor,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              /// HOME
              InkWell(
                onTap: () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.home,
                        color: currentIndex == 0
                            ? Colors.white
                            : Colors.white70),
                    const SizedBox(height: 4),
                    Text(
                      "Home",
                      style: TextStyle(
                        fontSize: 12,
                        color: currentIndex == 0
                            ? Colors.white
                            : Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),

              /// REPORTS
              InkWell(
                onTap: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.insert_chart,
                        color: currentIndex == 1
                            ? Colors.white
                            : Colors.white70),
                    const SizedBox(height: 4),
                    Text(
                      "Reports",
                      style: TextStyle(
                        fontSize: 12,
                        color: currentIndex == 1
                            ? Colors.white
                            : Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 40),

              /// PROFILE
              InkWell(
                onTap: () {
                  setState(() {
                    currentIndex = 2;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.person,
                        color: currentIndex == 2
                            ? Colors.white
                            : Colors.white70),
                    const SizedBox(height: 4),
                    Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 12,
                        color: currentIndex == 2
                            ? Colors.white
                            : Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),

              /// MORE
              InkWell(
                onTap: () {
                  setState(() {
                    currentIndex = 3;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.more_horiz,
                        color: currentIndex == 3
                            ? Colors.white
                            : Colors.white70),
                    const SizedBox(height: 4),
                    Text(
                      "More",
                      style: TextStyle(
                        fontSize: 12,
                        color: currentIndex == 3
                            ? Colors.white
                            : Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
