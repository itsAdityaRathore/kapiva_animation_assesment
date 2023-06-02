import 'package:flutter/material.dart';
import 'package:kapiva_animation_assesment/model/logo_model.dart';

class LogoController extends ChangeNotifier {
  final LogoModel _logoModel = LogoModel();

  bool get isRotating => _logoModel.isRotating;

  bool get isScaled => _logoModel.isScaled;

  bool get isLongPressed => _logoModel.isLongPressed;

  String get currectAction => _logoModel.currentAction;

  void toggleRotateAnimation(String action) {
    _logoModel.isRotating = !_logoModel.isRotating;
    _logoModel.currentAction = action;
    notifyListeners();
  }

  void toggleScaleAnimation(String action) {
    _logoModel.isScaled = !_logoModel.isScaled;
    _logoModel.currentAction = action;

    notifyListeners();
  }

  void toggleLongPressedAnimation(String action) {
    _logoModel.isLongPressed = !_logoModel.isLongPressed;
    _logoModel.currentAction = action;

    notifyListeners();
  }
}
