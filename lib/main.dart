import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:large_capacity_container/firebase_options.dart';
import 'package:large_capacity_container/pages/home_page.dart';
import 'package:large_capacity_container/pages/rules.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:large_capacity_container/pages/login_page.dart';
//import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

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
