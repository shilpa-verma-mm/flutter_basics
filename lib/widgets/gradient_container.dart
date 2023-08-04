import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2, this.widget, {super.key});

  const GradientContainer.orange({super.key, required this.widget})
      : color1 = const Color.fromARGB(255, 211, 91, 54),
        color2 = const Color.fromARGB(255, 237, 183, 103);

  final Color color1;
  final Color color2;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: widget,
    );
  }
}
