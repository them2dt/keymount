// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keymount_v2/data/data.dart';

class AddRoute extends StatefulWidget {
  AddRoute();

  @override
  _AddRouteState createState() => _AddRouteState();
}

class _AddRouteState extends State<AddRoute> {
  String status = "";
  Color statusColor = Colors.white;
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
              child: Text("ADD"),
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
                    statusColor = Colors.red[300]!;
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

class TitleTextField extends StatefulWidget {
  TextEditingController controller;
  TitleTextField({required this.controller});

  @override
  _TitleTextFieldState createState() => _TitleTextFieldState();
}

class _TitleTextFieldState extends State<TitleTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      alignment: Alignment.center,
      margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
      child: TextField(
        decoration: InputDecoration(),
      ),
    );
  }
}

class UsernameTextField extends StatefulWidget {
  TextEditingController controller;

  UsernameTextField({required this.controller});

  @override
  _UsernameTextFieldState createState() => _UsernameTextFieldState();
}

class _UsernameTextFieldState extends State<UsernameTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
      child: TextField(
        decoration: InputDecoration(),
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  TextEditingController controller;
  PasswordTextField({required this.controller});

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
      child: TextField(
        decoration: InputDecoration(),
        onSubmitted: (String text) {},
      ),
    );
  }
}

class SubmitButton extends StatefulWidget {
  @override
  _SubmitButtonState createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
