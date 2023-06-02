import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/logo_controller.dart';
import '../../utils/constants.dart';
import '../widget/animated_space.dart';
import '../widget/index.dart';

class SpaceScreen extends StatelessWidget {
  const SpaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
              child: Selector<LogoController, String>(
                selector: (context, logoController) =>
                    logoController.currectAction,
                builder: (context, currectAction, _) {
                  return Text(
                    currectAction,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  );
                },
              ),
            ),
          ),
          Consumer<LogoController>(builder: (context, logoController, _) {
            return GestureDetector(
                onTap: () => logoController.toggleRotateAnimation(
                    logoController.isRotating
                        ? AppConstants.rotation
                        : AppConstants.seeTheBeauty),
                onDoubleTap: () => logoController
                    .toggleScaleAnimation(AppConstants.seeTheBeauty),
                onLongPressStart: (_) => logoController
                    .toggleLongPressedAnimation(AppConstants.revolving),
                onLongPressEnd: (_) => logoController
                    .toggleLongPressedAnimation(AppConstants.rotation),
                child: const Center(
                  child: AnimatedSpace(),
                ));
          }),
          const ActionInfoWidget()
        ],
      ),
    );
  }
}
