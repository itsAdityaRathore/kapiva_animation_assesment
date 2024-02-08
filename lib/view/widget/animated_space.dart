import 'package:flutter/material.dart';
import 'package:space_animation/controller/logo_controller.dart';
import 'package:provider/provider.dart';

class AnimatedSpace extends StatefulWidget {
  const AnimatedSpace({Key? key}) : super(key: key);

  @override
  AnimatedLogoState createState() => AnimatedLogoState();
}

class AnimatedLogoState extends State<AnimatedSpace>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  static const double rotationValue = 2.0 * 3.141592653589793;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleAnimation(LogoController logoController) {
    if (logoController.isRotating) {
      _animationController.animateTo(_animationController.value + 0.2,
          curve: Curves.easeOut, duration: const Duration(seconds: 1));
    } else {
      _animationController.repeat();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LogoController>(builder: (context, logoController, _) {
      _toggleAnimation(logoController);
      return Stack(
        alignment: Alignment.center,
        children: [
          AnimatedScale(
            duration: const Duration(seconds: 2),
            scale: logoController.isLongPressed ? 1.3 : 1.0,
            child: Image.asset('assets/sun.png', height: 100),
          ),
          AnimatedOpacity(
            opacity: logoController.isLongPressed ? 0.5 : 0.0,
            duration: const Duration(seconds: 2),
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white54),
                  borderRadius: BorderRadius.circular(200),
                  color: Colors.transparent),
            ),
          ),
          AnimatedBuilder(
            animation: _animationController,
            child: Image.asset('assets/earth.png'),
            builder: (BuildContext context, Widget? child) {
              return Transform.rotate(
                angle: _animationController.value * rotationValue,
                child: AnimatedContainer(
                  duration: const Duration(seconds: 3),
                  curve: Curves.easeInOut,
                  transform: logoController.isLongPressed
                      ? Matrix4.rotationZ(3)
                      : Matrix4.rotationZ(0),
                  width: logoController.isScaled ? 200 : 100,
                  height: logoController.isScaled ? 200 : 100,
                  child: child,
                ),
              );
            },
          ),
        ],
      );
    });
  }
}
