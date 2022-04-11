import 'package:flutter/material.dart';
import 'package:repozen/routing/routing.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //precacheImage(const AssetImage("assets/background.png"), context);
    return MaterialApp(
      title: "Repozen",
      initialRoute: '/',
      onGenerateRoute: Routing.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}