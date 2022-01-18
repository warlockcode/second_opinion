import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Color(0xFFF1F1F1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                elevation: 3,
                shadowColor: Colors.blueGrey,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(children: [
                      ListTile(
                        title: Center(
                            child: Text(
                          "MEDICAL",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'OpenSans-Regular'),
                        )),
                        subtitle: Center(
                            child: Text(
                          "Available services",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'OpenSans-Regular'),
                        )),
                      ),
                      ListTile(
                        title: Icon(
                          Icons.local_hospital_sharp,
                          color: Colors.blueGrey[900],
                          size: 80,
                        ),
                        subtitle: Center(
                          child: Text(
                            "dentist,orthologist,ent",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'OpenSans-Regular'),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            );
          }),
    ));
  }
}
