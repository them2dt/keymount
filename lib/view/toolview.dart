// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keymount_v2/view/password_validator.dart';

class ToolRoute extends StatefulWidget {
  const ToolRoute({Key? key}) : super(key: key);

  @override
  _ToolRouteState createState() => _ToolRouteState();
}

class _ToolRouteState extends State<ToolRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Toolbox",
            style: GoogleFonts.rubik(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 26,
            )),
        centerTitle: true,
        backgroundColor: Colors.teal[900],
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Password validator",
                style: GoogleFonts.rubik(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
            subtitle: Text("How safe is your password?",
                style: GoogleFonts.rubik(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w300)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          PasswordValidatorRoute()));
            },
          ),
          ListTile(
            title: Text("The Box",
                style: GoogleFonts.rubik(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
            subtitle: Text("Generate secure hashed passwords.",
                style: GoogleFonts.rubik(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w300)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          PasswordValidatorRoute()));
            },
          )
        ],
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.teal[900],
    );
  }
}
