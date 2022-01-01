// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keymount_v2/data/data.dart';
import 'dart:io';

import 'package:keymount_v2/view/editview.dart';

class ListRoute extends StatefulWidget {
  const ListRoute({Key? key}) : super(key: key);

  @override
  _ListRouteState createState() => _ListRouteState();
}

class _ListRouteState extends State<ListRoute> {
  String clipboardText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(clipboardText,
            style:
                GoogleFonts.rubik(fontSize: 20, fontWeight: FontWeight.w800)),
        backgroundColor: Colors.teal[800],
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10),
        )),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.teal[900],
      body: Center(
        child: FutureBuilder<List<Account>>(
            future: DatabaseHelper.instance.getAccounts(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Account>> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: Text('Loading...'));
              } else if (snapshot.data!.isEmpty) {
                return Center(child: Text("No Items in List"));
              } else if (snapshot.hasData) {
                return ListView(
                    children: snapshot.data!.map((account) {
                  return Container(
                      child: Column(
                          children: [
                            Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width * 0.8 +
                                    10,
                                child: ElevatedButton(
                                  onPressed: () {
                                    print(account.id);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => EditRoute(
                                                  id: account.id!,
                                                  title: account.title,
                                                  username: account.username,
                                                  password: account.password,
                                                )));
                                  },
                                  child: Text(account.title,
                                      style: GoogleFonts.rubik(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800)),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.teal[300],
                                    shadowColor: Colors.transparent,
                                    fixedSize: Size(
                                        MediaQuery.of(context).size.width *
                                                0.8 +
                                            10,
                                        40),
                                  ),
                                ),
                                decoration: BoxDecoration(),
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0)),
                            Row(
                                children: [
                                  Container(
                                      child: ElevatedButton(
                                          child: Row(
                                            children: [
                                              Icon(Icons.copy),
                                              Text("username",
                                                  style: GoogleFonts.rubik())
                                            ],
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              clipboardText = "Copied \"" +
                                                  account.username +
                                                  "\"";
                                              Clipboard.setData(ClipboardData(
                                                text: account.username,
                                              ));
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                            fixedSize: Size(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.4,
                                                MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.1),
                                            alignment: Alignment.center,
                                          )),
                                      padding: EdgeInsets.fromLTRB(0, 0, 5, 0)),
                                  Container(
                                    child: ElevatedButton(
                                        child: Row(
                                          children: [
                                            Icon(Icons.copy),
                                            Text("password",
                                                style: GoogleFonts.rubik())
                                          ],
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            clipboardText = "Copied \"" +
                                                account.password +
                                                "\"";
                                            Clipboard.setData(ClipboardData(
                                              text: account.password,
                                            ));
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          fixedSize: Size(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.1),
                                          alignment: Alignment.center,
                                        )),
                                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  )
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center)
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center),
                      decoration: BoxDecoration(
                          color: Colors.teal[300],
                          borderRadius: BorderRadius.circular(10)),
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.2,
                      margin: EdgeInsets.fromLTRB(5, 5, 5, 5));
                }).toList());
              } else {
                return Center(child: Text('Some Error Occured'));
              }
            }),
      ),
    );
  }
}
