import 'package:flutter/material.dart';
import 'package:space_animation/controller/logo_controller.dart';
import 'package:space_animation/view/screens/index.dart';
import 'package:provider/provider.dart';

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
          home: SpaceScreen(),
        ));
  }
}
