import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/features/auth/data/model/auth_model.dart';
import 'package:medical_app/features/auth/manager/auth_cubit.dart';

import '../../../../../core/resources/app_colors.dart';
import '../../../manager/auth_state.dart';

class SignupBody extends StatefulWidget {
  const SignupBody({super.key});

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();

  bool obscureText = true;
  String selectedRole = "Doctor";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
             SizedBox(height: 10),


             Text(
              "Create Account",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
            ),

            SizedBox(height: 4),

            Text(
              "Welcome To Our Application",
              style: TextStyle(
                fontSize: 13,
                color: AppColors.textGrey,
              ),
            ),
            SizedBox(height: 35),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Full Name",
                prefixIcon:
                 Icon(Icons.person, color: AppColors.primaryColor),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                  BorderSide(color: AppColors.fieldBorder),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                  BorderSide(color: AppColors.primaryColor),
                ),
              ),
              validator: (v) =>
              v == null || v.isEmpty ? "Name is required" : null,
            ),

            SizedBox(height: 18),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email",
                prefixIcon:
                 Icon(Icons.email, color: AppColors.primaryColor),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                  BorderSide(color: AppColors.fieldBorder),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                   BorderSide(color: AppColors.primaryColor),
                ),
              ),
              validator: (v) {
                if (v == null || v.isEmpty) return "Email is required";
                if (!v.contains("@")) return "Enter a valid email";
                return null;
              },
            ),

            SizedBox(height: 18),
            TextFormField(
              controller: passwordController,
              obscureText: obscureText,
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon:
                Icon(Icons.lock, color: AppColors.primaryColor),
                suffixIcon: IconButton(
                  icon: Icon(
                    obscureText
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppColors.primaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                  BorderSide(color: AppColors.fieldBorder),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                  BorderSide(color: AppColors.primaryColor),
                ),
              ),
              validator: (v) {
                if (v == null || v.isEmpty) {
                  return "Password is required";
                }
                if (v.length < 6) {
                  return "Password must be at least 6 characters";
                }
                return null;
              },
            ),

            SizedBox(height: 18),

            /// Address
            TextFormField(
              controller: addressController,
              decoration: InputDecoration(
                hintText: "Address",
                prefixIcon: Icon(Icons.location_on,
                    color: AppColors.primaryColor),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                  BorderSide(color: AppColors.fieldBorder),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                  BorderSide(color: AppColors.primaryColor),
                ),
              ),
              validator: (v) =>
              v == null || v.isEmpty ? "Address is required" : null,
            ),

            SizedBox(height: 18),


            DropdownButtonFormField<String>(
              value: selectedRole,
              decoration: InputDecoration(
                hintText: "Role",
                prefixIcon:
                Icon(Icons.work, color: AppColors.primaryColor),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                   BorderSide(color: AppColors.fieldBorder),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                  BorderSide(color: AppColors.primaryColor),
                ),
              ),
              items: [
                DropdownMenuItem(
                  value: "Doctor",
                  child: Text("Doctor"),
                ),
                DropdownMenuItem(
                  value: "Receptionist",
                  child: Text("Receptionist"),
                ),
              ],
              onChanged: (v) => setState(() => selectedRole = v!),
            ),

            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  if(state is AuthLoading){
                   return  CircularProgressIndicator();
                  }else{
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthCubit>().signup(
                            AuthModel(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(), name: '', role: '', address: '',
                            ),
                          );
                        }
                      },

                      child:  Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white

                        ),
                      ),
                    );

                  }

                },
              ),
            ),

             SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
