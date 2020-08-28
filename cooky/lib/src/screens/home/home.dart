import 'package:cooky/src/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: Text("Cooky"),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () async {

              await _auth.signOut();

          },
           icon: Icon(Icons.person),
           label: Text("Log Out")
           )
        ],
      ) ,
      
    );
  }
}