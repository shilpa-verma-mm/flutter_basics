import 'package:flutter/material.dart';
import 'package:multiplepage/pages/home_screen.dart';
import 'package:multiplepage/widgets/gradient_container.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  void navigateToOnboarding(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        const Color.fromARGB(255, 248, 251, 254),
        const Color.fromARGB(255, 133, 238, 140),
        Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      width: 300,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(
                  bottom: 40,
                  left: 20,
                  right: 20,
                ),
                child: TextButton(
                  onPressed: () {
                    navigateToOnboarding(context);
                  },
                  style: TextButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          10,
                        ),
                      ),
                    ),
                    backgroundColor: const Color.fromARGB(255, 37, 205, 46),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 10,
                    ),
                    textStyle: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  child: const Text("Roll Dice"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
