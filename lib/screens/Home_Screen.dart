import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:second_opinion/helper/homeScreenHelper.dart';
import 'package:second_opinion/screens/DetailScreen/Details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _pinned = true;
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? currentUser = FirebaseAuth.instance.currentUser;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<DocumentSnapshot> _services = [];
  getServices() async {
    Query q = _firestore.collection("services");
    QuerySnapshot querySnapshot = await q.get();
    setState(() {
      _services = querySnapshot.docs;
    });
  }

  @override
  void initState() {
    super.initState();
    getServices();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xffffffff),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Card(
                  elevation: 5,
                  color: Colors.transparent,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff7e47e2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "  2nd Opinon  ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5.0, left: 28, right: 28, bottom: 15),
                child: Text(
                  "Please Choose A category",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    itemCount: _services.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Card(
                          color: Color(0xffece4f9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          elevation: 1,
                          shadowColor: Color(0XFFDCB5A8),
                          child: Padding(
                            padding: EdgeInsets.all(18.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailsScreen(
                                                        serviceName: _services[
                                                                index]
                                                            ["service_name"])));
                                      },
                                      child: ListTile(
                                        title: Center(
                                            child: Text(
                                          _services[index]["service_name"],
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900,
                                              fontFamily: 'OpenSans-Regular'),
                                        )),
                                        subtitle: Center(
                                            child: Text(
                                          _services[index]["subtitle"],
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w900,
                                              fontFamily: 'OpenSans-Regular'),
                                        )),
                                        trailing: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          maxRadius: 30,
                                          child: Icon(
                                            IconData(
                                                int.parse(
                                                    _services[index]["icon"]),
                                                fontFamily: 'MaterialIcons'),
                                            color: Colors.red[900],
                                            size: 40,
                                          ),
                                        ),
                                        leading: CircleAvatar(
                                            maxRadius: 25,
                                            backgroundColor: Colors.white,
                                            child: Padding(
                                              padding: EdgeInsets.all(2),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                      _services[index]
                                                          ["custom_icon"],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          )),
    );
  }
}
