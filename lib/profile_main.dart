/**
 * Author: Damodar Lohani
 * profile: https://github.com/lohanidamodar
 */

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_google_authentication/register.dart';
import 'package:flutter_google_authentication/user.dart';
import 'package:flutter_google_authentication/firebase_repository.dart';
import 'package:flutter_google_authentication/firebase_methods.dart';
import 'package:flutter_google_authentication/beautiful_alert.dart';







class ProfileMainPage extends StatefulWidget {
  @override
  ProfileMainPageState createState() => ProfileMainPageState();
}

class ProfileMainPageState extends State<ProfileMainPage> {

  User sender;
  String _currentUserId;
  static final String path = "lib/src/pages/profile/profile8.dart";

  FirebaseRepository _repository = FirebaseRepository();
  final FirebaseMethods authMethods = FirebaseMethods();


  String progilephoto = 'https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F1.jpg?alt=media';
  String username = "UserName";
  String gmailid = "mangoes@gmail.com";
  List<String> images = [
    'https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F1.jpg?alt=media',
    'https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F2.jpg?alt=media',
  ];


  @override
  void initState() {
    super.initState();

    _repository.getCurrentUser().then((user) {
      _currentUserId = user.uid;

      setState(() {
        progilephoto  = user.photoUrl;
        print(progilephoto);
        username = user.displayName;
        gmailid = user.email;

     String s1=  user.phoneNumber;
     print(s1);

        sender = User(
          uid: user.uid,
          name: user.displayName,
          profilePhoto: user.photoUrl,
        );
      });
    });
  }



  @override
  Widget build(BuildContext context) {

    /*User u123= new User();
    String s133= u123.profilePhoto;

    print(s133);*/

    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text('Profile',
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: MediaQuery.of(context).size.height * 0.040,
                  color: Color(0xFF545D68))),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.power_settings_new, color: Color(0xFF545D68)),
              onPressed: ()  {

                _alertDialog(context);

              /*async {
                final bool isLoggedOut = await FirebaseMethods().signOut();
                if (isLoggedOut) {
                  // set userState to offline as the user logs out'

                  // move the user to login screen
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Register()),
                        (Route<dynamic> route) => false,
                  );
                }*/





              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ProfileHeader(
                avatar: NetworkImage(progilephoto),
                coverImage: AssetImage('assets/landing_banner.jpg'),
                title: username,
                subtitle: "Manager",
                actions: <Widget>[],
              ),
              const SizedBox(height: 10.0),
              UserInfo(gmailid : gmailid),
            ],
          ),
        ));

  }


  _alertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BeautifulAlertDialog();
      },
    );
  }
}

class UserInfo extends StatelessWidget {

  final gmailid;
  UserInfo({this.gmailid});

  @override
  Widget build(BuildContext context) {
    return Container(
      /* height: MediaQuery.of(context).size.height * 0.520,
        width: MediaQuery.of(context).size.height * 0.400,*/
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Card(
            child: Container(
              // alignment: Alignment.topCenter,
              padding: EdgeInsets.all(0),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[

                      ...ListTile.divideTiles(
                        color: Colors.grey,
                        tiles: [

                          Container(
                            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.00),
                            /* height: MediaQuery.of(context).size.height * 0.120,
                            width: MediaQuery.of(context).size.height * 0.400,*/
                            child: ListTile(
                              leading: Container(
                                height: MediaQuery.of(context).size.height * 0.040,
                                width: MediaQuery.of(context).size.height * 0.040,
                                padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.00),
                                child: Icon(Icons.my_location,
                                  color: Colors.grey,
                                ),
                              ),
                              title: Text("Location",
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      fontSize:
                                      MediaQuery.of(context).size.height *
                                          0.030,
                                      color: Color(0xFF545D68))),
                              subtitle: Text("Kathmandu",
                                  style: TextStyle(
                                    fontFamily: 'Varela',
                                    fontSize:
                                    MediaQuery.of(context).size.height *
                                        0.025,
                                    color: Colors.grey,
                                  )),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.00),
                            /*height: MediaQuery.of(context).size.height * 0.120,
                            width: MediaQuery.of(context).size.height * 0.400,*/
                            child: ListTile(

                              leading:Container(
                                height: MediaQuery.of(context).size.height * 0.040,
                                width: MediaQuery.of(context).size.height * 0.040,
                                padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.00),
                                child: Icon(Icons.mail,
                                  color: Colors.grey,
                                ),
                              ),

                              title: Text("Email",
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      fontSize:
                                      MediaQuery.of(context).size.height *
                                          0.030,
                                      color: Color(0xFF545D68))),
                              subtitle: Text(gmailid,
                                  style: TextStyle(
                                    fontFamily: 'Varela',
                                    fontSize:
                                    MediaQuery.of(context).size.height *
                                        0.022,
                                    color: Colors.grey,
                                  )),
                            ),
                          ),

                        ],
                      ),
                    ],


                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final ImageProvider<dynamic> coverImage;
  final ImageProvider<dynamic> avatar;
  final String title;
  final String subtitle;
  final List<Widget> actions;

  const ProfileHeader(
      {Key key,
        @required this.coverImage,
        @required this.avatar,
        @required this.title,
        this.subtitle,
        this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Ink(
          height: MediaQuery.of(context).size.height * 0.340,
          decoration: BoxDecoration(
            image: DecorationImage(image: coverImage, fit: BoxFit.cover),
          ),
        ),
        /* Ink(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.black38,
          ),
        ),*/

        if (actions != null)
          Container(
            width: double.infinity,
            height: 200,
            padding: const EdgeInsets.only(bottom: 0.0, right: 0.0),
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: actions,
            ),
          ),
        Container(
          width: double.infinity,
          margin:
          EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.200),
          child: Column(
            children: <Widget>[
              Avatar(
                image: avatar,
                radius: MediaQuery.of(context).size.height * 0.150,
                backgroundColor: Colors.lightGreen[400],
                borderColor: Colors.green,
                borderWidth: MediaQuery.of(context).size.height * 0.008,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.040,
                    color: Colors.black),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 5.0),
                Text(
                  subtitle,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.030,
                      color: Colors.black),
                ),
              ]
            ],
          ),
        )
      ],
    );
  }
}

class Avatar extends StatelessWidget {
  final ImageProvider<dynamic> image;
  final Color borderColor;
  final Color backgroundColor;
  final double radius;
  final double borderWidth;

  const Avatar(
      {Key key,
        @required this.image,
        this.borderColor = Colors.grey,
        this.backgroundColor,
        this.radius = 30,
        this.borderWidth = 5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius + borderWidth,
      backgroundColor: borderColor,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor != null
            ? backgroundColor
            : Theme.of(context).primaryColor,
        child: CircleAvatar(
          radius: radius - borderWidth,
          backgroundImage: image,
        ),
      ),
    );
  }
}
