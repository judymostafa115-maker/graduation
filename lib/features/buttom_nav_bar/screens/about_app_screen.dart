import 'package:flutter/material.dart';
import '../../../../core/resources/app_colors.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "About App",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [

            Text(
              "Medical Clinic System",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            Text(
              "This application is designed to help doctors manage "
                  "their clinics efficiently by organizing patient records, "
                  "appointments, and medical information in one place.",
              style: TextStyle(fontSize: 14),
            ),

            SizedBox(height: 20),

            Text(
              "Purpose",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 6),

            Text(
              "The system aims to simplify clinic workflow, improve "
                  "patient data organization, and support doctors in daily "
                  "clinical operations.",
            ),

            SizedBox(height: 20),

            Text(
              "Target User",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 6),

            Text(
              "This system is intended to be used by doctors as a clinic "
                  "management and patient record system.",
            ),

            SizedBox(height: 20),

            Text(
              "Version",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 6),

            Text("Version 1.0.0"),

            SizedBox(height: 30),

            Text(
              "This application was developed as part of an academic "
                  "project to demonstrate clinic management system design "
                  "and implementation.",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
