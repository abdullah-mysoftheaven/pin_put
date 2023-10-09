

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:telephony/telephony.dart';

import 'collaps_page.dart';
import 'dbid_data.dart';


class CollapsePageController extends GetxController {


//   var privacyPolicyListBangla =[
//     DataModelClass(title: '১. ভূমিকা',
//     description: "DBID ওয়েবসাইট এ আপনাকে স্বাগতম।\n"
//         "DBID ওয়েবসাইটটি (\"আমরা\", বা \"আমাদের\") dbid.gov.bd পরিচালনা করে (পরে \"পরিষেবা\" হিসাবে উল্লেখ করা হয়েছে)। "
//         "\nআমাদের গোপনীয়তা নীতি dbid.gov.bd এ আপনার পরিদর্শন পরিচালনা করে, এবং ব্যাখ্যা করে যে কিভাবে আমরা আমাদের পরিষেবা ব্যবহার করার ফলে যে তথ্য সংগ্রহ করি, রক্ষা করি এবং প্রকাশ করি। "
//         "পরিষেবা প্রদান এবং উন্নত করতে আমরা আপনার ডেটা ব্যবহার করি। পরিষেবা ব্যবহার করে, আপনি এই নীতি অনুসারে তথ্য সংগ্রহ এবং ব্যবহার করতে সম্মত হন। এই গোপনীয়তা নীতিতে অন্যথায় সংজ্ঞায়িত না করা পর্যন্ত, এই গোপনীয়তা নীতিতে ব্যবহৃত শর্তাবলি আমাদের নিয়ম ও শর্তাবলির একই অর্থ বহন করে। "
//         "\nআমাদের শর্তাবলি (\"শর্তাবলি\") আমাদের পরিষেবার সমস্ত ব্যবহার পরিচালনা করে এবং গোপনীয়তা নীতি সহ আমাদের সাথে আপনার চুক্তি গঠন করে (\"চুক্তি\")।"),
//
//
//     DataModelClass (title: '২. সংজ্ঞা', description: """সার্ভিস মানে ডিবিআইডি দ্বারা পরিচালিত dbid.gov.bd ওয়েবসাইট।\n
// ব্যক্তিগত তথ্য মানে একজন জীবিত ব্যক্তির তথ্য যা সেই তথ্য থেকে চিহ্নিত করা যেতে পারে (অথবা সেগুলি এবং অন্যান্য তথ্য আমাদের দখলে আছে অথবা আমাদের দখলে আসার সম্ভাবনা রয়েছে)।\n
// ইউএসএজিই ডেটা হল স্বয়ংক্রিয়ভাবে সংগৃহীত ডেটা হয় সেবার ব্যবহারের মাধ্যমে অথবা নিজেই পরিষেবা অবকাঠামো থেকে উৎপন্ন হয় (উদাহরণস্বরূপ, একটি পৃষ্ঠা দেখার সময়কাল)।\n
// কুকি হল আপনার ডিভাইসে সংরক্ষিত ছোট ফাইল (কম্পিউটার বা মোবাইল ডিভাইস)।\n
// ডেটা কন্ট্রোলার মানে এমন একজন প্রাকৃতিক বা আইনী ব্যক্তি যিনি (একা বা যৌথভাবে বা অন্যান্য ব্যক্তির সাথে মিলিত) যেসব উদ্দেশ্যে এবং যে পদ্ধতিতে কোন ব্যক্তিগত ডেটা, বা যেভাবে প্রক্রিয়া করা হয় তা নির্ধারণ করে। এই গোপনীয়তা নীতির উদ্দেশ্যে, আমরা আপনার ডেটার ডেটা কন্ট্রোলার।\n
// ডেটা প্রসেসর (বা পরিষেবা প্রদানকারী) মানে এমন কোন প্রাকৃতিক বা আইনী ব্যক্তি যিনি ডেটা কন্ট্রোলারের পক্ষ থেকে ডেটা প্রসেস করেন। আপনার ডেটা আরও কার্যকরভাবে প্রক্রিয়া করার জন্য আমরা বিভিন্ন পরিষেবা প্রদানকারীর পরিষেবা ব্যবহার করতে পারি।\n
// ডেটা সাবজেক্ট যে কোন জীবিত ব্যক্তি যিনি ব্যক্তিগত ডেটার বিষয়।\n
// ব্যবহারকারী আমাদের পরিষেবা ব্যবহারকারী ব্যক্তি। ব্যবহারকারী ডেটা সাবজেক্টের সাথে মিলে যায়, যিনি ব্যক্তিগত ডেটার বিষয়।"""),
//     DataModelClass (title: '৩. তথ্য সংগ্রহ এবং ব্যবহার', description: """আমরা আপনাকে আমাদের পরিষেবা প্রদান এবং উন্নত করার জন্য বিভিন্ন উদ্দেশ্যে বিভিন্ন ধরণের তথ্য সংগ্রহ করি।
// """),
//     DataModelClass(title: "৪. সংগৃহীত ডেটার ধরন", description: """ব্যক্তিগত তথ্য
// আমাদের পরিষেবা ব্যবহার করার সময়, আমরা আপনাকে কিছু ব্যক্তিগতভাবে শনাক্তযোগ্য তথ্য প্রদান করতে বলতে পারি যা আপনার সাথে যোগাযোগ বা সনাক্ত করতে ব্যবহার করা যেতে পারে ("ব্যক্তিগত ডেটা")। ব্যক্তিগতভাবে, শনাক্তযোগ্য তথ্য অন্তর্ভুক্ত হতে পারে, কিন্তু এর মধ্যে সীমাবদ্ধ নয়:
// 0.১ ইমেইল ঠিকানা
// 0.২। প্রথম নাম এবং শেষ নাম
// 0.৩। ফোন নম্বর
// 0.৪। ঠিকানা, দেশ, রাজ্য, প্রদেশ, জিপ/পোস্টাল কোড, শহর
// 0.৫ কুকিজ এবং ব্যবহারের ডেটা
// আমরা আপনার ব্যক্তিগত তথ্য ব্যবহার করে নিউজলেটার, মার্কেটিং বা প্রচারমূলক সামগ্রী এবং অন্যান্য তথ্য যা আপনার আগ্রহের হতে পারে তার সাথে যোগাযোগ করতে পারি। আপনি আনসাবস্ক্রাইব লিঙ্কটি অনুসরণ করে আমাদের কাছ থেকে এই সমস্ত যোগাযোগের যেকোনো বা সবগুলি গ্রহণ করা থেকে অপসারণ করতে পারেন।
// ব্যবহারের ডেটা
// আপনি যখনই আমাদের পরিষেবা পরিদর্শন করবেন অথবা যখন আপনি কোন ডিভাইসে ("ব্যবহার ডেটা") ব্যবহার করবেন তখন আপনার ব্রাউজার পাঠানো তথ্য আমরা সংগ্রহ করতে পারি।
// এই ব্যবহারের ডেটাতে আপনার কম্পিউটারের ইন্টারনেট প্রোটোকল ঠিকানা (যেমন আইপি ঠিকানা), ব্রাউজারের ধরন, ব্রাউজার সংস্করণ, আমাদের পরিষেবার পৃষ্ঠাগুলি যা আপনি পরিদর্শন করেন, আপনার ভিজিটের সময় এবং তারিখ, সেই পৃষ্ঠাগুলিতে ব্যয় করা সময়, অনন্য ডিভাইস শনাক্তকারী এবং অন্যান্য ডায়াগনস্টিক ডেটা
// যখন আপনি একটি ডিভাইসের মাধ্যমে পরিষেবা অ্যাক্সেস করেন, এই ব্যবহারের ডেটাতে আপনি যে ধরনের ডিভাইসের ব্যবহার করেন, আপনার ডিভাইসের অনন্য আইডি, আপনার ডিভাইসের আইপি ঠিকানা, আপনার ডিভাইসের অপারেটিং সিস্টেম, আপনার ব্যবহৃত ইন্টারনেট ব্রাউজারের ধরন, অনন্য ডিভাইস ইত্যাদি তথ্য অন্তর্ভুক্ত থাকতে পারে। শনাক্তকারী এবং অন্যান্য ডায়াগনস্টিক ডেটা
// ট্র্যাকিং কুকিজ ডেটা
// আমরা আমাদের পরিষেবাতে ক্রিয়াকলাপ ট্র্যাক করতে কুকিজ এবং অনুরূপ ট্র্যাকিং প্রযুক্তি ব্যবহার করি এবং আমরা কিছু তথ্য রাখি।
// কুকি হল এমন একটি ফাইল যা অল্প পরিমাণে ডেটা থাকে যার মধ্যে একটি বেনামী অনন্য শনাক্তকারী অন্তর্ভুক্ত থাকতে পারে। কুকিজ একটি ওয়েবসাইট থেকে আপনার ব্রাউজারে পাঠানো হয় এবং আপনার ডিভাইসে সংরক্ষণ করা হয়। অন্যান্য ট্র্যাকিং প্রযুক্তিগুলিও ব্যবহার করা হয় যেমন বীকন, ট্যাগ এবং স্ক্রিপ্ট তথ্য সংগ্রহ এবং ট্র্যাক করতে এবং আমাদের পরিষেবা উন্নত এবং বিশ্লেষণ করতে।
// আপনি আপনার ব্রাউজারকে সব কুকিজ প্রত্যাখ্যান করতে বা কুকি কখন পাঠানো হচ্ছে তা নির্দেশ করতে পারেন। যাইহোক, যদি আপনি কুকিজ গ্রহণ না করেন, তাহলে আপনি আমাদের পরিষেবার কিছু অংশ ব্যবহার করতে পারবেন না।
// কুকিজের উদাহরণ আমরা ব্যবহার করি:
// 0.১ সেশন কুকিজ: আমরা আমাদের সেবা চালানোর জন্য সেশন কুকি ব্যবহার করি।
// 0.২। পছন্দ কুকিজ: আমরা আপনার পছন্দ এবং বিভিন্ন সেটিংস মনে রাখতে পছন্দ কুকিজ ব্যবহার করি।
// 0.৩। সিকিউরিটি কুকিজ: আমরা নিরাপত্তার জন্য সিকিউরিটি কুকি ব্যবহার করি।
// 0.৪। বিজ্ঞাপন কুকি: বিজ্ঞাপন কুকিজ আপনাকে এবং আপনার আগ্রহের সাথে প্রাসঙ্গিক হতে পারে এমন বিজ্ঞাপন দিয়ে আপনাকে পরিবেশন করতে ব্যবহৃত হয়।
// অন্যান্য ডেটা
// আমাদের পরিষেবা ব্যবহার করার সময়, আমরা নিম্নলিখিত তথ্যগুলিও সংগ্রহ করতে পারি: লিঙ্গ, বয়স, জন্ম তারিখ, জন্মস্থান, পাসপোর্টের বিবরণ, নাগরিকত্ব, বসবাসের স্থানে নিবন্ধন এবং প্রকৃত ঠিকানা, টেলিফোন নম্বর (কাজ, মোবাইল), নথির বিবরণ শিক্ষা, যোগ্যতা, পেশাগত প্রশিক্ষণ, কর্মসংস্থান চুক্তি, এনডিএ চুক্তি, বোনাস এবং ক্ষতিপূরণ সম্পর্কিত তথ্য, বৈবাহিক অবস্থা, পরিবারের সদস্য, সামাজিক নিরাপত্তা (বা অন্যান্য করদাতা সনাক্তকরণ) নম্বর, অফিসের অবস্থান এবং অন্যান্য ডেটা।"""),
//     DataModelClass(title: "৫. ডেটার ব্যবহার", description: """dbid বিভিন্ন উদ্দেশ্যে সংগৃহীত তথ্য ব্যবহার করে:
// 0.১ আমাদের পরিষেবা প্রদান এবং বজায় রাখার জন্য;
// 0.২। আমাদের সেবার পরিবর্তন সম্পর্কে আপনাকে অবহিত করতে;
// 0.৩। আপনি যখন আমাদের সেবার ইন্টারেক্টিভ ফিচারে অংশ নেওয়ার অনুমতি দেবেন;
// 0.৪। গ্রাহক সহায়তা প্রদান;
// 0.৫ বিশ্লেষণ বা মূল্যবান তথ্য সংগ্রহ করা যাতে আমরা আমাদের পরিষেবা উন্নত করতে পারি;
// 0.৬। আমাদের পরিষেবার ব্যবহার পর্যবেক্ষণ করতে;
// 0.৭। প্রযুক্তিগত সমস্যাগুলি সনাক্ত করা, প্রতিরোধ করা এবং সমাধান করা;
// 0.৮। অন্য কোন উদ্দেশ্য পূরণ করার জন্য যা আপনি প্রদান করেন;
// 0.৯। আমাদের দায়িত্ব পালন করা এবং বিলিং এবং সংগ্রহ সহ আপনার এবং আমাদের মধ্যে যে কোনো চুক্তি থেকে উদ্ভূত আমাদের অধিকারগুলি কার্যকর করা;
// 0.১০। আপনার অ্যাকাউন্ট এবং/অথবা সাবস্ক্রিপশন সম্পর্কে মেয়াদোত্তীর্ণ এবং পুনর্নবীকরণ বিজ্ঞপ্তি, ই -মেইল-নির্দেশাবলী ইত্যাদি সহ আপনাকে বিজ্ঞপ্তি প্রদান করতে;
// 0.১১। আমরা আপনাকে সরবরাহ করা অন্যান্য পণ্য, পরিষেবা এবং ইভেন্টগুলি সম্পর্কে সংবাদ, বিশেষ অফার এবং সাধারণ তথ্য প্রদান করার জন্য যা আপনি ইতিমধ্যেই কিনেছেন বা জিজ্ঞাসা করেছেন, যদি না আপনি এই ধরনের তথ্য না পাওয়ার সিদ্ধান্ত না নেন;
// 0.১২। যখন আপনি তথ্য প্রদান করেন তখন অন্য কোন উপায়ে আমরা বর্ণনা করতে পারি;
// 0.১৩। আপনার সম্মতির সাথে অন্য কোন উদ্দেশ্যে।"""),
//     DataModelClass(title: "৬. ডেটা ধরে রাখা", description: """এই গোপনীয়তা নীতিতে নির্ধারিত উদ্দেশ্যে যতক্ষণ প্রয়োজন ততক্ষণ আমরা আপনার ব্যক্তিগত তথ্য ধরে রাখব। আমরা আপনার ব্যক্তিগত ডেটা আমাদের আইনী বাধ্যবাধকতা মেনে চলার জন্য প্রয়োজনীয় পরিমাণে ধরে রাখব এবং ব্যবহার করব (উদাহরণস্বরূপ, প্রযোজ্য আইন মেনে চলার জন্য যদি আমাদের আপনার ডেটা ধরে রাখতে হয়), বিরোধ নিষ্পত্তি করতে এবং আমাদের আইনি চুক্তি এবং নীতিগুলি কার্যকর করতে।
// আমরা অভ্যন্তরীণ বিশ্লেষণের উদ্দেশ্যে ব্যবহারের ডেটাও ধরে রাখব। ব্যবহারের ডেটা সাধারণত স্বল্প সময়ের জন্য ধরে রাখা হয়, এই ডেটাটি নিরাপত্তা জোরদার করার জন্য বা আমাদের সেবার কার্যকারিতা উন্নত করার জন্য ব্যবহার করা হয়, অথবা আমরা আইনগতভাবে এই ডেটা দীর্ঘ সময়ের জন্য ধরে রাখতে বাধ্য।"""),
//     DataModelClass(title: "৭. তথ্য স্থানান্তর", description: """ব্যক্তিগত তথ্য সহ আপনার তথ্য, আপনার রাজ্য, প্রদেশ, দেশ বা অন্যান্য সরকারি এখতিয়ারের বাইরে অবস্থিত কম্পিউটারে স্থানান্তরিত এবং রক্ষণাবেক্ষণ করা যেতে পারে যেখানে ডেটা সুরক্ষা আইন আপনার এখতিয়ারের থেকে ভিন্ন হতে পারে।
// আপনি যদি বাংলাদেশের বাইরে থাকেন এবং আমাদের তথ্য প্রদান করতে চান, দয়া করে মনে রাখবেন যে আমরা ব্যক্তিগত তথ্য সহ তথ্য বাংলাদেশে স্থানান্তর করি এবং সেখানে প্রক্রিয়া করি।
// এই গোপনীয়তা নীতিতে আপনার সম্মতি এবং আপনার এই ধরনের তথ্য জমা দেওয়ার পরে সেই স্থানান্তরের প্রতি আপনার চুক্তির প্রতিনিধিত্ব করে।
// আপনার ডেটা সুরক্ষিতভাবে এবং এই গোপনীয়তা নীতি অনুসারে নিশ্চিত করার জন্য ডিবিআইডি যুক্তিসঙ্গতভাবে প্রয়োজনীয় সমস্ত পদক্ষেপ গ্রহণ করবে এবং আপনার ব্যক্তিগত ডেটা কোনও সংস্থা বা দেশে স্থানান্তরিত হবে না যতক্ষণ না নিরাপত্তা সহ পর্যাপ্ত নিয়ন্ত্রণ থাকে। আপনার ডেটা এবং অন্যান্য ব্যক্তিগত তথ্য"""),
//     DataModelClass(title: "৮. তথ্য প্রকাশ", description: """আমরা সংগৃহীত ব্যক্তিগত তথ্য প্রকাশ করতে পারি, অথবা আপনি প্রদান করেন:
// ০.১ আইন প্রয়োগের জন্য প্রকাশ।
// নির্দিষ্ট পরিস্থিতিতে, আইন দ্বারা বা সরকারি কর্তৃপক্ষের বৈধ অনুরোধের জবাবে আমাদের ব্যক্তিগত তথ্য প্রকাশের প্রয়োজন হতে পারে।
// ০.২। ব্যবসায়িক লেনদেনে.
// যদি আমরা বা আমাদের সহযোগী সংস্থাগুলি একত্রীকরণ, অধিগ্রহণ বা সম্পদ বিক্রির সাথে জড়িত থাকে তবে আপনার ব্যক্তিগত ডেটা স্থানান্তরিত হতে পারে।
// ০.৩। অন্যান্য ক্ষেত্রে। আমরা আপনার তথ্যও প্রকাশ করতে পারি:
// ০.৩.১। আমাদের সহায়ক এবং সহযোগী সংস্থাগুলির কাছে;
// ০.৩.২। ঠিকাদার, পরিষেবা প্রদানকারী এবং অন্যান্য তৃতীয় পক্ষের কাছে যা আমরা আমাদের ব্যবসা সমর্থন করতে ব্যবহার করি;
// ০.৩.৩। আপনি যে উদ্দেশ্যে এটি প্রদান করেছেন তা পূরণ করতে;
// ০.৩.৪। আমাদের ওয়েবসাইটে আপনার কোম্পানির লোগো অন্তর্ভুক্ত করার উদ্দেশ্যে;
// ০.৩.৫। যখন আপনি তথ্য প্রদান করেন তখন আমাদের দ্বারা প্রকাশিত অন্য কোন উদ্দেশ্যে;
// ০.৩.৬। অন্য কোন ক্ষেত্রে আপনার সম্মতি সহ;
// ০.৩.৭। যদি আমরা বিশ্বাস করি যে কোম্পানি, আমাদের গ্রাহক বা অন্যদের অধিকার, সম্পত্তি বা নিরাপত্তা রক্ষার জন্য প্রকাশ প্রয়োজন বা উপযুক্ত।"""),
//     DataModelClass(title: "৯. ডেটার নিরাপত্তা", description: """আপনার ডেটার নিরাপত্তা আমাদের জন্য গুরুত্বপূর্ণ কিন্তু মনে রাখবেন যে ইন্টারনেটে ট্রান্সমিশনের কোন পদ্ধতি বা ইলেকট্রনিক স্টোরেজ পদ্ধতি 100% নিরাপদ নয়। যদিও আমরা আপনার ব্যক্তিগত তথ্য সুরক্ষার জন্য বাণিজ্যিকভাবে গ্রহণযোগ্য উপায় ব্যবহার করার চেষ্টা করি, আমরা এর সম্পূর্ণ নিরাপত্তার নিশ্চয়তা দিতে পারি না।"""),
//     DataModelClass(title: "১০. সাধারণ ডেটা সুরক্ষা নিয়ন্ত্রণের অধীনে আপনার ডেটা সুরক্ষা অধিকার (জিডিপিআর)", description: """আপনি যদি ইউরোপীয় ইউনিয়ন (ইইউ) এবং ইউরোপীয় অর্থনৈতিক অঞ্চলের (ইইএ) বাসিন্দা হন, তাহলে আপনার জিডিপিআর দ্বারা আচ্ছাদিত কিছু ডেটা সুরক্ষা অধিকার রয়েছে।
// আমরা আপনার ব্যক্তিগত ডেটা সংশোধন, সংশোধন, মুছে ফেলার বা সীমাবদ্ধ করার অনুমতি দেওয়ার জন্য যুক্তিসঙ্গত পদক্ষেপ গ্রহণের লক্ষ্য নিয়েছি।
// আপনার সম্পর্কে আমরা কোন ব্যক্তিগত তথ্য রাখি তা যদি আপনি জানতে চান এবং যদি আপনি আমাদের সিস্টেম থেকে এটি সরিয়ে নিতে চান, তাহলে আমাদের dbid.gov.bd এ ই -মেইল করুন।
// নির্দিষ্ট পরিস্থিতিতে, আপনার নিম্নলিখিত ডেটা সুরক্ষা অধিকার রয়েছে:
// ০.১। অ্যাক্সেস, আপডেট বা আপনার কাছে থাকা তথ্য মুছে ফেলার অধিকার;
// ০.২। সংশোধনের অধিকার। যদি আপনার তথ্য ভুল বা অসম্পূর্ণ থাকে তবে আপনার তথ্য সংশোধন করার অধিকার আপনার আছে;
// ০.৩। আপত্তি করার অধিকার। আপনার ব্যক্তিগত তথ্য আমাদের প্রক্রিয়াকরণে আপত্তি করার অধিকার আপনার আছে;
// ০.৪। সীমাবদ্ধতার অধিকার। আপনার অনুরোধ করার অধিকার আছে যে আমরা আপনার ব্যক্তিগত তথ্যের প্রক্রিয়াকরণ সীমাবদ্ধ করি;
// ০.৫। তথ্য বহন করার অধিকার। আপনার ব্যক্তিগত তথ্যের একটি অনুলিপি একটি কাঠামোগত, মেশিন-পঠনযোগ্য এবং সাধারণত ব্যবহৃত ফর্ম্যাটে সরবরাহ করার অধিকার রয়েছে;
// ০.৬। সম্মতি প্রত্যাহারের অধিকার। আপনার ব্যক্তিগত তথ্য প্রক্রিয়া করার জন্য আমরা আপনার সম্মতির উপর নির্ভর করে যে কোন সময় আপনার সম্মতি প্রত্যাহার করার অধিকারও আপনার আছে;
// দয়া করে মনে রাখবেন যে এই ধরনের অনুরোধের উত্তর দেওয়ার আগে আমরা আপনাকে আপনার পরিচয় যাচাই করতে বলব। দয়া করে মনে রাখবেন, আমরা কিছু প্রয়োজনীয় ডেটা ছাড়া পরিষেবা প্রদান করতে পারব না।
// আপনার ব্যক্তিগত ডেটা সংগ্রহ এবং ব্যবহার সম্পর্কে আপনার ডেটা সুরক্ষা কর্তৃপক্ষের কাছে অভিযোগ করার অধিকার আছে। আরও তথ্যের জন্য, দয়া করে ইউরোপীয় অর্থনৈতিক এলাকায় (EEA) আপনার স্থানীয় ডেটা সুরক্ষা কর্তৃপক্ষের সাথে যোগাযোগ করুন।"""),
//     DataModelClass(title: "১১. ক্যালিফোর্নিয়া প্রাইভেসি প্রোটেকশন অ্যাক্ট (ক্যালোপপা) এর অধীনে আপনার ডেটা সুরক্ষা অধিকার", description: """CalOPPA হল দেশের প্রথম রাজ্য আইন যার জন্য গোপনীয়তা নীতি পোস্ট করার জন্য বাণিজ্যিক ওয়েবসাইট এবং অনলাইন পরিষেবা প্রয়োজন। ক্যালিফোর্নিয়া অতিক্রম করে আইনের আওতায় মার্কিন যুক্তরাষ্ট্রে একজন ব্যক্তি বা কোম্পানির প্রয়োজন (এবং বিশ্বকে কল্পনা করা যায়) যা ক্যালিফোর্নিয়া ভোক্তাদের কাছ থেকে ব্যক্তিগতভাবে সনাক্তযোগ্য তথ্য সংগ্রহ করার ওয়েবসাইটগুলি পরিচালনা করে যাতে তার ওয়েবসাইটে একটি স্পষ্ট গোপনীয়তা নীতি পোস্ট করা হয় যাতে ঠিক তথ্য সংগ্রহ করা হয় এবং সেগুলি যাদের সাথে এটি শেয়ার করা হচ্ছে, এবং এই নীতি মেনে চলার জন্য।
// CalOPPA অনুযায়ী আমরা নিম্নলিখিতগুলির সাথে সম্মত:
// ০.১। ব্যবহারকারীরা বেনামে আমাদের সাইট পরিদর্শন করতে পারেন;
// ০.২। আমাদের গোপনীয়তা নীতির লিঙ্কটিতে "গোপনীয়তা" শব্দটি অন্তর্ভুক্ত রয়েছে এবং সহজেই আমাদের ওয়েবসাইটের হোম পেজে পাওয়া যাবে;
// ০.৩। আমাদের গোপনীয়তা নীতি পৃষ্ঠায় ব্যবহারকারীদের গোপনীয়তা নীতি পরিবর্তনের বিষয়ে অবহিত করা হবে;
// ০.৫।ব্যবহারকারীরা dbid.gov.bd এ আমাদের ই -মেইল করে তাদের ব্যক্তিগত তথ্য পরিবর্তন করতে পারবেন।
// "ট্র্যাক করবেন না" সংকেত সম্পর্কে আমাদের নীতি:
// আমরা ট্র্যাক করি না সিগন্যালগুলিকে সম্মান করি এবং ট্র্যাক করি না, কুকি লাগাই না, বা বিজ্ঞাপন ব্যবহার করি না যখন ব্রাউজারের একটি পদ্ধতি চালু থাকে। ট্র্যাক করবেন না এমন একটি পছন্দ যা আপনি আপনার ওয়েব ব্রাউজারে সেট করতে পারেন এমন ওয়েবসাইটগুলিকে জানাতে যে আপনি ট্র্যাক করতে চান না।
// আপনি আপনার ওয়েব ব্রাউজারের পছন্দ বা সেটিংস পৃষ্ঠায় গিয়ে ট্র্যাক করবেন না সক্ষম বা অক্ষম করতে পারেন।"""),
//     DataModelClass(title: "১২. ক্যালিফোর্নিয়া ভোক্তা গোপনীয়তা আইন (সিসিপিএ) এর অধীনে আপনার ডেটা সুরক্ষা অধিকার", description: """আপনি যদি ক্যালিফোর্নিয়ার বাসিন্দা হন, তাহলে আপনার সম্পর্কে আমরা কোন তথ্য সংগ্রহ করি তা জানার অধিকার আছে, আপনার ডেটা মুছে ফেলতে বলুন এবং এটি বিক্রি (শেয়ার) না করার জন্য বলুন। আপনার ডেটা সুরক্ষা অধিকার প্রয়োগ করতে, আপনি কিছু অনুরোধ করতে পারেন এবং আমাদের জিজ্ঞাসা করতে পারেন:
// ০.১। আপনার সম্পর্কে আমাদের কোন ব্যক্তিগত তথ্য আছে। আপনি যদি এই অনুরোধটি করেন, আমরা আপনার কাছে ফিরে আসব:
// ০.০.১। আমরা আপনার সম্পর্কে সংগৃহীত ব্যক্তিগত তথ্যের বিভাগগুলি।
// ০.০.২। যেসব উৎসের উৎস থেকে আমরা আপনার ব্যক্তিগত তথ্য সংগ্রহ করি।
// ০.০.৩। আপনার ব্যক্তিগত তথ্য সংগ্রহ বা বিক্রয়ের জন্য ব্যবসা বা বাণিজ্যিক উদ্দেশ্য।
// ০.০.৪। তৃতীয় পক্ষের বিভাগ যাদের সঙ্গে আমরা ব্যক্তিগত তথ্য শেয়ার করি।
// ০.০.৫। আপনার সম্পর্কে আমরা যে ব্যক্তিগত তথ্য সংগ্রহ করেছি তার নির্দিষ্ট অংশ।
// ০.০.৬। আমরা বিক্রি করেছি এমন ব্যক্তিগত তথ্যের বিভাগগুলির তালিকা, অন্য যে কোনও সংস্থার শ্রেণীর সাথে আমরা এটি বিক্রি করেছি। যদি আমরা আপনার ব্যক্তিগত তথ্য বিক্রি না করে থাকি, তাহলে আমরা আপনাকে সেই তথ্য জানাব।
// ০.০.৭। ব্যক্তিগত তথ্যের বিভাগগুলির একটি তালিকা যা আমরা একটি ব্যবসায়িক উদ্দেশ্যে প্রকাশ করেছি, সেই সাথে অন্য যে কোন কোম্পানির শ্রেণী যা আমরা এটি ভাগ করেছি।
// অনুগ্রহ করে মনে রাখবেন, আপনি আমাদের বারো মাসের সময়কালে দুইবার পর্যন্ত এই তথ্য প্রদান করতে বলার অধিকারী। যখন আপনি এই অনুরোধটি করেন, তখন প্রদত্ত তথ্যগুলি আপনার সম্পর্কে আগের 12 মাসে সংগৃহীত ব্যক্তিগত তথ্যের মধ্যে সীমাবদ্ধ থাকতে পারে।
// ০.২। আপনার ব্যক্তিগত তথ্য মুছে ফেলার জন্য। আপনি যদি এই অনুরোধটি করেন, তাহলে আমরা আপনার রেকর্ড থেকে আপনার অনুরোধের তারিখ পর্যন্ত আপনার সম্পর্কে থাকা ব্যক্তিগত তথ্য মুছে ফেলব এবং যেকোন পরিষেবা প্রদানকারীকেও তা করার নির্দেশ দেব। কিছু ক্ষেত্রে, তথ্যটি ডি-সনাক্তকরণের মাধ্যমে মুছে ফেলা হতে পারে। আপনি যদি আপনার ব্যক্তিগত তথ্য মুছে ফেলার সিদ্ধান্ত নেন, তাহলে আপনি এমন কিছু ফাংশন ব্যবহার করতে পারবেন না যার জন্য আপনার ব্যক্তিগত তথ্যের প্রয়োজন হয়।
// ০.৩। আপনার ব্যক্তিগত তথ্য বিক্রি বন্ধ করতে। আমরা আপনার ব্যক্তিগত তথ্য কোন তৃতীয় পক্ষের কাছে কোন উদ্দেশ্যে বিক্রি বা ভাড়া দেই না। আর্থিক বিবেচনার জন্য আমরা আপনার ব্যক্তিগত তথ্য বিক্রি করি না। যাইহোক, কিছু পরিস্থিতিতে, আর্থিক বিবেচনা ছাড়াই তৃতীয় পক্ষের কাছে বা আমাদের কোম্পানির পরিবারের মধ্যে ব্যক্তিগত তথ্য স্থানান্তরকে ক্যালিফোর্নিয়ার আইনের অধীনে "বিক্রয়" হিসাবে বিবেচনা করা যেতে পারে। আপনি আপনার ব্যক্তিগত ডেটার একমাত্র মালিক এবং যে কোন সময় প্রকাশ বা মুছে ফেলার অনুরোধ করতে পারেন।
// আপনি যদি আপনার ব্যক্তিগত তথ্য বিক্রি বন্ধ করার অনুরোধ জমা দেন, তাহলে আমরা এই ধরনের স্থানান্তর করা বন্ধ করে দেব।
// দয়া করে মনে রাখবেন, যদি আপনি আমাদের আপনার ডেটা মুছে ফেলতে বা বিক্রি বন্ধ করতে বলেন, তাহলে এটি আমাদের সাথে আপনার অভিজ্ঞতাকে প্রভাবিত করতে পারে এবং আপনি কিছু প্রোগ্রাম বা সদস্যপদ সেবায় অংশগ্রহণ করতে পারবেন না যার জন্য আপনার ব্যক্তিগত তথ্যের ব্যবহার প্রয়োজন। কিন্তু কোন অবস্থাতেই, আমরা আপনার অধিকার প্রয়োগের জন্য আপনার সাথে বৈষম্য করব না।
// উপরে বর্ণিত আপনার ক্যালিফোর্নিয়া ডেটা সুরক্ষা অধিকারগুলি ব্যবহার করতে, দয়া করে আপনার অনুরোধ (গুলি) ই -মেইলের মাধ্যমে পাঠান: dbid.gov.bd।
// উপরে বর্ণিত আপনার ডেটা সুরক্ষা অধিকারগুলি CCPA দ্বারা আচ্ছাদিত, ক্যালিফোর্নিয়া ভোক্তা গোপনীয়তা আইনের সংক্ষিপ্ত। আরো জানতে, অফিসিয়াল ক্যালিফোর্নিয়া আইন সংক্রান্ত তথ্য ওয়েবসাইট দেখুন। CCPA 01/01/2020 থেকে কার্যকর হয়েছে।"""),
//     DataModelClass(title: "১৩. পরিষেবা প্রদানকারী", description: """আমরা আমাদের পরিষেবা ("পরিষেবা প্রদানকারী"), আমাদের পক্ষ থেকে পরিষেবা প্রদান, পরিষেবা-সম্পর্কিত পরিষেবাগুলি সম্পাদন বা আমাদের পরিষেবা কীভাবে ব্যবহার করা হয় তা বিশ্লেষণে আমাদের সহায়তা করার জন্য তৃতীয় পক্ষের সংস্থা এবং ব্যক্তিদের নিয়োগ করতে পারি।
// আমাদের পক্ষ থেকে এই কাজগুলো করার জন্য এই তৃতীয় পক্ষগুলি আপনার ব্যক্তিগত তথ্য অ্যাক্সেস করতে পারে এবং এটি অন্য কোন উদ্দেশ্যে প্রকাশ বা ব্যবহার করতে বাধ্য নয়।"""),
//     DataModelClass(title: "১৪. বিশ্লেষণ", description: """আমরা আমাদের পরিষেবার ব্যবহার পর্যবেক্ষণ এবং বিশ্লেষণ করতে তৃতীয় পক্ষের পরিষেবা প্রদানকারী ব্যবহার করতে পারি।"""),
//     DataModelClass(title: "১৫. CI/CD সরঞ্জাম", description: """আমরা আমাদের পরিষেবার উন্নয়ন প্রক্রিয়া স্বয়ংক্রিয় করতে তৃতীয় পক্ষের পরিষেবা প্রদানকারী ব্যবহার করতে পারি।"""),
//     DataModelClass(title: "১৬. বিহেভিওরাল রি মার্কেটিং", description: """আপনি আমাদের পরিষেবা পরিদর্শন করার পর তৃতীয় পক্ষের ওয়েবসাইটে বিজ্ঞাপন দিতে আমরা পুনরায় বিপণন পরিষেবা ব্যবহার করতে পারি। আমরা এবং আমাদের তৃতীয় পক্ষের বিক্রেতারা আমাদের পরিষেবাতে আপনার অতীতের ভিজিটের উপর ভিত্তি করে বিজ্ঞাপনগুলি জানান, অপ্টিমাইজ এবং পরিবেশন করার জন্য কুকি ব্যবহার করেন।"""),
//     DataModelClass(title: "১৭. অন্যান্য সাইটের লিঙ্ক", description: """আমাদের সেবায় অন্যান্য সাইটের লিঙ্ক থাকতে পারে যা আমাদের দ্বারা পরিচালিত হয় না। আপনি যদি তৃতীয় পক্ষের লিঙ্কে ক্লিক করেন, আপনাকে সেই তৃতীয় পক্ষের সাইটে নির্দেশিত করা হবে। আমরা আপনাকে দুভাবে পরামর্শ দিচ্ছি যে আপনি প্রতিটি সাইটের গোপনীয়তা নীতি পর্যালোচনা করুন।
// আমাদের কোন নিয়ন্ত্রণ নেই এবং কোন তৃতীয় পক্ষের সাইট বা পরিষেবার বিষয়বস্তু, গোপনীয়তা নীতি বা অনুশীলনের জন্য কোন দায়বদ্ধতা নেই।
// উদাহরণস্বরূপ, রূপরেখিত গোপনীয়তা নীতি PolicyMaker.io ব্যবহার করে তৈরি করা হয়েছে, একটি বিনামূল্যে হাতিয়ার যা উচ্চমানের আইনি নথি তৈরি করতে সাহায্য করে। ব্লগ, ওয়েবসাইট, ই-কমার্স স্টোর বা মোবাইল অ্যাপের জন্য প্রাইভেসি পলিসি তৈরির জন্য পলিসিমেকারের প্রাইভেসি পলিসি জেনারেটর একটি সহজেই ব্যবহারযোগ্য টুল।"""),
//     DataModelClass(title: "১৮. শিশুদের গোপনীয়তা", description: """আমাদের পরিষেবাগুলি ১৮ বছরের কম বয়সী শিশুদের ("শিশু" বা "শিশু") দ্বারা ব্যবহারের উদ্দেশ্যে নয়।
// আমরা ১৮ বছরের কম বয়সী শিশুদের কাছ থেকে ব্যক্তিগতভাবে শনাক্তযোগ্য তথ্য সংগ্রহ করি না। যদি আপনি সচেতন হন যে একটি শিশু আমাদের ব্যক্তিগত তথ্য প্রদান করেছে, তাহলে দয়া করে আমাদের সাথে যোগাযোগ করুন। যদি আমরা সচেতন হই যে আমরা পিতামাতার সম্মতি যাচাই ছাড়াই শিশুদের কাছ থেকে ব্যক্তিগত তথ্য সংগ্রহ করেছি, আমরা আমাদের সার্ভার থেকে সেই তথ্য অপসারণের পদক্ষেপ গ্রহণ করি।"""),
//     DataModelClass(title: "১৯. এই গোপনীয়তা নীতিতে পরিবর্তন", description: """আমরা সময়ে সময়ে আমাদের গোপনীয়তা নীতি আপডেট করতে পারি। এই পৃষ্ঠায় নতুন গোপনীয়তা নীতি পোস্ট করে আমরা আপনাকে কোন পরিবর্তন সম্পর্কে অবহিত করব।
// পরিবর্তনটি কার্যকর হওয়ার আগে এবং আমাদের গোপনীয়তা নীতির শীর্ষে "কার্যকর তারিখ" আপডেট করার পূর্বে আমরা আপনাকে ইমেইল এবং/অথবা আমাদের পরিষেবার একটি বিশিষ্ট নোটিশের মাধ্যমে জানাবো।
// যেকোনো পরিবর্তনের জন্য আপনাকে পর্যায়ক্রমে এই গোপনীয়তা নীতি পর্যালোচনা করার পরামর্শ দেওয়া হচ্ছে। এই গোপনীয়তা নীতিতে পরিবর্তনগুলি যখন এই পৃষ্ঠায় পোস্ট করা হয় তখন কার্যকর হয়।"""),
//     DataModelClass(title: "২০. আমাদের সাথে যোগাযোগ করুন", description: """এই গোপনীয়তা নীতি সম্পর্কে আপনার যদি কোন প্রশ্ন থাকে, দয়া করে আমাদের সাথে ই -মেইলের মাধ্যমে যোগাযোগ করুন: support@dbid.gov.bd।
// """),
//
//
//   ].obs;
//
//   var privacyPolicyListEnglish = [
//     DataModelClass(title: "1. Introduction", description: """Welcome to the DBID website.
// The DBID website ("we", or "our") operates dbid.gov.bd (hereinafter referred to as the "Service").
// Our Privacy Policy governs your visit to dbid.gov.bd, and explains how we collect, protect, and disclose information that results from your use of our Services.
// We use your data to provide and improve the Service. By using the Service, you consent to the collection and use of information in accordance with this Policy. Unless otherwise defined in this Privacy Policy, terms used in this Privacy Policy have the same meaning as in our Terms and Conditions.
// Our Terms (“Terms”) govern all use of our Services and constitute your agreement with us, including the Privacy Policy (“Agreement”)."""),
//     DataModelClass(title: "2. definition", description: """Service means the dbid.gov.bd website operated by DBID.
// Personal information means information about a living person who can be identified from that information (or that information and other information we possess or are likely to come into our possession).
// Usage Data is automatically collected data either through use of the Service or generated from the Service infrastructure itself (for example, the duration of a page view).
// Cookies are small files stored on your device (computer or mobile device).
// Data controller means a natural or legal person who (alone or jointly or together with other persons) determines the purposes for which and the manner in which any personal data is, or is, processed. For the purposes of this Privacy Policy, we are the data controller of your data.
// Data processor (or service provider) means any natural or legal person who processes data on behalf of the data controller. We may use the services of various service providers to process your data more efficiently.
// Data subject is any living person who is the subject of personal data.
// Users are individuals using our Services. User corresponds to the data subject, who is the subject of personal data."""),
//     DataModelClass(title: "3. Collection and Use of Information", description: """We collect various types of information for various purposes to provide and improve our services to you.
// """),
//     DataModelClass(title: "4. Type of Data Collected", description: """Personal Information
// When using our Services, we may ask you to provide certain personally identifiable information that can be used to contact or identify you ("Personal Data"). Personally, identifiable information may include, but is not limited to:
// 0.1 Email address
// 0.2. First Name and Last Name
// 0.3. Phone number
// 0.4. Address, Country, State, Province, Zip/Postal Code, City
// 0.5 Cookies and Usage Data
// We may use your personal information to contact you with newsletters, marketing or promotional materials and other information that may be of interest to you. You may remove yourself from receiving any or all of these communications from us by following the unsubscribe link.
// Usage Data
// We may collect information that your browser sends whenever you visit our Services or when you use a device ("Usage Data").
// This usage data includes your computer's Internet Protocol address (such as IP address), browser type, browser version, the pages of our Service that you visit, the time and date of your visit, the time spent on those pages, unique device identifiers, and other diagnostic data when you are
// a If you access the Service through a device, this usage data may include information such as the type of device you use, your device's unique ID, your device's IP address, your device's operating system, the type of Internet browser you use, unique device information, etc. Identifier and Other Diagnostic Data
// Tracking Cookies Data
// We use cookies and similar tracking technologies to track activity on our Services and we retain certain information.
// A cookie is a file that contains a small amount of data that may include an anonymous unique identifier. Cookies are sent from a website to your browser and stored on your device. Other tracking technologies are also used such as beacons, tags and scripts to collect and track information and to improve and analyze our services.
// You can set your browser to reject all cookies or to indicate when cookies are being sent. However, if you do not accept cookies, you may not be able to use some parts of our Services.
// Examples of cookies we use:
// 0.1 Session cookies: We use session cookies to run our services.
// 0.2. Preference Cookies: We use Preference Cookies to remember your preferences and various settings.
// 0.3. Security Cookies: We use security cookies for security.
// 0.4. Advertising Cookies: Advertising cookies are used to serve you with advertisements that may be relevant to you and your interests.
// Other Data
// When using our services, we may also collect the following information: gender, age, date of birth, place of birth, passport details, citizenship, registration at place of residence and physical address, telephone number (work, mobile), document details, education, qualification, Professional training, employment contracts, NDA agreements, bonus and compensation information, marital status, family members, social security (or other taxpayer identification) numbers, office locations, and other data."""),
//     DataModelClass(title: "5. Use of data", description: """dbid uses collected information for a variety of purposes:
// 0.1 to provide and maintain our Services;
// 0.2. to notify you about changes to our services;
// 0.3. When you allow us to participate in interactive features of the Service;
// 0.4. provide customer support;
// 0.5 Collecting analysis or valuable information so that we can improve our services;
// 0.6. to monitor the use of our Services;
// 0.7. detect, prevent and resolve technical problems;
// 0.8. to fulfill any other purpose that you provide;
// 0.9. To carry out our duties and enforce our rights arising from any contract between you and us, including billing and collection;
// 0.10. to provide you with notifications about your account and/or subscription, including expiration and renewal notices, e-mail instructions, etc.;
// 0.11. to provide you with news, special offers and general information about other products, services and events we provide that you have already purchased or inquired about, unless you have opted out of receiving such information;
// 0.12. In other ways we may describe when you provide information;
// 0.13. For any other purpose with your consent."""),
//     DataModelClass(title: "6. Data retention", description: """We will retain your personal information for as long as necessary for the purposes set out in this Privacy Policy. We will retain and use your personal data to the extent necessary to comply with our legal obligations (for example, if we are required to retain your data to comply with applicable laws), to resolve disputes, and to enforce our legal agreements and policies.
// We will also retain usage data for internal analytics purposes. Usage data is typically retained for a short period of time, the data is used to strengthen security or improve the functionality of our services, or we are legally required to retain this data for a longer period of time."""),
//     DataModelClass(title: "7. Data transfer", description: """Your information, including personal information, may be transferred to and maintained on computers located outside your state, province, country or other governmental jurisdiction where data protection laws may differ from those in your jurisdiction.
// If you are located outside of Bangladesh and wish to provide information to us, please note that we transfer information, including personal information, to Bangladesh and process it there.
// Your consent to this Privacy Policy and your submission of such information constitutes your agreement to that transfer.
// DBID will take all steps reasonably necessary to ensure your data is secure and in accordance with this Privacy Policy, and your personal data will not be transferred to any organization or country unless adequate controls are in place, including security. Your data and other personal information"""),
//     DataModelClass(title: "8. Disclosure of information", description: """e may disclose personal information collected, or you provide:
// 0.1 Disclosure to law enforcement.
// In certain circumstances, we may be required to disclose personal information by law or in response to legitimate requests from government authorities.
// 0.2. In business transactions.
// If we or our affiliates are involved in a merger, acquisition or asset sale, your personal data may be transferred.
// 0.3. In other cases. We may also disclose your information:
// 0.3.1. to our subsidiaries and affiliates;
// 0.3.2. to contractors, service providers and other third parties we use to support our business;
// 0.3.3. to fulfill the purpose for which you provided it;
// 0.3.4. Intend to include your company logo on our website;
// 0.3.5. For any other purpose disclosed by us when you provide information;
// 0.3.6. with your consent in any other case;
// 0.3.7. If we believe disclosure is necessary or appropriate to protect the rights, property or safety of the Company, our customers or others."""),
//     DataModelClass(title: "9. Data security", description: """The security of your data is important to us but remember that no method of transmission over the Internet or method of electronic storage is 100% secure. Although we try to use commercially acceptable means to protect your personal information, we cannot guarantee its complete security."""),
//     DataModelClass(title: "10. Your data protection rights under the General Data Protection Regulation (GDPR)", description: """If you are a resident of the European Union (EU) and the European Economic Area (EEA), you have certain data protection rights covered by the GDPR.
// We aim to take reasonable steps to allow you to correct, amend, delete or restrict your personal data.
// If you want to know what personal information we hold about you and if you want to remove it from our system, please e-mail us at dbid.gov.bd.
// In certain circumstances, you have the following data protection rights:
// 0.1. the right to access, update or delete information held by you;
// 0.2. Right of rectification. You have the right to correct your information if your information is incorrect or incomplete;
// 0.3. Right to object. You have the right to object to our processing of your personal data;
// 0.4. Right of limitation. You have the right to request that we restrict the processing of your personal data;
// 0.5. Right to data portability. You have the right to be provided with a copy of your personal information in a structured, machine-readable and commonly used format;
// 0.6. Right to withdraw consent. You also have the right to withdraw your consent at any time we rely on your consent to process your personal information;
// Please note that we will ask you to verify your identity before responding to such requests. Please note, we cannot provide services without certain required data.
// You have the right to complain to a data protection authority about the collection and use of your personal data. For more information, please contact your local data protection authority in the European Economic Area (EEA)."""),
//     DataModelClass(title: "11. Your data protection rights under the California Privacy Protection Act (CALOPPA).", description: """CalOPPA is the first state law in the country to require commercial websites and online services to post privacy policies. By law beyond California, a person or company in the United States (and potentially the world) that operates websites that collect personally identifiable information from California consumers is required to post a clear privacy policy on its website detailing exactly what information is collected and what it does. with whom it is being shared, and to comply with this policy.
// In accordance with CalOPPA we agree to the following:
// 0.1. Users may visit our site anonymously;
// 0.2. The link to our privacy policy includes the word "Privacy" and can be easily found on the home page of our website;
// 0.3. Users will be notified of privacy policy changes on our privacy policy page;
// 0.5. Users can change their personal information by e-mailing us at dbid.gov.bd.
// Our Policy About "Do Not Track" Signals:
// We do not honor signals and do not track, set cookies, or use advertising when a browser mode is active. Do Not Track is a preference that you can set in your web browser to tell websites that you do not want to be tracked.
// You can enable or disable Do Not Track by going to your web browser's preferences or settings page."""),
//     DataModelClass(title: "12. Your data protection rights under the California Consumer Privacy Act (CCPA).", description: """If you are a California resident, you have the right to know what information we collect about you, ask to have your data deleted and not to sell (share) it. To exercise your data protection rights, you can make certain requests and ask us:
// 0.1. We have no personal information about you. If you make this request, we will get back to you:
// 0.0.1. Categories of Personal Information We Collect About You
// 0.0.2. Sources from which we collect your personal information.
// 0.0.3. Business or commercial purposes for collecting or selling your personal information.
// 0.0.4. Categories of third parties with whom we share personal information.
// 0.0.5. Certain pieces of personal information we collect about you.
// 0.0.6. List of categories of personal information that we have sold, along with the categories of any other organizations to which we have sold it. If we do not sell your personal information, we will disclose that information to you.
// 0.0.7. A list of categories of personal information that we disclose for a business purpose, along with any other categories of companies with which we share it.
// Please note, you have the right to ask us to provide this information up to two times in a twelve month period. When you make this request, the information provided may be limited to personal information collected about you in the previous 12 months.
// 0.2. To delete your personal information. If you make this request, we will delete the personal information we have about you from your records up to the date of your request and instruct any service providers to do the same. In some cases, the information may be deleted by de-identification. If you decide to delete your personal information, you may not be able to use certain functions that require your personal information.
// 0.3. To stop selling your personal information. We do not sell or rent your personal information to any third party for any purpose. We do not sell your personal information for financial consideration. However, in some circumstances, the transfer of personal information to a third party or within our family of companies without financial consideration may be considered a "sale" under California law. You are the sole owner of your personal data and can request disclosure or deletion at any time.
// If you submit a request to stop selling your personal information, we will stop such transfers.
// Please note that if you ask us to delete or stop selling your data, it may affect your experience with us and you may not be able to participate in certain programs or membership services that require the use of your personal information. But under no circumstances will we discriminate against you for exercising your rights.
// To exercise your California data protection rights described above, please send your request(s) via e-mail to: dbid.gov.bd.
// Your data protection rights described above are covered by the CCPA, short for the California Consumer Privacy Act. To learn more, visit the official California Law Information website. The CCPA took effect on 01/01/2020."""),
//     DataModelClass(title: "13. Service provider", description: """We may employ third-party companies and individuals to assist us in our Services ("Service Providers"), provide Services on our behalf, perform Service-related services, or analyze how our Services are used.
// These third parties may access your personal information to perform these tasks on our behalf and are not obligated to disclose or use it for any other purpose."""),
//     DataModelClass(title: "14. Analysis", description: """We may use third-party service providers to monitor and analyze the use of our Services."""),
//     DataModelClass(title: "15. CI/CD tools", description: """We may use third party service providers to automate the development process of our Services."""),
//     DataModelClass(title: "16. Behavioral remarketing", description: """We may use remarketing services to advertise on third-party websites after you visit our Services. We and our third-party vendors use cookies to inform, optimize and serve ads based on your past visits to our Services."""),
//     DataModelClass(title: "17. Links to other sites", description: """Our Service may contain links to other sites that are not operated by us. If you click on a third-party link, you will be directed to that third-party site. We strongly recommend that you review each site's privacy policy.
// We have no control over and are not responsible for the content, privacy policies or practices of any third party sites or services.
// For example, the outlined privacy policy was created using PolicyMaker.io, a free tool that helps create high-quality legal documents. PolicyMaker's Privacy Policy Generator is an easy-to-use tool for creating privacy policies for blogs, websites, e-commerce stores or mobile apps."""),
//     DataModelClass(title: "18. Children's privacy", description: """Our Services are not intended for use by children under the age of 18 ("children" or "children").
// We do not collect personally identifiable information from children under the age of 18. If you become aware that a child has provided us with personal information, please contact us. If we become aware that we have collected personal information from children without verifying parental consent, we take steps to remove that information from our servers."""),
//     DataModelClass(title: "19. Changes to this Privacy Policy", description: """We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page.
// We will notify you by email and/or a prominent notice on our Services before the change becomes effective and update the "Effective Date" at the top of our Privacy Policy.
// You are advised to periodically review this Privacy Policy for any changes. Changes to this Privacy Policy are effective when posted on this page."""),
//     DataModelClass(title: "20. Contact us", description: """If you have any questions about this Privacy Policy, please contact us via e-mail: support@dbid.gov.bd ."""),
//
//   ].obs;

