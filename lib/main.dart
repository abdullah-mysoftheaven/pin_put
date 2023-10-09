


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:pin_put/scroll_issue/scroll_issue.dart';

import 'ExpandedData/collaps_page.dart';

Future<void> main() async {

  // await GetStorage.init();
  runApp( MyApp());
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   // statusBarColor:awsStartColor,
  //   // systemNavigationBarColor:awsEndColor,
  // ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  GetMaterialApp(
      // color: Colors.lime,
        debugShowCheckedModeBanner: false,

        home: CollapsePage()

      // home: VendorLogInScreen()
      // VendorSignUpScreen(),
      // CartPage(),
    );

  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("AppLifecycleState changed: $state");
    if (state == AppLifecycleState.resumed) {
      //_showToast("resumed");
    }
  }

}

// import 'package:flutter/material.dart';
// import 'package:otp_text_field/otp_text_field.dart';
// import 'package:otp_text_field/style.dart';
// import 'package:telephony/telephony.dart';
//
// void main(){
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Home(),
//     );
//   }
// }
//
// class Home extends StatefulWidget{
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//
//   Telephony telephony = Telephony.instance;
//   OtpFieldController otpbox = OtpFieldController();
//
//   @override
//   void initState() {
//     telephony.listenIncomingSms(
//       onNewMessage: (SmsMessage message) {
//         print("Address = ${message.address}"); //+977981******67, sender nubmer
//         print(message.body); //Your OTP code is 34567
//         print(message.date); //1659690242000, timestamp
//
//         String sms = message.body.toString(); //get the message
//
//         if(message.address == "+8809617611146"){
//           //verify SMS is sent for OTP with sender number
//           String otpcode = sms.replaceAll(new RegExp(r'[^0-9]'),'');
//           //prase code from the OTP sms
//           otpbox.set(otpcode.split(""));
//           //split otp code to list of number
//           //and populate to otb boxes
//
//           setState(() {
//             //refresh UI
//           });
//
//         }else{
//           print("Normal message.");
//         }
//       },
//       listenInBackground: false,
//     );
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//         appBar: AppBar(
//             title: Text("Autofill OTP From SMS"),
//             backgroundColor: Colors.redAccent
//         ),
//         body: Container(
//             padding: EdgeInsets.only(top:50, left:20, right:20),
//             alignment: Alignment.topLeft,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//
//                 Center(
//                   child: Text("Enter OTP Code", style: TextStyle(fontSize: 20),),
//                 ),
//
//                 Padding(padding: EdgeInsets.all(20)),
//
//                 OTPTextField(
//                   controller: otpbox,
//                   length: 4,
//                   width: MediaQuery.of(context).size.width,
//                   fieldWidth: 50,
//                   style: TextStyle(
//                       fontSize: 17
//                   ),
//                   textFieldAlignment: MainAxisAlignment.spaceAround,
//                   fieldStyle: FieldStyle.box,
//                   onCompleted: (pin) {
//                     print("Entered OTP Code: $pin");
//                   },
//                 ),
//
//               ],)
//         )
//     );
//   }
// }