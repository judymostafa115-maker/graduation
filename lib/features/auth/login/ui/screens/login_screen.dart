import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/ui/screens/home_screen.dart';
import '../../../manager/auth_cubit.dart';
import '../../../manager/auth_state.dart';
import '../widgets/login_body.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {

        if (state is AuthSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) =>  HomeScreen()),
          );
        }

        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("User Not Found")),
          );
        }
      },

      child:  Scaffold(
        backgroundColor: Colors.white,
        body: LoginBody(),
      ),
    );
  }
}
