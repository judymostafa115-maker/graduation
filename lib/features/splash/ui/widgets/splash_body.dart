import 'package:flutter/material.dart';

import '../../../../core/resources/app_images.dart';
import '../../../auth/login/ui/screens/login_screen.dart';

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
      duration:  Duration(seconds: 2),
    );

    _slideAnimation1 = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _slideAnimation2 = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();

    /// Navigate after delay
    Future.delayed( Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => LoginScreen(),
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

              child: Image.asset(
                AppImages.logo,
                width: 300,
                height: 300,
                fit: BoxFit.contain,
              ),

              ),

            SizedBox(height: 15),
            SlideTransition(
              position: _slideAnimation2,
              child:  Text(
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
