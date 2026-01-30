import 'package:flutter/material.dart';
import '../../../../core/resources/app_colors.dart';

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
            const SizedBox(height: 10),

            /// Title
            const Text(
              "Create Account",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
            ),

            const SizedBox(height: 4),

            const Text(
              "Welcome To Our Application",
              style: TextStyle(
                fontSize: 13,
                color: AppColors.textGrey,
              ),
            ),

            const SizedBox(height: 35),

            /// Full Name
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Full Name",
                prefixIcon:
                const Icon(Icons.person, color: AppColors.primaryColor),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                  const BorderSide(color: AppColors.fieldBorder),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                  const BorderSide(color: AppColors.primaryColor),
                ),
              ),
              validator: (v) =>
              v == null || v.isEmpty ? "Name is required" : null,
            ),

            const SizedBox(height: 18),

            /// Email
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email",
                prefixIcon:
                const Icon(Icons.email, color: AppColors.primaryColor),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                  const BorderSide(color: AppColors.fieldBorder),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                  const BorderSide(color: AppColors.primaryColor),
                ),
              ),
              validator: (v) {
                if (v == null || v.isEmpty) return "Email is required";
                if (!v.contains("@")) return "Enter a valid email";
                return null;
              },
            ),

            const SizedBox(height: 18),

            /// Password
            TextFormField(
              controller: passwordController,
              obscureText: obscureText,
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon:
                const Icon(Icons.lock, color: AppColors.primaryColor),
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
                  const BorderSide(color: AppColors.fieldBorder),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                  const BorderSide(color: AppColors.primaryColor),
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

            const SizedBox(height: 18),

            /// Address
            TextFormField(
              controller: addressController,
              decoration: InputDecoration(
                hintText: "Address",
                prefixIcon: const Icon(Icons.location_on,
                    color: AppColors.primaryColor),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                  const BorderSide(color: AppColors.fieldBorder),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                  const BorderSide(color: AppColors.primaryColor),
                ),
              ),
              validator: (v) =>
              v == null || v.isEmpty ? "Address is required" : null,
            ),

            const SizedBox(height: 18),

            /// Role
            DropdownButtonFormField<String>(
              value: selectedRole,
              decoration: InputDecoration(
                hintText: "Role",
                prefixIcon:
                const Icon(Icons.work, color: AppColors.primaryColor),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                  const BorderSide(color: AppColors.fieldBorder),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                  const BorderSide(color: AppColors.primaryColor),
                ),
              ),
              items: const [
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

            const SizedBox(height: 30),

            /// Sign Up Button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context);
                  }
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color:Colors.white

                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
