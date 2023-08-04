import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        backgroundColor: const Color.fromARGB(255, 37, 205, 46),
      ),
      body: const Text("Another Page...!!!!!!"),
    );
  }
}
