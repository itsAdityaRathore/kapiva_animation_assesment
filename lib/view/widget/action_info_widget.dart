import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'index.dart';

class ActionInfoWidget extends StatelessWidget {
  const ActionInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white12),
      child: Column(
        children: [
          StyledTextWidget(text: AppConstants.onClickAction),
          StyledTextWidget(text: AppConstants.onDoubleClickAction),
          StyledTextWidget(text: AppConstants.onLongPressedAction),
          StyledTextWidget(text: AppConstants.onLongPressedWhileRotatingAction),
        ],
      ),
    );
  }
}
