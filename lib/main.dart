import 'package:flutter/material.dart';
import 'package:mini_social_app/shared/network/dio_helper.dart';

import 'layout/layout.dart';
import 'modules/auth/screens/login_screen.dart';
import 'modules/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Social',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: LoginScreen(),
    );
  }
}
