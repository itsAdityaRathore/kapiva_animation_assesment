import 'package:flutter/material.dart';
import 'package:space_animation/controller/logo_controller.dart';
import 'package:provider/provider.dart';

class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({Key? key}) : super(key: key);

  @override
  AnimatedLogoState createState() => AnimatedLogoState();
}

class AnimatedLogoState extends State<AnimatedLogo>
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

  void _toggleAnimation(bool isRotating) {
    if (isRotating) {
      _animationController.animateTo(_animationController.value + 0.2,
          curve: Curves.easeOut, duration: const Duration(seconds: 1));
    } else {
      _animationController.repeat();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LogoController>(builder: (context, logoController, _) {
      _toggleAnimation(logoController.isRotating);
      return AnimatedBuilder(
        animation: _animationController,
        child: const FlutterLogo(
          size: 200.0,
        ),
        builder: (BuildContext context, Widget? child) {
          return Transform.rotate(
            angle: _animationController.value * rotationValue,
            child: Center(
                child: AnimatedContainer(
              duration: const Duration(seconds: 3),
              curve: Curves.easeInOut,
              transform: logoController.isLongPressed
                  ? Matrix4.rotationZ(1)
                  : Matrix4.rotationZ(0),
              width: logoController.isScaled ? 200 : 100,
              height: logoController.isScaled ? 200 : 100,
              child: child,
            )),
          );
        },
      );
    });
  }
}
