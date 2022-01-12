// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:keymount_v2/view/start.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int nbTimesLaunched = (prefs.getInt('nbTimesLaunched') ?? 0) + 1;
  bool isReviewed = (prefs.getBool('isReviewed') ?? false);
  await prefs.setInt('nbTimesLaunched', nbTimesLaunched);

  runApp(const MyApp());
}

enum Availability { loading, available, unavailable }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: StartRoute());
  }
}
