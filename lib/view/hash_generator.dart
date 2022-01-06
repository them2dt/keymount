// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HashGeneratorRoute extends StatefulWidget {
  @override
  _HashGeneratorRouteState createState() => _HashGeneratorRouteState();
}

class _HashGeneratorRouteState extends State<HashGeneratorRoute> {
  //init
  String input = "";
  String hash = "";

  double titleFontSize = 18;
  final TextEditingController textController = TextEditingController();

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
            textAlign: TextAlign.center,
            expands: false,
            showCursor: true,
            controller: textController,
            autocorrect: false,
            maxLines: 2,
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
              hintText: 'your text here',
              hintStyle: GoogleFonts.rubik(
                  color: Colors.white10, fontWeight: FontWeight.w600),
              contentPadding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              isCollapsed: true,
            ),
            onChanged: (_) {
              setState(
                () {
                  var bytes = utf8.encode(textController.text);
                  var digest = sha256.convert(bytes);
                  hash = "$digest";
                },
              );
            },
          ),
          Container(
            child: Column(
                children: [
                  Container(
                    child: Text(
                      hash,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.rubik(
                        color: Colors.teal[900],
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    height: 80,
                    alignment: Alignment.center,
                    //color: Colors.black,
                  ),
                  Container(
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            Clipboard.setData(ClipboardData(
                              text: hash,
                            ));
                          });
                        },
                        child: Text(
                          "copy",
                          style: GoogleFonts.rubik(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.teal[900])),
                    height: 80,
                    alignment: Alignment.center,
                    // color: Colors.black,
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center),
            decoration: BoxDecoration(
                color: Colors.teal[600],
                borderRadius: BorderRadius.all(Radius.circular(5))),
            height: 200,
            width: MediaQuery.of(context).size.width * 0.8,
            alignment: Alignment.center,
            margin: EdgeInsets.all(25),
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          ),
        ],
      ),
    );
  }
}
