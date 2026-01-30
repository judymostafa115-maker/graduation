import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../data/model/patient_model.dart';


class AddPatientBody extends StatefulWidget {
  const AddPatientBody({super.key});

  @override
  State<AddPatientBody> createState() => _AddPatientBodyState();
}

class _AddPatientBodyState extends State<AddPatientBody> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final diagnosisController = TextEditingController();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              /// NAME
              TextFormField(
                controller: nameController,
                decoration:
                const InputDecoration(labelText: "Patient Name"),
                validator: (v) =>
                v == null || v.isEmpty
                    ? "Please Enter Your Name"
                    : null,
              ),

              const SizedBox(height: 16),

              /// DATE PICKER
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Date Of Birth",
                  hintText: selectedDate == null
                      ? "Select Date"
                      : selectedDate
                      .toString()
                      .split(' ')[0],
                ),
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime.now(),
                  );

                  if (date != null) {
                    setState(() {
                      selectedDate = date;
                    });
                  }
                },
                validator: (_) => selectedDate == null
                    ? "Please Enter Your Birth Date"
                    : null,
              ),

              const SizedBox(height: 16),

              /// TIME PICKER
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Visit Time",
                  hintText: selectedTime == null
                      ? "Select Time"
                      : selectedTime!.format(context),
                ),
                onTap: () async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  if (time != null) {
                    setState(() {
                      selectedTime = time;
                    });
                  }
                },
                validator: (_) => selectedTime == null
                    ? "Please Enter Your Visit Time"
                    : null,
              ),

              const SizedBox(height: 16),

              /// ADDRESS
              TextFormField(
                controller: addressController,
                decoration:
                const InputDecoration(labelText: "Patient Address"),
                validator: (v) =>
                v == null || v.isEmpty
                    ? "Please Enter Your Address"
                    : null,
              ),

              const SizedBox(height: 16),

              /// DIAGNOSIS
              TextFormField(
                controller: diagnosisController,
                maxLines: 3,
                decoration:
                const InputDecoration(labelText: "Patient Diagnosis"),
                validator: (v) =>
                v == null || v.isEmpty
                    ? "Please Enter Your Diagnosis"
                    : null,
              ),

              const SizedBox(height: 30),

              /// ADD BUTTON
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(
                        context,
                        Patient(
                          name: nameController.text,
                          birthDate: selectedDate!,
                          address: addressController.text,
                          diagnoses: [diagnosisController.text],

                        ),
                      );
                    }
                  },
                  child: const Text("Add"),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
