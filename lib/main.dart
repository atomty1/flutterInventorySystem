import 'package:flutter/material.dart';
import 'package:inventory/components/AdminDashboard.dart';
void main()=>runApp(Inventory());
class Inventory extends StatefulWidget {
  @override
  _InventoryState createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Inventory system"),
          ),
          body: AdminDashboard(),
      ),
    );
  }
}