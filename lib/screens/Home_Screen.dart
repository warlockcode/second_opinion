import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:second_opinion/helper/homeScreenHelper.dart';

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
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              leading: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              pinned: _pinned,
              expandedHeight: 160.0,
              flexibleSpace: const FlexibleSpaceBar(
                title: Text(
                  "Want Some Consusltancy",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'OpenSans-Regular'),
                ),
                background: BackGroundImage(),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                  itemCount: chipsCustom.length,
                  itemBuilder: (BuildContext context, int index) {
                    return chipsCustom[index];
                  },
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.orange.shade400,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      elevation: 3,
                      shadowColor: Color(0XFFDCB5A8),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ListTile(
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
                                          int.parse(_services[index]["icon"]),
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
                                                _services[index]["custom_icon"],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  );
                },
                childCount: _services.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
