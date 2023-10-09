

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:telephony/telephony.dart';


class CollapsePageController extends GetxController {


  var dataList=[
    DataModelClass(title: '১. ভূমিকা',
    description: "DBID ওয়েবসাইট এ আপনাকে স্বাগতম।\n\n"
        "DBID ওয়েবসাইটটি (\"আমরা\", বা \"আমাদের\") dbid.gov.bd পরিচালনা করে (পরে \"পরিষেবা\" হিসাবে উল্লেখ করা হয়েছে)। "
        "\nআমাদের গোপনীয়তা নীতি dbid.gov.bd এ আপনার পরিদর্শন পরিচালনা করে, এবং ব্যাখ্যা করে যে কিভাবে আমরা আমাদের পরিষেবা ব্যবহার করার ফলে যে তথ্য সংগ্রহ করি, রক্ষা করি এবং প্রকাশ করি। "
        "পরিষেবা প্রদান এবং উন্নত করতে আমরা আপনার ডেটা ব্যবহার করি। পরিষেবা ব্যবহার করে, আপনি এই নীতি অনুসারে তথ্য সংগ্রহ এবং ব্যবহার করতে সম্মত হন। এই গোপনীয়তা নীতিতে অন্যথায় সংজ্ঞায়িত না করা পর্যন্ত, এই গোপনীয়তা নীতিতে ব্যবহৃত শর্তাবলি আমাদের নিয়ম ও শর্তাবলির একই অর্থ বহন করে। "
        "\nআমাদের শর্তাবলি (\"শর্তাবলি\") আমাদের পরিষেবার সমস্ত ব্যবহার পরিচালনা করে এবং গোপনীয়তা নীতি সহ আমাদের সাথে আপনার চুক্তি গঠন করে (\"চুক্তি\")।"),


    DataModelClass (title: 'Title2 ',
    description: "There are many variations of passages of Lorem Ipsum available,"
        "but the majority have suffered alteration in some form  in the middle of text"),
    DataModelClass(title: 'Title3 ',
    description: "There are many variations of passages of Lorem Ipsum available,"
        "but the majority have suffered alteration in some form  in the middle of text"),
    DataModelClass (title: 'Title4 ',
    description: "There are many variations of passages of Lorem Ipsum available,"
        "but the majority have suffered alteration in some form  in the middle of text"),
    DataModelClass (title: 'Title5 ',
    description: "There are many variations of passages of Lorem Ipsum available,"
        "but the majority have suffered alteration in some form  in the middle of text"),
    DataModelClass (title: 'Title6 ',
    description: "There are many variations of passages of Lorem Ipsum available,"
        "but the majority have suffered alteration in some form  in the middle of text"),
    DataModelClass(title: 'Title1 ',
        description: "There are many variations of passages of Lorem Ipsum available,"
            "but the majority have suffered alteration in some form  in the middle of text"),
    DataModelClass (title: 'Title2 ',
        description: "There are many variations of passages of Lorem Ipsum available,"
            "but the majority have suffered alteration in some form  in the middle of text"),
    DataModelClass(title: 'Title3 ',
        description: "There are many variations of passages of Lorem Ipsum available,"
            "but the majority have suffered alteration in some form  in the middle of text"),
    DataModelClass (title: 'Title4 ',
        description: "There are many variations of passages of Lorem Ipsum available,"
            "but the majority have suffered alteration in some form  in the middle of text"),
    DataModelClass (title: 'Title5 ',
        description: "There are many variations of passages of Lorem Ipsum available,"
            "but the majority have suffered alteration in some form  in the middle of text"),
    DataModelClass (title: 'Title6 ',
        description: "There are many variations of passages of Lorem Ipsum available,"
            "but the majority have suffered alteration in some form  in the middle of text")

  ].obs;

  var expandedIndex="-1".obs;

  @override
  void onInit() {
    super.onInit();
  }







}

class DataModelClass{
  String title;
  String description;

  DataModelClass({required this.title, required this.description});
}




