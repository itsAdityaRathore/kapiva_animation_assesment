import 'package:flutter/material.dart';
import 'package:kapiva_animation_assesment/view/screens/space_screen.dart';
import 'package:provider/provider.dart';

import '../../controller/logo_controller.dart';
import '../../utils/route_animation.dart';
import '../widget/animated_logo.dart';

class LogoScreen extends StatelessWidget {
  const LogoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Aditya Animation Assignment',
        ),
      ),
      backgroundColor: Colors.white,
      body: Consumer<LogoController>(builder: (context, logoController, _) {
        return GestureDetector(
          onTap: () => logoController.toggleRotateAnimation(''),
          onDoubleTap: () => logoController.toggleScaleAnimation(''),
          onLongPressStart: (_) =>
              logoController.toggleLongPressedAnimation(''),
          onLongPressEnd: (_) => logoController.toggleLongPressedAnimation(''),
          child: const Center(child: AnimatedLogo()),
        );
      }),
      floatingActionButton: FloatingActionButton(
          tooltip: 'Up for a visual treat ?',
          backgroundColor: Colors.transparent,
          child: Image.asset(
            'assets/earth.png',
            fit: BoxFit.cover,
          ),
          onPressed: () =>
              Navigator.of(context).push(createRoute(const SpaceScreen()))),
    );
  }
}
