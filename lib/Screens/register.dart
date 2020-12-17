/**
 * Author: KrishnaBabuReddy
 */

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_google_authentication/FirebaseRepository/firebase_repository.dart';
import 'package:flutter_google_authentication/Screens/profile_main.dart';
import 'package:flutter_google_authentication/Widgets/color_loader_3.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';





class Register extends StatefulWidget {
  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<Register> {

  FirebaseRepository _repository = FirebaseRepository();
  bool isLoginPressed = false;




  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text('Register',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: MediaQuery.of(context).size.height * 0.040,
                color: Color(0xFF545D68))),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings, color: Color(0xFF545D68)),
            onPressed: () {
            /*  Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SettingsMainPage()));*/
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(0.0),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.lightGreen, Colors.green])),
        child: Column(
          children: <Widget>[




            Container(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Register to get latest Updates as Notifications",
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: MediaQuery.of(context).size.height * 0.045,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 30.0),
            Container(
              padding: const EdgeInsets.only(
                  top: 0.0, right: 5.0, bottom: 0.0, left: 5.0),
              width: MediaQuery.of(context).size.height * 0.400,
              height: MediaQuery.of(context).size.height * 0.100,
              child: OutlineButton.icon(
                borderSide: BorderSide(color: Colors.black),
                color: Colors.red,
                textColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                icon: Icon(FontAwesomeIcons.google, size: MediaQuery.of(context).size.height * 0.046),
                label: Text("Continue with Google",
                    style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: MediaQuery.of(context).size.height * 0.026,
                        color: Colors.red)),
                onPressed: () {

                  performLogin();

                },
              ),
            ),
            Spacer(),
            SizedBox(height: 10.0),

            isLoginPressed ? Center(child: ColorLoader3(
              radius: 30.0,
              dotRadius: 9.0,
            ),) : Container()
          ],
        ),
      ),
    );
  }





  void performLogin() {
    print("tring to perform login");

    setState(() {
      isLoginPressed = true;
    });

    _repository.signIn().then((FirebaseUser user) {
      if (user != null) {
        authenticateUser(user);
      } else {
        print("There was an error");
      }
    });
  }



  void authenticateUser(FirebaseUser user) {
    _repository.authenticateUser(user).then((isNewUser) {
      setState(() {
        isLoginPressed = false;
      });

      if (isNewUser) {
        _repository.addDataToDb(user).then((value) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
                return ProfileMainPage();
              }));
        });
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
              return ProfileMainPage();
            }));
      }
    });
  }








}
