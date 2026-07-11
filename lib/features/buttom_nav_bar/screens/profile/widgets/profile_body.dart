import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../model/profile_model.dart';
import '../manager/profile_cubit.dart';
import '../manager/profile_state.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final roleController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getUserData();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    roleController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Profile updated successfully"),
              backgroundColor: AppColors.primaryColor,
            ),
          );
        }

        if (state is ProfileError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }

        if (state is ProfileLoaded) {
          nameController.text = state.user.name;
          emailController.text = state.user.email;
          roleController.text = state.user.role;
          addressController.text = state.user.address;
        }
      },
      builder: (context, state) {
        if (state is ProfileLoading) {
          return Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          padding:EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("images/removeBackLogo.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),


                SizedBox(height: 20),


                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Name",
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (v) =>
                  v == null || v.isEmpty ? "Required" : null,
                ),

                SizedBox(height: 12),


                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (v) =>
                  v == null || v.isEmpty ? "Required" : null,
                ),

                SizedBox(height: 12),


                TextFormField(
                  controller: roleController,
                  decoration: InputDecoration(
                    labelText: "Role",
                    prefixIcon: Icon(Icons.work),
                  ),
                ),

                SizedBox(height: 12),

                TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(
                    labelText: "Address",
                    prefixIcon: Icon(Icons.location_on),
                  ),
                ),

                SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<ProfileCubit>().updateProfile(
                          ProfileModel(
                            name: nameController.text.trim(),
                            email: emailController.text.trim(),
                            role: roleController.text.trim(),
                            address: addressController.text.trim(),
                          ),
                        );
                      }
                    },
                    child: Text(
                      "Update",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
