import 'package:flutter/material.dart';
import 'package:sketch_app/provider/sketch_provider.dart';
import 'package:sketch_app/provider/sketch_setting.dart';
import 'package:sketch_app/view/sketch_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      /// --- > This provider is For Undo,Redo,Clearing Cnavas Functionality <--- ///
      ChangeNotifierProvider(
        create: (_) => DrawingStateManager(),
      ),

      /// --- > This provider is For Changing Color and Stroke Width Functionality <--- ///
      ChangeNotifierProvider(
        create: (_) => DrawingSettings(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SketchApp',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: Colors.white))),
        home: const SketchScreen());
  }
}
