import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void navigateToHome(BuildContext context) {
    context.goNamed(
      "home",
      pathParameters: {
        "id": "1",
        "name": "John",
      },
      queryParameters: {
        "email": "example@gmail.com",
        "age": "25",
        "place": "India",
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: () => {
          navigateToHome(context),
        },
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Go to the Home screen',
            ),
          ],
        ),
      ),
    );
  }
}
