import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:second_opinion/screens/DetailsCard/DetailsCard.dart';

class DetailsScreen extends StatefulWidget {
  final String? serviceName;

  const DetailsScreen({Key? key, @required this.serviceName}) : super(key: key);

  @override
  _DetailsScreenState createState() =>
      _DetailsScreenState(serviceName: serviceName);
}

class _DetailsScreenState extends State<DetailsScreen> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var KTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  String? serviceName;
  DocumentSnapshot? documentSnapshot;
  _DetailsScreenState({@required this.serviceName});
  int _itemCount = 0;
  var serviceList;
  var serviceIconList;
  getServices() async {
    Query q = _firestore
        .collection("services")
        .where("service_name", isEqualTo: serviceName);
    QuerySnapshot? querySnapshot = await q.get();
    QueryDocumentSnapshot queryDocumentSnapshot = querySnapshot.docs[0];

    //print(_itemCount);
    setState(() {
      serviceIconList = queryDocumentSnapshot.get("serviceFieldIcon");
      serviceList = queryDocumentSnapshot.get("serviceField");
      _itemCount = serviceList.length;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getServices();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Details Screen"),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: _itemCount,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          maxRadius: 30,
                          backgroundColor: Colors.green,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  (serviceIconList?.elementAt(index) != null)
                                      ? serviceIconList.elementAt(index)
                                      : null,
                                ),
                                fit: BoxFit.fill,
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          (serviceList?.elementAt(index) != null)
                              ? serviceList.elementAt(index)
                              : ' ',
                          style: KTextStyle,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Language:",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "English,Hindi",
                          style: KTextStyle,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.greenAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsCard(),));
                          },
                          child: Text(
                            "Select",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ));
  }
}
