import 'package:flutter/material.dart';

class SildingText extends StatelessWidget {
  const SildingText({super.key, required this.slidingAnimation});

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: const Text("Read free books", textAlign: TextAlign.center),
        );
      },
    );
  }
}
