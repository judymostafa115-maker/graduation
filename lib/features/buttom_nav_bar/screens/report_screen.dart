import 'package:flutter/material.dart';
import '../../../../core/resources/app_colors.dart';
import '../../home/data/model/patient_model.dart';
import '../../home/data/model/report_model.dart';
import '../../home/ui/widgets/report_item.dart';

class ReportsScreen extends StatelessWidget {
  final List<Patient> patients;
  const ReportsScreen({super.key,required this.patients});




  @override
  Widget build(BuildContext context) {
    int totalPatients = patients.length;

    int todayVisits = patients.where((p) {
      final today = DateTime.now();
      return p.birthDate.year == today.year &&
          p.birthDate.month == today.month &&
          p.birthDate.day == today.day;
    }).length;

    int diagnosesCount = patients
        .expand((p) => p.diagnoses)
        .toSet()
        .length;


    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          "Reports",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children:  [
            ReportItem(
              report: ReportModel(
                icon: Icons.people,
                title: "Total Patients",
                value: totalPatients.toString(),
              ),
            ),

            SizedBox(height: 16),

            ReportItem(
              report: ReportModel(
                icon: Icons.today,
                title: "Today Visits",
                value: "3",
              ),
            ),

            SizedBox(height: 16),

            ReportItem(
              report: ReportModel(
                icon: Icons.medical_information,
                title: "Common Diagnoses",
                value: "6",
              ),
            ),

            SizedBox(height: 16),

            ReportItem(
              report: ReportModel(
                icon: Icons.insights,
                title: "App Activity",
                value: "Active",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

