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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff835fd9),
          title: Text("Call Anyone",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        ),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,

                         children: [
                           Column(children: [
                             Text("Prof.Ive",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
                             Padding(
                               padding: const EdgeInsets.only(right: 18.0),
                               child: Text("Teacher",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),
                             ),

                              SizedBox(height: 5,),
                             
                              Container(
                                  width: MediaQuery.of(context).size.width/2.1,
                                  child: Text("Most Indians usually put their money untouched in their bank accounts in hope that their savings remain safe. However, with lower interest rates, saving your . ",style: TextStyle(color: Colors.grey),))
,
                  SizedBox(height: 20,),

                             Center(
                               child: ElevatedButton(
                                 style: ElevatedButton.styleFrom(
                                   primary: Color(0xff7342d5),
                                   shape: RoundedRectangleBorder(
                                     borderRadius:
                                     BorderRadius.all(Radius.circular(20)),
                                   ),
                                 ),
                                 onPressed: () {
                                   openCheckout();
                                 },
                                 child: Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Text(
                                     "            Call            ",
                                     style: TextStyle(
                                         color: Colors.white, fontSize: 18),
                                   ),
                                 ),
                               ),
                             )

                           ],),
                           
                           Column(children: [
                             Container(
                               height: 100,
                               width: 100,
                             decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                 color: Colors.grey,
                                 image: DecorationImage(
                                     image: NetworkImage(
                                         "https://images.unsplash.com/photo-1503185912284-5271ff81b9a8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"))),
                           ),

                           ],)
                         ],
                       )
                  ],
                ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
