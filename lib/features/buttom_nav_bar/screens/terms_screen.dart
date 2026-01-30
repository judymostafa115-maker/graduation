import 'package:flutter/material.dart';
import '../../../core/resources/app_colors.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

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
          "Terms & Conditions",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [

            Text(
              "1. System Usage",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              "This system is intended to be used by licensed medical professionals only. "
                  "The doctor is responsible for all data entered into the system.",
            ),

            SizedBox(height: 16),

            Text(
              "2. Patient Data Confidentiality",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              "The doctor is fully responsible for maintaining the confidentiality of "
                  "patient information and using the system according to medical ethics.",
            ),

            SizedBox(height: 16),

            Text(
              "3. Accuracy of Information",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              "The system is used for organizational and record-keeping purposes only "
                  "and does not replace professional medical judgment.",
            ),

            SizedBox(height: 16),

            Text(
              "4. Responsibility",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              "The system developers are not responsible for any incorrect diagnosis, "
                  "treatment decisions, or misuse of the system.",
            ),

            SizedBox(height: 16),

            Text(
              "5. Updates",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              "The system may be updated or modified at any time to improve performance "
                  "or add new features.",
            ),
          ],
        ),
      ),
    );
  }
}
