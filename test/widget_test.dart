// ignore_for_file: prefer_const_constructors_in_immutables, unnecessary_new, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

EdgeInsets globalMargin =
    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0);
TextStyle textStyle = const TextStyle(
  fontSize: 100.0,
  color: Colors.black,
);

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('SO Help'),
      ),
      body: new Column(
        children: <Widget>[
          new Text(
            number.toString(),
            style: textStyle,
          ),
          new GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              new InkResponse(
                child: new Container(
                    margin: globalMargin,
                    color: Colors.green,
                    child: new Center(
                      child: new Text(
                        "+",
                        style: textStyle,
                      ),
                    )),
                onTap: () {
                  setState(() {
                    number++;
                  });
                },
              ),
              new Sub(onTap: () {
                setState(() {
                  number--;
                });
              }),
            ],
          ),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: new Icon(Icons.update),
      ),
    );
  }
}

class Sub extends StatelessWidget {
  Function onTap;
  Sub({this.onTap});

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return new InkResponse(
      child: new Container(
        margin: globalMargin,
        color: Colors.red,
        child: new Center(
          child: new Text(
            "-",
            style: textStyle,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
