import 'package:diwali_animation/painter_widgets/leaf_painter.dart';
import 'package:diwali_animation/widgets/lamp_base_widget.dart';
import 'package:flutter/material.dart';

class AnimatedLampWidget extends StatefulWidget {
  const AnimatedLampWidget({super.key});

  @override
  State<AnimatedLampWidget> createState() => _AnimatedLampWidgetState();
}

class _AnimatedLampWidgetState extends State<AnimatedLampWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.13).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 450,
        height: 300,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const LampBaseWidget(),
                  Container(
                    height: 40,
                    width: 180,
                    margin: const EdgeInsets.only(bottom: 100),
                    decoration: const BoxDecoration(
                      color: Color(0xFF79182F),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(150, 40)),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 185,
              child: AnimatedBuilder(
                  animation: _scaleAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                        scale: _scaleAnimation.value,
                        child: CustomPaint(
                          size: const Size(100, 100),
                          painter: LeafPainter(),
                        ));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
