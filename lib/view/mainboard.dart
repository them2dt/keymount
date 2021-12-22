import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:keymount_v2/data/data.dart';

import 'addview.dart';
import 'itemlist.dart';

class MainboardRoute extends StatefulWidget {
  const MainboardRoute({Key? key}) : super(key: key);

  @override
  MainboardRouteState createState() => MainboardRouteState();
}

class MainboardRouteState extends State<MainboardRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[900],
        body: Column(
          children: [
            MainBoardStatisticContainer(),
            MainboardOperationsContainer(),
            BottomContainer(),
            RatingContainer(),
          ],
        ));
  }
}

class MainBoardStatisticContainer extends StatefulWidget {
  const MainBoardStatisticContainer({Key? key}) : super(key: key);

  @override
  _MainBoardStatisticContainerState createState() =>
      _MainBoardStatisticContainerState();
}

class _MainBoardStatisticContainerState
    extends State<MainBoardStatisticContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Text("Welcome!",
                style: GoogleFonts.rubik(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 26,
                )),
            Container(
              child: Row(
                children: [
                  MainboardStatisticContainerElement(100, "Items stored"),
                  MainboardStatisticContainerElement(5.9, "GB saved"),
                  MainboardStatisticContainerElement(0, "times hacked"),
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
        width: MediaQuery.of(context).size.width);
  }
}

class MainboardStatisticContainerElement extends StatefulWidget {
  double amount = 0;
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

class MainboardOperationsContainer extends StatefulWidget {
  const MainboardOperationsContainer({Key? key}) : super(key: key);

  @override
  _MainboardOperationsContainerState createState() =>
      _MainboardOperationsContainerState();
}

class _MainboardOperationsContainerState
    extends State<MainboardOperationsContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  MainboardOperationsContainerAddButton(),
                  MainboardOperationsContainerListButton()
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
        width: MediaQuery.of(context).size.width);
  }
}

class MainboardOperationsContainerAddButton extends StatelessWidget {
  const MainboardOperationsContainerAddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
          child: Icon(Icons.add),
          onPressed: () {
            Data d = Data();
            d.printPath();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddRoute()));
          },
          style: ElevatedButton.styleFrom(
              primary: Colors.teal[600], fixedSize: Size(380 / 2, 180))),
      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
      alignment: Alignment.center,
    );
  }
}

class MainboardOperationsContainerListButton extends StatelessWidget {
  const MainboardOperationsContainerListButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
          child: Icon(Icons.menu),
          onPressed: () {
            Data databasePath = Data();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ListRoute()));
          },
          style: ElevatedButton.styleFrom(
              primary: Colors.teal[600], fixedSize: Size(380 / 2, 180))),
      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
      alignment: Alignment.center,
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
                        Text(" Donations ",
                            style: GoogleFonts.rubik(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 26,
                            )),
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
                    child: Text("How did we so far?",
                        style: GoogleFonts.rubik(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 26,
                        )),
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