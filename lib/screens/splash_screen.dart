import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  void init() async {
    await Future.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    context.go("/userfinder");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        "assets/splash.gif",
        fit: BoxFit.fitHeight,
        height: double.maxFinite,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_forward_ios),
          onPressed: () {
            context.go("/userfinder");
          }),
    );
  }
}
