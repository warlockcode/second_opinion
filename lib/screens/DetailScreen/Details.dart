import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  var KTextStyle=TextStyle(fontSize: 20,fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text("Details Screen"),backgroundColor: Colors.orange,),
      body:   ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
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
                                    'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
                                fit: BoxFit.fill,
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),)
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Childs Doctor",style: KTextStyle,),
                      SizedBox(height: 8 ,),
                      Text("English,Hindi",style: KTextStyle,),
                      SizedBox(height: 8,),
                      Text("exp:7 Years",style: KTextStyle,)
                    ],
                  ),
                  Column(
                    children: [
                      RaisedButton(
                        color: Colors.greenAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        onPressed: (){},
                      child: Text("Apply",style: TextStyle(color: Colors.black,fontSize: 18),),
                      )

                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },),
    ));
  }
}
