import 'package:flutter/material.dart';
import 'package:flutter_google_authentication/firebase_repository.dart';
import 'package:flutter_google_authentication/register.dart';
import 'package:flutter_google_authentication/profile_main.dart';
import 'package:firebase_auth/firebase_auth.dart';


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
