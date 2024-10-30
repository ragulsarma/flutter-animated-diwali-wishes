import 'package:diwali_animation/widgets/animated_circle_with_text_widget.dart';
import 'package:diwali_animation/widgets/animated_lamp_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _textAnimationController;

  late Animation<double> _textScaleAnimation;
  late Animation<double> _fadeAnimation;

  late Animation<Offset> _animationForLamp;
  late AnimationController _lampController;

  bool showText = false;

  @override
  void initState() {
    super.initState();

    //For lamp
    _lampController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Slide from the right to the center
    _animationForLamp = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _lampController,
      curve: Curves.easeInOut,
    ));

    // Delay the animation start by a few seconds
    Future.delayed(const Duration(seconds: 1), () {
      _lampController.forward();
    });

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _textAnimationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _textScaleAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(
          parent: _textAnimationController, curve: Curves.easeInOut),
    );

    // fade animation
    _fadeAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
          parent: _textAnimationController, curve: Curves.easeInOut),
    );

    // Start text animation only after lamp animation completes
    _lampController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          showText = true;
        });
        _controller.repeat(reverse: true);
        _textAnimationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _lampController.dispose();
    _textAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1b0655),
      body: Stack(
        children: [
          Positioned(
            left: 50.0,
            bottom: 300.0,
            child: AnimatedCircleWithTextWidget(
                textScaleAnimation: _textScaleAnimation,
                fadeAnimation: _fadeAnimation,
                animationController: _controller,
                showText: showText),
          ),
          Positioned(
            left: 70.0,
            bottom: 140.0,
            child: SlideTransition(
              position: _animationForLamp,
              child: const AnimatedLampWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
