// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:keymount_v2/view/start.dart';
import 'package:rate_my_app/rate_my_app.dart';

void main() {
  RateMyApp rateMyApp = RateMyApp(
    preferencesPrefix: 'rateMyApp_',
    minDays: 0, // Show rate popup on first day of install.
    minLaunches:
        1, // Show rate popup after 5 launches of app after minDays is passed.
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
