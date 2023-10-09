
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:telephony/telephony.dart';


class ScrollIssuePageController extends GetxController {

  Telephony telephony = Telephony.instance;
  final otpbox = OtpFieldController().obs;




  final promoCodeController = TextEditingController().obs;
  var otpText="----".obs;

  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();


  // @override
  // void onInit() {
  //
  //   super.onInit();
  // }

  @override
  void onInit() {
    telephony.listenIncomingSms(
      onNewMessage: (SmsMessage message) {
        print("Address = ${message.address}"); //+977981******67, sender nubmer
        print(message.body); //Your OTP code is 34567
        print(message.date); //1659690242000, timestamp

        String sms = message.body.toString(); //get the message

        if(message.address == "+8809617611146"){
          //verify SMS is sent for OTP with sender number
          String otpcode = sms.replaceAll(new RegExp(r'[^0-9]'),'');
          //prase code from the OTP sms
          // otpbox.set(otpcode.split(""));
          otpbox.value.set(otpcode.split(""));
          //split otp code to list of number
          //and populate to otb boxes
          print("Address = ${otpcode.split("")}");
          otpText(otpcode.split("").toString());
          print("Address = ${otpcode.split("")}");

        }else{
          print("Normal message.");
        }
      },
      listenInBackground: false,
    );
    super.onInit();
  }





}