  var expandedIndex= "-1".obs;

  Rx<int> index = 0.obs;

  setIndex(int ind){
    index.value = ind;
  }
  Rx<EnglishOrBangla> englishOrBangla = EnglishOrBangla.bangla.obs;

  setEnglishOrBangla(EnglishOrBangla eob){
    englishOrBangla.value = eob;
  }

  List<List<DataModelClass>> allDataModelListBangla = [
    privacyPolicyListBangla,
    termsOfUseListBangla,
    faqListBangla,
    securityListBangla,
  ];
  List<List<DataModelClass>> allDataModelListEnglish = [
    privacyPolicyListEnglish,
    termsOfUseListEnglish,
    faqListEnglish,
    securityListEnglish,
  ];


  List<DataModelClass> getBanglaOrEnglish( EnglishOrBangla englishOrBangla){
    if(index.value == 0){
      if(englishOrBangla == EnglishOrBangla.english){
        return allDataModelListEnglish[index.value];
      }else{
        return allDataModelListBangla[index.value];
      }
    }else if(index.value == 1){
      if(englishOrBangla == EnglishOrBangla.english){
        return allDataModelListEnglish[index.value];
      }else{
        return allDataModelListBangla[index.value];
      }
    }else if(index.value == 2){
      if(englishOrBangla == EnglishOrBangla.english){
        return allDataModelListEnglish[index.value];
      }else{
        return allDataModelListBangla[index.value];
      }
    }else if(index.value == 3){
      if(englishOrBangla == EnglishOrBangla.english){
        return allDataModelListEnglish[index.value];
      }else{
        return allDataModelListBangla[index.value];
      }
    }else{
      return <DataModelClass>[];
    }
  }

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




