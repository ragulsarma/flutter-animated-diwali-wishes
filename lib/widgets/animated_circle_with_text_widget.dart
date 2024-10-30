import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedCircleWithTextWidget extends StatelessWidget {
  final Animation<double> textScaleAnimation;
  final Animation<double> fadeAnimation;
  final AnimationController animationController;
  final bool showText;

  const AnimatedCircleWithTextWidget({
    super.key,
    required this.textScaleAnimation,
    required this.fadeAnimation,
    required this.animationController,
    required this.showText,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 250,
              height: 250,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xFF6a44cc)),
              child: Center(
                child: Visibility(
                  visible: showText,
                  child: ScaleTransition(
                    scale: textScaleAnimation,
                    child: FadeTransition(
                      opacity: fadeAnimation,
                      child: const Text(
                        'Happy\nDiwali',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ...List.generate(8, (index) {
              double angle = (index * pi / 4);
              double offsetX = 110 * cos(angle);
              double offsetY = 110 * sin(angle);

              // Determine if the current index is in the first or second set
              bool isFirstSet = [0, 2, 4, 6].contains(index);
              bool isSecondSet = [1, 3, 5, 7].contains(index);

              // Change color based on the animation value
              Color circleColor = const Color(0xFF4d2c96);
              if (isFirstSet && animationController.value < 0.5) {
                circleColor = Colors.yellow;
              } else if (isSecondSet && animationController.value >= 0.5) {
                circleColor = Colors.yellow;
              }

              return Positioned(
                left: 125 + offsetX - 2.5,
                top: 125 + offsetY - 2.5,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: circleColor,
                  ),
                ),
              );
            }),
          ],
        );
      },
    );
  }
}
