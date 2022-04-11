import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      redirectToHomePage();
    });
    super.initState();
  }

  redirectToHomePage() async {
    /// TODO if user didn't connect himself
    await Future.delayed(const Duration(milliseconds: 100),() {
      Navigator.pushNamedAndRemoveUntil(
        context,
        "/",
        (Route<dynamic> route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          image:  DecorationImage(
            image: ExactAssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png'),
            const SizedBox(height: 10,),
            const Text("Turn your life into NFTs",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100, fontSize: 25),)
          ],
        ),
      ),
    );
  }
}
