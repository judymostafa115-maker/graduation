import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../buttom_nav_bar/screens/more/more_screen.dart';
import '../../../buttom_nav_bar/screens/profile/screen/profile_screen.dart';
import '../../../buttom_nav_bar/screens/report/report_screen.dart';
import '../../manager/patient_cubit.dart';
import '../../manager/patient_state.dart';
import '../widgets/home_body.dart';
import 'add_patient_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchQuery = "";
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// ================= APP BAR =================
      appBar: currentIndex == 0
          ? AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: const Text(
          "Patients",
          style: TextStyle(color: Colors.white),
        ),
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

      /// ================= BODY =================
      body: BlocBuilder<PatientCubit, PatientState>(
        builder: (context, state) {
          /// لو مش في Home
          if (currentIndex != 0) {
            if (currentIndex == 1) {
              if (state is PatientLoaded) {
                return ReportsScreen(patients: state.patients);
              }
              return const SizedBox();
            }

            if (currentIndex == 2) {
              return const ProfileScreen();
            }

            return const MoreScreen();
          }

          /// ====== HOME TAB ======
          if (state is PatientLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is PatientLoaded) {
            final filteredPatients = state.patients
                .where((p) => p.name
                .toLowerCase()
                .contains(searchQuery.toLowerCase()))
                .toList();

            return HomeBody(patients: filteredPatients);
          }

          if (state is PatientError) {
            return Center(
              child: Text(state.message),
            );
          }

          return const SizedBox();
        },
      ),

      /// ================= FLOATING BUTTON =================
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,

      floatingActionButton: currentIndex == 0
          ? FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddPatientScreen(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          size: 28,
          color: Colors.white,
        ),
      )
          : null,

      /// ================= BOTTOM NAV =================
      bottomNavigationBar: BottomAppBar(
        color: AppColors.primaryColor,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navItem(Icons.home, "Home", 0),
              _navItem(Icons.insert_chart, "Reports", 1),
              const SizedBox(width: 40),
              _navItem(Icons.person, "Profile", 2),
              _navItem(Icons.more_horiz, "More", 3),
            ],
          ),
        ),
      ),
    );
  }

  /// ================= NAV ITEM WIDGET =================
  Widget _navItem(IconData icon, String title, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: currentIndex == index
                ? Colors.white
                : Colors.white70,
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: currentIndex == index
                  ? Colors.white
                  : Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
