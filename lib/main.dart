import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:medical_app/features/auth/login/ui/screens/login_screen.dart';
import 'package:medical_app/features/home/ui/screens/home_screen.dart';
import 'features/auth/manager/auth_cubit.dart';
import 'features/home/manager/patient_cubit.dart';
import 'firebase_options.dart';
import 'features/buttom_nav_bar/screens/profile/manager/profile_cubit.dart';
import 'features/splash/ui/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(DevicePreview(builder: (context)=>MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => ProfileCubit()),
        BlocProvider(create: (_) => PatientCubit()),


      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}

