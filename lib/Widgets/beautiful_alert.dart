/**
 * Author: KrishnaBabuReddy
 */

import 'package:flutter/material.dart';
import 'package:flutter_google_authentication/FirebaseRepository/firebase_methods.dart';
import 'package:flutter_google_authentication/Screens/register.dart';


class BeautifulAlertDialog extends StatelessWidget {

  final FirebaseMethods authMethods = FirebaseMethods();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.only(right: 16.0),
          height: MediaQuery.of(context).size.height * 0.210,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(75),
                  bottomLeft: Radius.circular(75),
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10)
              )
          ),
          child: Row(
            children: <Widget>[
              SizedBox(width: 20.0),
              CircleAvatar(radius: 55, backgroundColor: Colors.white,child: Image.asset('assets/info-icon.png', width: MediaQuery.of(context).size.height * 0.140,
              ),),
              SizedBox(width: 20.0),


              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Alert!", style: Theme.of(context).textTheme.title,),
                    SizedBox(height: 10.0),
                    Flexible(
                      child: Text(
                          "Do you want to continue to Logout ?"),
                    ),
                    SizedBox(height: 10.0),
                    Row(children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          child: Text("No"),
                          color: Colors.red,
                          colorBrightness: Brightness.dark,
                          onPressed: (){Navigator.pop(context);},
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: RaisedButton(
                          child: Text("Yes"),
                          color: Colors.green,
                          colorBrightness: Brightness.dark,
                          onPressed: ()async {
                            final bool isLoggedOut = await FirebaseMethods().signOut();
                            if (isLoggedOut) {
                              // set userState to offline as the user logs out'

                              // move the user to login screen
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => Register()),
                                    (Route<dynamic> route) => false,
                              );
                            }



                            },
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        ),
                      ),
                    ],)
                  ],
                ),
              )




            ],
          ),
        ),
      ),
    );
  }
}