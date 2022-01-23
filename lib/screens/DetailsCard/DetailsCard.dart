import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsCard extends StatefulWidget {
  const DetailsCard({Key? key}) : super(key: key);

  @override
  _DetailsCardState createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard> {
  var KcardTextStytle=TextStyle(fontSize: 18,fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text("DetailsCard"),),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: Card(
             elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                    Column(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                              image: DecorationImage(image: NetworkImage("https://images.unsplash.com/photo-1503185912284-5271ff81b9a8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"))),
                        ),
                        Text("*****",style: TextStyle(fontSize: 30,letterSpacing: 2,color: Colors.orange),),
                        Text("200000 votes")
                      ],
                    ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left:15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Ajay",style: KcardTextStytle,),
                        Text("Doctor",style: KcardTextStytle,),
                        Text("English,Hindi",style: KcardTextStytle,),
                        Text("Exp 6 years",style: KcardTextStytle,),
                        Text("Rs 24min",style: KcardTextStytle,)
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        Row(children: [
                          Icon(Icons.notifications_active_outlined),
                          Icon(Icons.check_circle,color: Colors.greenAccent,)
                        ],),

                        SizedBox(height: 30,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.greenAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                          onPressed: () {
                          },
                          child: Text(
                            "Call",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },),
    ),);
  }
}
