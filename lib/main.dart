import 'package:app_pedidos/styles/mytheme.dart';
import 'package:app_pedidos/views/home_page.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
