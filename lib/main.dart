import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'FirebaseRepository/firebase_repository.dart';
import 'Screens/profile_main.dart';
import 'Screens/register.dart';


void main() {
  runApp(IntermediateLoginProfile());
}

class IntermediateLoginProfile extends StatefulWidget {
  @override
  IntermediateLoginProfileState createState() => IntermediateLoginProfileState();
}

class IntermediateLoginProfileState extends State<IntermediateLoginProfile> {
  FirebaseRepository _repository = FirebaseRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      /*initialRoute: '/',
      routes: {
        '/search_screen': (context) => Register(),
      },*/

      home: FutureBuilder(
        future: _repository.getCurrentUser(),
        builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
          if (snapshot.hasData) {
            return ProfileMainPage();
          } else {
            return Register();
          }
        },
      ),
    );
  }
}
