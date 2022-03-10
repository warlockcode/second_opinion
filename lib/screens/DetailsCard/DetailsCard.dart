import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:second_opinion/Auth/user_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class DetailsCard extends StatefulWidget {
  const DetailsCard({Key? key}) : super(key: key);

  @override
  _DetailsCardState createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard> {
  late Razorpay _razorpay;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_QISGgBQjGmxqmK',
      'amount': 100,
      'name': 'second_opinion Corp.',
      'description': 'service',
      'external': {
        'wallets': ['paytm']
      }
    };
    _razorpay.open(options);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS: " + (response.paymentId).toString(),
        toastLength: Toast.LENGTH_SHORT);
    _callNumber();
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " +
            response.code.toString() +
            " - " +
            (response.message).toString(),
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + (response.walletName).toString(),
        toastLength: Toast.LENGTH_SHORT);
  }

  _callNumber() async {
    const number = '7060171358'; //set the number here
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }

  var KcardTextStytle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: Color(0xff835fd9),
        //   title: Text("Call Anyone",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        // ),
        body: Column(
          children: [

            Container(

              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color(0xff5297f4),
                    Colors.blue
                  ],
                ),
              ),
              height: MediaQuery.of(context).size.height/2.5,
              child: Padding(
                padding: const EdgeInsets.only(top:48.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 28.0,right: 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.ac_unit,color: Colors.white,),
                          SizedBox(width: 20,),
                          Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: Text("September 29, 2021",style: TextStyle(color: Colors.white),),
                          ),
                          SizedBox(width: 120,),
                          CircleAvatar(
                            maxRadius: 25,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage("https://images.unsplash.com/photo-1646561992933-296946012446?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzNHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60")
                                )
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 8,),
                      Text("Halo, Marissa",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                      SizedBox(height: 8,),
                      Text("What do you need ?",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),

                      Padding(
                        padding: const EdgeInsets.only(right:48.0,top: 28),
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                                
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: ListTile(
                              leading: Icon(Icons.search),
                              title:  TextField(
                                decoration: InputDecoration(
                                  hintText: 'Find a doctor or specialist',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 55.0,right: 55.0,top: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("My Appointment",style: TextStyle(color: Colors.grey,fontSize: 20),),
                  Text("today",style: TextStyle(color: Colors.grey,fontSize: 20))
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 48.0,right: 48.0,top: 15),
              child: Card(
                elevation: 4,
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Color(0xff5195f1),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                            maxRadius: 27,
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage("https://images.unsplash.com/photo-1646561992933-296946012446?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzNHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60")
                                  )
                              ),
                            ),
                          ),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Dr.Sarah Hadid",style: TextStyle(color: Colors.white,fontSize: 18),),
                              Text("Pyscologist",style: TextStyle(color: Colors.white,fontSize: 15),),
                            ],
                          ),

                          GestureDetector(
                            onTap: (){
                              openCheckout();
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(Icons.phone),
                            ),
                          )
                        ],
                      ),

                      SizedBox(height: 25,),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xff76abf7),

                        ),


                        child: Row(
                          children: [
                            Icon(Icons.lock_clock,color: Colors.white,),
                            Text("9am-10 am",style: TextStyle(color: Colors.white),),
                            SizedBox(width: 25,),
                            Icon(Icons.calendar_today_outlined,color: Colors.white,),
                            Text("September 29,2021",style: TextStyle(color: Colors.white),)
                          ],
                        ),
                      ),

                      SizedBox(height: 15,)

                    ],
                  ),
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(left: 48.0,top: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Nearby Doctor",style: TextStyle(color: Colors.grey,fontSize: 20),),
                ],
              ),
            ),

            Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 40.0,right: 48),
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top:18.0),
                child: Card(
                  elevation: 2,
                  color: Color(0xffebf1ff),
                    child: ListTile(
                      leading:  CircleAvatar(
                        maxRadius: 27,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage("https://images.unsplash.com/photo-1646561992933-296946012446?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzNHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60")
                              )
                          ),
                        ),
                      ),

                      title: Text("Dr Aman Singh",style: TextStyle(color: Colors.blue,fontSize: 20),),
                      subtitle: Text("Dermatologist"),
                    ),
                ),
              );
            },),
                ))

          ],
        )
      ),
    );
  }
}
