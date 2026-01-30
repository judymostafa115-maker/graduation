import 'package:flutter/material.dart';
import '../../../../core/resources/app_colors.dart';
import '../../data/model/patient_model.dart';

class PatientDetailsBody extends StatefulWidget {
  final Patient patient;
  final VoidCallback onUpdate;

  const PatientDetailsBody({
    super.key,
    required this.patient,
    required this.onUpdate,
  });

  @override
  State<PatientDetailsBody> createState() =>
      _PatientDetailsBodyState();
}

class _PatientDetailsBodyState
    extends State<PatientDetailsBody> {
  final TextEditingController diagnosisController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          /// IMAGE
          const CircleAvatar(
            radius: 55,
            backgroundImage: AssetImage("images/doctor.png"),
          ),

          const SizedBox(height: 20),

          /// TITLE
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Some Information :",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 12),

          /// CARD
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              children: [
                /// NAME
                Row(
                  children: [
                    const Icon(Icons.person),
                    const SizedBox(width: 10),
                    Text(widget.patient.name),
                  ],
                ),

                const SizedBox(height: 8),

                /// ADDRESS
                Row(
                  children: [
                    const Icon(Icons.location_on),
                    const SizedBox(width: 10),
                    Text(widget.patient.address),
                  ],
                ),

                const SizedBox(height: 8),

                /// DATE
                Row(
                  children: [
                    const Icon(Icons.calendar_today),
                    const SizedBox(width: 10),
                    Text(
                      widget.patient.birthDate
                          .toString()
                          .split(' ')[0],
                    ),
                  ],
                ),

                const Divider(height: 25),

                /// DIAGNOSIS HEADER + PLUS
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Diagnosis",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.add,
                        color: AppColors.primaryColor,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title:
                            const Text("Add Diagnosis"),
                            content: TextField(
                              controller:
                              diagnosisController,
                              decoration:
                              const InputDecoration(
                                hintText:
                                "Enter diagnosis",
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child:
                                const Text("Cancel"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (diagnosisController
                                      .text.isNotEmpty) {
                                    setState(() {
                                      widget.patient
                                          .diagnoses
                                          .add(
                                        diagnosisController
                                            .text,
                                      );
                                      diagnosisController
                                          .clear();
                                    });
                                  }
                                  Navigator.pop(context);
                                },
                                child: const Text("Add"),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),

                /// DIAGNOSIS LIST
                Column(
                  children: widget.patient.diagnoses
                      .map(
                        (d) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.check_circle,
                            color:
                            AppColors.primaryColor,
                          ),
                          const SizedBox(width: 10),
                          Text(d),
                        ],
                      ),
                    ),
                  )
                      .toList(),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          /// UPDATE BUTTON
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                widget.onUpdate();
                Navigator.pop(context);
              },
              child: const Text(
                "Update",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
