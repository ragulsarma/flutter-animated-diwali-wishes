import 'package:diwali_animation/painter_widgets/dotted_line_painter.dart';
import 'package:flutter/material.dart';

class LampBaseWidget extends StatelessWidget {
  const LampBaseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 100,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFe53760),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF140228).withOpacity(0.4),
                    blurRadius: 20,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 20,
            child: Container(
              height: 15,
              width: 180,
              decoration: BoxDecoration(
                border: const Border(
                  bottom: BorderSide(
                    color: Colors.white,
                    width: 4,
                  ),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          Positioned(
            top: 50,
            child: CustomPaint(
              size: const Size(155, 5),
              painter: DottedLinePainter(),
            ),
          ),
          Positioned(
            top: 60,
            child: Container(
              height: 15,
              width: 135,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: const Border(
                  bottom: BorderSide(
                    color: Colors.white,
                    width: 4,
                  ),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
