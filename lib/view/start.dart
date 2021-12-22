import 'package:flutter/material.dart';

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
        body: Column(
      children: [
        StartTextContainer(),
        StartButton(),
      ],
    ));
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
          Text("Keymount", style: TextStyle(color: Colors.white)),
          Text("A M2DT App", style: TextStyle(color: Colors.white)),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
      decoration: BoxDecoration(color: Colors.teal[900]),
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.9,
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
      decoration: BoxDecoration(color: Colors.teal[900]),
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.1,
      child: ElevatedButton(
        child: Text("Start"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MainboardRoute(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.teal[500],
            onPrimary: Colors.white,
            fixedSize: Size(
              MediaQuery.of(context).size.width * 0.9,
              MediaQuery.of(context).size.height * 0.07,
            )),
      ),
    );
  }
}
