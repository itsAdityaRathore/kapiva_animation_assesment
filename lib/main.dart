import 'package:flutter/material.dart';
import 'package:kapiva_animation_assesment/controller/logo_controller.dart';
import 'package:provider/provider.dart';

import 'view/screens/logo_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LogoController(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Aditya Animation Assignment',
          home: LogoScreen(),
        ));
  }
}
