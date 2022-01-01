// ignore_for_file: prefer_const_constructors, unnecessary_this, avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keymount_v2/data/data.dart';

class EditRoute extends StatefulWidget {
  int id;
  String title;
  String username;
  String password;
  EditRoute({
    required this.id,
    required this.title,
    required this.username,
    required this.password,
  });
  @override
  _EditRouteState createState() => _EditRouteState();
}

class _EditRouteState extends State<EditRoute> {
  String status = "";
  Color statusColor = Colors.white;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void init() {
    this.titleController.text = widget.title;
    this.usernameController.text = widget.username;
    this.passwordController.text = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      backgroundColor: Colors.teal[900],
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "title"),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "username"),
              controller: usernameController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "password"),
              controller: passwordController,
            ),
            ElevatedButton(
              child: Text("UPDATE"),
              onPressed: () async {
                DatabaseHelper.instance.update(Account(
                  id: widget.id,
                  title: titleController.text,
                  username: usernameController.text,
                  password: passwordController.text,
                ));
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: Text("DELETE"),
              onPressed: () async {
                DatabaseHelper.instance.remove(widget.id);
                Navigator.pop(context);
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
