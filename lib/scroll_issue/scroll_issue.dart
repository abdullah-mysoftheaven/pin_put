import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:pin_put/scroll_issue/scroll_issue_controller.dart';
import 'package:pinput/pinput.dart';




class ScrollIssuePage extends StatelessWidget {
  // https://www.fluttercampus.com/guide/326/autofill-otp-code-from-sms/
  final cartViewPageController = Get.put(ScrollIssuePageController());
  var width;
  var height;



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    width =MediaQuery.of(context).size.width;
    height =MediaQuery.of(context).size.height;

    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    return Scaffold(
       resizeToAvoidBottomInset: true,
        appBar: AppBar(
            title: Text("Autofill OTP From SMS"),
            backgroundColor: Colors.redAccent
        ),
      body:Container(
          padding: EdgeInsets.only(top:50, left:20, right:20),
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Center(
                child: Text("Enter OTP Code", style: TextStyle(fontSize: 20),),
              ),

              Padding(padding: EdgeInsets.all(20)),

             Obx(() =>  OTPTextField(
               controller: cartViewPageController.otpbox.value,
               length: 4,
               width: MediaQuery.of(context).size.width,
               fieldWidth: 50,
               style: TextStyle(
                   fontSize: 17
               ),
               textFieldAlignment: MainAxisAlignment.spaceAround,
               fieldStyle: FieldStyle.box,
               onCompleted: (pin) {
                 print("Entered OTP Code: $pin");
               },
             )),

              InkWell(
                onTap: (){
                 print("abc= "+cartViewPageController.otpbox.value.toString()) ;
                  // otpbox.set(otpcode.split(""));
                  // cartViewPageController.otpbox.se

                },
                child: Text("Click"),
              ),

              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(() => Text(cartViewPageController.otpText.value,
                  style: TextStyle(fontSize: 30),
                  ))
                ],
              ),



              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(() => Pinput(
                    controller: cartViewPageController.promoCodeController.value,
                    focusNode: cartViewPageController.focusNode,
                    androidSmsAutofillMethod:
                    AndroidSmsAutofillMethod.smsUserConsentApi,
                    listenForMultipleSmsOnAndroid: true,
                    defaultPinTheme: defaultPinTheme,
                    separatorBuilder: (index) => const SizedBox(width: 8),
                    validator: (value) {
                      return null;

                      // value == '2222' ? null : 'Pin is incorrect';
                    },
                    // onClipboardFound: (value) {
                    //   debugPrint('onClipboardFound: $value');
                    //   pinController.setText(value);
                    // },
                    hapticFeedbackType: HapticFeedbackType.lightImpact,
                    onCompleted: (pin) {
                      debugPrint('onCompleted: $pin');
                    },
                    onChanged: (value) {
                      debugPrint('onChanged: $value');
                    },
                    cursor: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 9),
                          width: 22,
                          height: 1,
                          color: focusedBorderColor,
                        ),
                      ],
                    ),
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: focusedBorderColor),
                      ),
                    ),
                    submittedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        color: fillColor,
                        borderRadius: BorderRadius.circular(19),
                        border: Border.all(color: focusedBorderColor),
                      ),
                    ),
                    errorPinTheme: defaultPinTheme.copyBorderWith(
                      border: Border.all(color: Colors.redAccent),
                    ),
                  ),)
                ],
              ),

              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      cartViewPageController.promoCodeController.value.text="1234";
                    },
                    child: Text("hdgfhgdh"),
                  )
                ],
              ),

            ],)
      )

    );

  }








}






