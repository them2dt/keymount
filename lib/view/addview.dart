// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:keymount_v2/data/data.dart';

class AddRoute extends StatefulWidget {
  AddRoute();

  @override
  _AddRouteState createState() => _AddRouteState();
}

class _AddRouteState extends State<AddRoute> {
  String status = "";
  Color statusColor = Colors.white;
  double titleFontSize = 18;
  double usernameFontSize = 18;
  double passwordFontSize = 18;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[900],
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                child: Column(
                  children: [
                    TextFormField(
                      autocorrect: false,
                      style: GoogleFonts.rubik(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: titleFontSize,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'title',
                        hintStyle: GoogleFonts.rubik(
                            color: Colors.white10, fontWeight: FontWeight.w600),
                        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        isCollapsed: true,
                      ),
                      textAlign: TextAlign.center,
                      controller: titleController,
                      onTap: () {
                        setState(() {
                          titleFontSize = 30;
                          usernameFontSize = 20;
                          passwordFontSize = 20;
                        });
                      },
                      onFieldSubmitted: (_) async {
                        if (titleController.text.isNotEmpty &&
                            usernameController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          setState(() {
                            status = "Good job !";
                            statusColor = Colors.green[300]!;
                          });
                          await DatabaseHelper.instance.add(Account(
                            title: titleController.text,
                            username: usernameController.text,
                            password: passwordController.text,
                          ));
                          Navigator.pop(context);
                        }
                        if (titleController.text.isEmpty ||
                            usernameController.text.isEmpty ||
                            passwordController.text.isEmpty) {
                          setState(() {
                            status = "Dont leave anything empty";
                            statusColor = Colors.orange[600]!;
                          });
                        }
                      },
                    ),
                    TextFormField(
                      autocorrect: false,
                      style: GoogleFonts.rubik(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: usernameFontSize,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'username',
                        hintStyle: GoogleFonts.rubik(
                            color: Colors.white10, fontWeight: FontWeight.w600),
                        isCollapsed: true,
                      ),
                      textAlign: TextAlign.center,
                      controller: usernameController,
                      onTap: () {
                        setState(() {
                          titleFontSize = 20;
                          usernameFontSize = 30;
                          passwordFontSize = 20;
                        });
                      },
                      onFieldSubmitted: (_) async {
                        if (titleController.text.isNotEmpty &&
                            usernameController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          setState(() {
                            status = "Good job !";
                            statusColor = Colors.green[300]!;
                          });
                          await DatabaseHelper.instance.add(Account(
                            title: titleController.text,
                            username: usernameController.text,
                            password: passwordController.text,
                          ));
                          Navigator.pop(context);
                        }
                        if (titleController.text.isEmpty ||
                            usernameController.text.isEmpty ||
                            passwordController.text.isEmpty) {
                          setState(() {
                            status = "Dont leave anything empty";
                            statusColor = Colors.orange[600]!;
                          });
                        }
                      },
                    ),
                    TextFormField(
                      autocorrect: false,
                      style: GoogleFonts.rubik(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: passwordFontSize,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'password',
                        hintStyle: GoogleFonts.rubik(
                            color: Colors.white10, fontWeight: FontWeight.w600),
                        isCollapsed: true,
                      ),
                      textAlign: TextAlign.center,
                      controller: passwordController,
                      onTap: () {
                        setState(() {
                          titleFontSize = 20;
                          usernameFontSize = 20;
                          passwordFontSize = 30;
                        });
                      },
                      onFieldSubmitted: (_) async {
                        if (titleController.text.isNotEmpty &&
                            usernameController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          setState(() {
                            status = "Good job !";
                            statusColor = Colors.green[300]!;
                          });
                          await DatabaseHelper.instance.add(Account(
                            title: titleController.text,
                            username: usernameController.text,
                            password: passwordController.text,
                          ));
                          Navigator.pop(context);
                        }
                        if (titleController.text.isEmpty ||
                            usernameController.text.isEmpty ||
                            passwordController.text.isEmpty) {
                          setState(() {
                            status = "Dont leave anything empty";
                            statusColor = Colors.orange[600]!;
                          });
                        }
                      },
                    )
                  ],
                ),
                margin: EdgeInsets.all(20)),
            ElevatedButton(
              child: Text("ADD",
                  style: GoogleFonts.rubik(
                      color: Colors.white, fontWeight: FontWeight.w600)),
              onPressed: () async {
                if (titleController.text.isNotEmpty &&
                    usernameController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty) {
                  setState(() {
                    status = "Good job !";
                    statusColor = Colors.green[300]!;
                  });
                  await DatabaseHelper.instance.add(Account(
                    title: titleController.text,
                    username: usernameController.text,
                    password: passwordController.text,
                  ));
                  Navigator.pop(context);
                }
                if (titleController.text.isEmpty ||
                    usernameController.text.isEmpty ||
                    passwordController.text.isEmpty) {
                  setState(() {
                    status = "Dont leave anything empty";
                    statusColor = Colors.orange[600]!;
                  });
                }
              },
            ),
            Text(status,
                style: GoogleFonts.rubik(
                    color: statusColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600))
          ]),
      resizeToAvoidBottomInset: false,
    );
  }
}
