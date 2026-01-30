import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../widgets/add_patient_body.dart';
class AddPatientScreen extends StatelessWidget {
  const AddPatientScreen({super.key});

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
          title: const Text("Add Your Patient",style: TextStyle(color: Colors.white),),
        ),
        body:AddPatientBody()

    );
  }
}
