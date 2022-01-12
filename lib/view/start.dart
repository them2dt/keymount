// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'mainboard.dart';

class StartRoute extends StatefulWidget {
  const StartRoute({Key? key}) : super(key: key);

  @override
  _StartRouteState createState() => _StartRouteState();
}

class _StartRouteState extends State<StartRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: [
              StartTextContainer(),
              StartButton(),
            ],
          ),
          decoration: BoxDecoration(color: Colors.teal[900]),
        ),
      ),
    );
  }
}

class StartTextContainer extends StatefulWidget {
  const StartTextContainer({Key? key}) : super(key: key);

  @override
  StartTextContainerState createState() => StartTextContainerState();
}

class StartTextContainerState extends State<StartTextContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("keymount",
              style: GoogleFonts.rubik(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600)),
          Text("M2DT Apps", style: TextStyle(color: Colors.teal[100])),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.8,
    );
  }
}

class StartButton extends StatefulWidget {
  const StartButton({Key? key}) : super(key: key);

  @override
  _StartButtonState createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.transparent),
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.2,
      child: ElevatedButton(
        child: FaIcon(FontAwesomeIcons.powerOff),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MainboardRoute(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            elevation: 0,
            shadowColor: Colors.transparent,
            primary: Colors.teal[600],
            onPrimary: Colors.white,
            fixedSize: Size(
              MediaQuery.of(context).size.width * 0.9,
              MediaQuery.of(context).size.height * 0.07,
            )),
      ),
    );
  }
}
