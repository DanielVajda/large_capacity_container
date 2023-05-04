import 'package:flutter/material.dart';
import 'package:large_capacity_container/pages/home_page.dart';
import 'package:large_capacity_container/pages/rules.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(brightness: Brightness.light),
    );
  }
}
