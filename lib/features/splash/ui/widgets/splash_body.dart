import 'package:flutter/material.dart';

import '../../../../core/resources/app_images.dart';
import '../../../login/ui/screens/login_screen.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with TickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<Offset> _slideAnimation1;
  late Animation<Offset> _slideAnimation2;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _slideAnimation1 = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _slideAnimation2 = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();

    /// Navigate after delay
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        ),
      );
    });

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
       Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            /// Logo animation
            SlideTransition(
              position: _slideAnimation1,
          // child: Container(
          //   width: 200,
          //   height: 100,
          //   decoration: BoxDecoration(
          //     image:DecorationImage(fit: BoxFit.fill,
          //         image: AssetImage(AppImages.logo) ),
          //   ),
          // ),
              child: Image.asset(
                AppImages.logo,
                width: 300,
                height: 300,
                fit: BoxFit.contain,
              ),

              ),




            const SizedBox(height: 15),


            SlideTransition(
              position: _slideAnimation2,
              child: const Text(
                "WELCOME",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
            ),
          ],
        ),
      );
  }
}
