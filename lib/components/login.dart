import 'package:flutter/material.dart';
class Login extends StatefulWidget {
 
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? _email;
  String? _password;
  void loginUser(){

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          TextField(
            onChanged: (val)=>_email=val,
            decoration: InputDecoration(
              labelText: "email"),
              ),
          TextField(onChanged: (val)=>_password=val,
           decoration: InputDecoration(labelText:
            "password" ),),
            ElevatedButton(onPressed: loginUser, 
          child: Text("Login"))
        ]
      )
      
      
    );
  }
}