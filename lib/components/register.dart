import 'package:flutter/material.dart';
class Register extends StatelessWidget {
  List<Map<String, String>> inputs = [
    {"key": "firstname", "value": ""},
    {"key": "lastname", "value": ""},
    {"key": "email", "value": ""},
    {"key": "password", "value": ""}
  ];
  void setValue(String value, int index){
    inputs[index]["value"] = value;
  }
  void registerUser(){
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        ...inputs.asMap().entries.map((entry) =>
        TextField(
          onChanged: (val)=>setValue(val, entry.key),
          decoration: InputDecoration(
            labelText: entry.value['key']),)
        ),
        ElevatedButton(onPressed: registerUser, 
          child: Text("Register")
        ),
      ],),
    );
  }
}