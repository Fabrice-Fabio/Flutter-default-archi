import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double appBarSize = 50.0;

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('HomePage'),);
  }
}
