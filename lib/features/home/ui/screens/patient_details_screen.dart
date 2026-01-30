import 'package:flutter/material.dart';
import '../../../../core/resources/app_colors.dart';
import '../../data/model/patient_model.dart';
import '../widgets/patient_details_body.dart';

class PatientDetailsScreen extends StatefulWidget {
  final Patient patient;

  const PatientDetailsScreen({super.key, required this.patient});

  @override
  State<PatientDetailsScreen> createState() =>
      _PatientDetailsScreenState();
}

class _PatientDetailsScreenState
    extends State<PatientDetailsScreen> {
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
        title: const Text("Details",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: PatientDetailsBody(
        patient: widget.patient,
        onUpdate: () {
          setState(() {});
        },
      ),
    );
  }
}
