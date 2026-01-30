import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../data/model/patient_model.dart';
import '../screens/patient_details_screen.dart';


class HomeBody extends StatelessWidget {
  final List<Patient> patients;

  const HomeBody({super.key, required this.patients});

  @override
  Widget build(BuildContext context) {
    if (patients.isEmpty) {
      return const Center(child: Text("No Patients Found"));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: patients.length,
      itemBuilder: (context, index) {
        final patient = patients[index];

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    PatientDetailsScreen(patient: patient),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.primaryColor,
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 4)
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  patient.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),


                Text(
                  "Birth Date: ${patient.birthDate.toString().split(' ')[0]}",
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  "Diagnosis: ${patient.diagnoses.isNotEmpty ? patient.diagnoses.first : "No diagnosis"}",
                  style: const TextStyle(fontSize: 14),
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}
