// ignore_for_file: prefer_const_constructors, avoid_print, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class PasswordValidatorRoute extends StatefulWidget {
  @override
  _PasswordValidatorRouteState createState() => _PasswordValidatorRouteState();
}

class Grade {
  String grade;
  Color? color;
  Grade({required this.grade, required this.color});
}

class _PasswordValidatorRouteState extends State<PasswordValidatorRoute> {
  static List<Grade> grades = [
    Grade(
      grade: 'F',
      color: Color(0xFFFF0000),
    ),
    Grade(
      grade: 'D',
      color: Color(0xFFA82B2B),
    ),
    Grade(
      grade: 'C',
      color: Color(0xFFCA9400),
    ),
    Grade(
      grade: 'B',
      color: Color(0xFFAEB100),
    ),
    Grade(
      grade: 'A',
      color: Color(0xFF399045),
    ),
    Grade(
      grade: 'A+',
      color: Color(0xFFA800AD),
    ),
  ];
  final TextEditingController textController = TextEditingController();
  double titleFontSize = 18;
  int grade = 0;

  bool hasSpecialCharacters(String input) {
    input.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))
        ? print("Has special characters.")
        : print("Has no Special chars.");
    return input.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }

  bool hasDigit(String input) {
    bool hasDigits = false;
    List<String> numbers = [
      '0',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
    ];

    for (int i = 0; i < input.length; i++) {
      if (numbers.contains(input[i])) {
        hasDigits = true;
        print("Text has digits.");
      }
    }
    return hasDigits;
  }

  bool isLongEnough(String input) {
    if (input.length > 8) {
      print("Text is +8 chars long.");
    }
    return input.length > 8;
  }

  bool hasUpperCase(String input) {
    input = input.trim();

    bool condition = false;
    if (input.isNotEmpty) {
      for (int i = 0; i < input.length; i++) {
        if (input[i].toUpperCase() == input[i] && !hasDigit(input[i])) {
          condition = true;
          print("Text has upper case chars.");
        }
      }
    }
    return condition;
  }

  bool hasLowerCase(String input) {
    input = input.trim();
    bool condition = false;
    if (input.isNotEmpty) {
      for (int i = 0; i < input.length; i++) {
        if (input[i].toLowerCase() == input[i] && !hasDigit(input[i])) {
          condition = true;
          print("Text has lower case chars.");
        }
      }
    }
    return condition;
  }

  int check(String input) {
    input = input.trim();

    int c = 0;
    List<Function(String input)> functions = [
      hasSpecialCharacters,
      hasDigit,
      hasUpperCase,
      hasLowerCase,
      isLongEnough,
    ];
    for (int i = 0; i < functions.length; i++) {
      if (functions[i](input)) {
        c++;
      }
    }
    return c;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.teal[900],
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    hintText: 'your Password here',
                    hintStyle: GoogleFonts.rubik(
                        color: Colors.white10, fontWeight: FontWeight.w600),
                    contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    isCollapsed: true,
                  ),
                  textAlign: TextAlign.center,
                  controller: textController,
                  onChanged: (String input) {
                    setState(() {
                      grade = 0;
                      if (input.length > 7) {
                        grade = check(input);
                      }
                    });
                  }),
              Container(
                  child: Column(
                    children: [
                      Text(grades[grade].grade,
                          style: GoogleFonts.rubik(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 26,
                          )),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                  decoration: BoxDecoration(
                      color: grades[grade].color,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  height: 100,
                  width: 370 / 3,
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(25),
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0))
            ]));
  }
}
