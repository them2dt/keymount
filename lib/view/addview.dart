import 'package:flutter/material.dart';

class AddRoute extends StatefulWidget {
  const AddRoute({Key? key}) : super(key: key);

  @override
  _AddRouteState createState() => _AddRouteState();
}

class _AddRouteState extends State<AddRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[900],
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              TitleTextField(),
              UsernameTextField(),
              PasswordTextField(),
              SubmitButton(),
            ]));
  }
}

class TitleTextField extends StatefulWidget {
  const TitleTextField({Key? key}) : super(key: key);

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
  const UsernameTextField({Key? key}) : super(key: key);

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
  const PasswordTextField({Key? key}) : super(key: key);

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
      ),
    );
  }
}

class SubmitButton extends StatefulWidget {
  const SubmitButton({Key? key}) : super(key: key);

  @override
  _SubmitButtonState createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text("ADD"),
        onPressed: () {},
      ),
    );
  }
}
