// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keymount_v2/data/data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'addview.dart';
import 'itemlist.dart';

class MainboardRoute extends StatefulWidget {
  const MainboardRoute({Key? key}) : super(key: key);

  @override
  MainboardRouteState createState() => MainboardRouteState();
}

class MainboardRouteState extends State<MainboardRoute> {
  int colorIndex = 0;
  List<Color> randomColors = [
    const Color(0xFFFF9494),
    const Color(0xFFFDFF94),
    const Color(0xFF94FF99),
    const Color(0xFF94FFDB),
    const Color(0xFF94B6FF),
    const Color(0xFF9694FF),
    const Color(0xFFB994FF),
    const Color(0xFFC294FF),
    const Color(0xFFFF94F6),
    const Color(0xFFE694FF),
    const Color(0xFFFF94F1),
    const Color(0xFFFF94D6),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[900],
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Text("Welcome!",
                    style: GoogleFonts.rubik(
                      color: randomColors[0],
                      fontWeight: FontWeight.w600,
                      fontSize: 26,
                    )),
                Container(
                  child: Row(
                    children: [
                      FutureBuilder<int>(
                          future: DatabaseHelper.instance.getAccountCount(),
                          builder: (BuildContext context,
                              AsyncSnapshot<int> snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                  child: Text('Loading...',
                                      style: GoogleFonts.rubik(
                                        color: randomColors[0],
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      )));
                            } else if (snapshot.hasData) {
                              return MainboardStatisticContainerElement(
                                snapshot.data!,
                                "Accounts",
                              );
                            } else {
                              return Center(
                                  child: MainboardStatisticContainerElement(
                                      0, "Error!"));
                            }
                          }),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0),
                      borderRadius: BorderRadius.all(Radius.circular(0))),
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  alignment: Alignment.center,
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.teal[400],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.zero,
                  topRight: Radius.zero,
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )),
            padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          child: ElevatedButton(
                              child: FaIcon(FontAwesomeIcons.plus, size: 50),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            AddRoute()));
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.teal[600],
                                  fixedSize: Size(380 / 2, 180))),
                          margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          alignment: Alignment.center,
                        ),
                        Container(
                          child: ElevatedButton(
                              child: FaIcon(FontAwesomeIcons.stream, size: 50),
                              onPressed: navigateSecondPage,
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.teal[600],
                                  fixedSize: Size(380 / 2, 180))),
                          margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          alignment: Alignment.center,
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.teal[900],
                        borderRadius: BorderRadius.all(Radius.circular(0))),
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.teal[900],
                  borderRadius: BorderRadius.all(Radius.circular(0))),
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width),
          BottomContainer(),
          RatingContainer(),
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  void refreshData() {
    setState(() {});
  }

  onGoBack(dynamic value) {
    refreshData();
    setState(() {});
  }

  void navigateSecondPage() {
    Route route = MaterialPageRoute(builder: (context) => ListRoute());
    Navigator.push(context, route).then(onGoBack);
  }
}

class MainboardStatisticContainerElement extends StatefulWidget {
  int amount = 0;
  String desc = "";

  MainboardStatisticContainerElement(this.amount, this.desc);

  @override
  _MainboardStatisticContainerElementState createState() =>
      _MainboardStatisticContainerElementState();
}

class _MainboardStatisticContainerElementState
    extends State<MainboardStatisticContainerElement> {
  @override
  Widget build(BuildContext context) {
    if (widget.amount.toString().contains(".0")) {
      return Container(
        child: Column(
          children: [
            Text(widget.amount.toString().split(".")[0],
                style: GoogleFonts.rubik(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 26,
                )),
            Text(widget.desc,
                style: GoogleFonts.rubik(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                )),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
        decoration: BoxDecoration(
            color: Colors.teal[900],
            borderRadius: BorderRadius.all(Radius.circular(5))),
        height: 100,
        width: 370 / 3,
        alignment: Alignment.center,
        margin: EdgeInsets.all(5),
      );
    } else
      // ignore: curly_braces_in_flow_control_structures
      return Container(
        child: Column(
          children: [
            Text(widget.amount.toString(),
                style: GoogleFonts.rubik(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 26,
                )),
            Text(widget.desc,
                style: GoogleFonts.rubik(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                )),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
        decoration: BoxDecoration(
            color: Colors.teal[900],
            borderRadius: BorderRadius.all(Radius.circular(5))),
        height: 100,
        width: 370 / 3,
        alignment: Alignment.center,
        margin: EdgeInsets.all(5),
      );
  }
}

class BottomContainer extends StatefulWidget {
  const BottomContainer({Key? key}) : super(key: key);

  @override
  _BottomContainerState createState() => _BottomContainerState();
}

class _BottomContainerState extends State<BottomContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.toolbox,
                          size: 50,
                        ),
                        /*Text("Password Lab",
                            style: GoogleFonts.rubik(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 26,
                            )),*/
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.teal[600],
                        fixedSize: Size(390,
                            MediaQuery.of(context).size.height * 0.25 - 10))),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
            decoration: BoxDecoration(
                color: Colors.teal[900],
                borderRadius: BorderRadius.all(Radius.circular(0))),
            margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
            alignment: Alignment.center,
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.teal[900],
          borderRadius: BorderRadius.all(Radius.circular(0))),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
    );
  }
}

class TopPlaceHolderContainer extends StatelessWidget {
  const TopPlaceHolderContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: 50, color: Colors.teal[900]);
  }
}

class RatingContainer extends StatefulWidget {
  const RatingContainer({Key? key}) : super(key: key);

  @override
  _RatingContainerState createState() => _RatingContainerState();
}

class _RatingContainerState extends State<RatingContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                ElevatedButton(
                    onPressed: () {},
                    child: FaIcon(
                      FontAwesomeIcons.magic,
                      size: 50,
                    ),

                    /*Text("How did we so far?",
                        style: GoogleFonts.rubik(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 26,
                        )),*/
                    style: ElevatedButton.styleFrom(
                        primary: Colors.teal[600],
                        fixedSize: Size(390,
                            MediaQuery.of(context).size.height * 0.25 - 20))),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
            decoration: BoxDecoration(
                color: Colors.teal[900],
                borderRadius: BorderRadius.all(Radius.circular(0))),
            margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
            alignment: Alignment.center,
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.teal[900],
          borderRadius: BorderRadius.all(Radius.circular(0))),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
    );
  }
}
