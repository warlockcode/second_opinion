import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:second_opinion/Auth/log_in.dart';
import 'package:second_opinion/Auth/user_provider.dart';
import 'package:provider/provider.dart';

import '../Auth/forget_password.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            StreamBuilder<User?>(
              stream: _auth.authStateChanges(),
              builder: (context, user) {
                if (user.data != null) {
                  return Container(
                    color: Colors.deepPurple,
                    height: 160.0,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StreamBuilder<User?>(
                                stream: _auth.userChanges(),
                                builder: (context, currUser) {
                                  if (currUser.data != null) {
                                    return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CircleAvatar(
                                              radius: 30.0,
                                              backgroundImage:
                                                  (currUser.data!.photoURL !=
                                                          null)
                                                      ? NetworkImage(currUser
                                                          .data!.photoURL
                                                          .toString())
                                                      : null),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          (currUser.data!.displayName != null)
                                              ? Text(
                                                  '${currUser.data!.displayName}',
                                                  style: TextStyle(
                                                      fontSize: 22.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                )
                                              : Text(
                                                  'user name',
                                                  style: TextStyle(
                                                      fontSize: 50.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                        ]);
                                  } else
                                    return Text(
                                      'user name',
                                    );
                                }),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextButton(
                              style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(5.00),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white)),
                              child: Text('Sign Out',
                                  style: TextStyle(
                                      color: Colors.deepPurple,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold)),
                              onPressed: () {
                                if (provider.checkUserType()) {
                                  provider.logout();
                                  provider.setIsloogedIn(false);
                                } else {
                                  _auth.signOut();
                                  provider.setIsloogedIn(false);
                                }
                              },
                            ),
                          ]),
                    ),
                  );
                } else {
                  return Container(
                    color: Colors.deepPurple,
                    height: 160.0,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Save Your Preferences',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.0),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'sign in to get better user experience\nand unlock all the features',
                              style: TextStyle(
                                  color: Colors.white54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0),
                            ),
                            SizedBox(height: 10.0),
                            ElevatedButton(
                              style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(5.00),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white)),
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LogIn()));
                              },
                            ),
                          ]),
                    ),
                  );
                }
              },
            ),
            // Column(
            //   mainAxisAlignment: MainAxisAlig  LogIn LogIn:file:///C:/Users/goswa/Desktop/pro/project_app/second_opinion/lib/screens/User_screen.dart:152:44nment.start,
            //   children: [
            //     ListTile(
            //       title: Text(
            //         'Contact Us',
            //         style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            //       ),
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
