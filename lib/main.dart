import 'package:app_pedidos/styles/mytheme.dart';
import 'package:app_pedidos/views/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
  //     overlays: [SystemUiOverlay.bottom]);
  // esconde a status e a actionbar
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: myTheme,
      home: const HomePage(),
    );
  }
}
