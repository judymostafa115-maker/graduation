import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/features/auth/data/model/auth_model.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../../../core/resources/app_images.dart';
import '../../../../home/ui/screens/home_screen.dart';
import '../../../manager/auth_cubit.dart';
import '../../../manager/auth_state.dart';
import '../../../signup/ui/screens/signup_screen.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscureText = true;


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 60),

            Image.asset(
              AppImages.logo,
              width: 300,
              height: 300,
              fit: BoxFit.contain,
            ),

             SizedBox(height: 20),

            Text(
              "Medical App",
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

            /// email
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Email is required";
                }
                if (!value.contains("@")) {
                  return "Enter a valid email";
                }
                return null;
              },
            ),

            SizedBox(height: 18),

            /// Password
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Password is required";
                }
                if (value.length < 6) {
                  return "Password must be at least 6 characters";
                }
                return null;
              },
            ),

            SizedBox(height: 30),

            /// Login Button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return CircularProgressIndicator();
                  } else {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: state is AuthLoading
                          ? null
                          : () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthCubit>().login(
                            AuthModel(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                              name: '',
                              role: '',
                              address: '',
                            ),
                          );
                        }
                      },
                      child:  Text(
                        "Login",
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                  }
                },
              ),
            ),

            SizedBox(height: 18),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SignupScreen(),
                  ),
                );
              },
              child: Text.rich(
                TextSpan(
                  text: "Don’t have an account? ",
                  style: TextStyle(color: AppColors.textGrey),
                  children: [
                    TextSpan(
                      text: "Sign Up",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  }



