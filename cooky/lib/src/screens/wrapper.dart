import 'package:cooky/src/screens/authenticate/authenticate.dart';
import 'package:cooky/src/screens/home/home.dart';
import 'package:cooky/src/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cooky/src/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    //return either home or authenticate widget

    if(user == null){
      return Authenticate();
    } else{
      return Home();
    }
  }
}