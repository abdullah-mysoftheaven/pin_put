import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:pin_put/scroll_issue/scroll_issue_controller.dart';
import 'package:pinput/pinput.dart';

import 'collaps_page_controller.dart';
import 'dbid_data.dart';




class CollapsePage extends StatefulWidget {

  @override
  State<CollapsePage> createState() => _CollapsePageState();
}

class _CollapsePageState extends State<CollapsePage> {
  final collapsePageController = Get.put(CollapsePageController());

  var width;

  var height;





  @override
  Widget build(BuildContext context) {

    return Scaffold(
       resizeToAvoidBottomInset: true,
        appBar: AppBar(
            title: const Text("Collapse Data"),
            backgroundColor: Colors.redAccent,
          actions: [
            ElevatedButton(onPressed: (){
             if( collapsePageController.englishOrBangla.value == EnglishOrBangla.bangla){
               collapsePageController.setEnglishOrBangla(EnglishOrBangla.english);

             }else{
               collapsePageController.setEnglishOrBangla(EnglishOrBangla.bangla);

             }
            }, child: const Text("Translate"))
          ],
        ),
      body:Obx(() =>  Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: (){

                  collapsePageController.setIndex(0);

              }, child: const Text("Privacy Policy")),
              ElevatedButton(onPressed: (){
                collapsePageController.setIndex(1);
              }, child: const Text("Terms of Use")),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: (){
                collapsePageController.setIndex(2);
              }, child: const Text("FAQ")),
              ElevatedButton(onPressed: (){
                collapsePageController.setIndex(3);
              }, child: const Text("Security")),
            ],
          ),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 20),
                itemCount: collapsePageController.getBanglaOrEnglish( collapsePageController.englishOrBangla.value).length,
                itemBuilder: (BuildContext context, int index) {
                  return Obx(() => listItemDesign(itemData: collapsePageController.getBanglaOrEnglish(collapsePageController.englishOrBangla.value)[index],
                    index: index, selectedItemIndex: collapsePageController.expandedIndex.value,));
                }),
          ),
        ],
      ))

    );

  }

  Widget listItemDesign({required DataModelClass itemData, required int index,required String selectedItemIndex}){
    return  Container(
      decoration: const BoxDecoration(
        color:   Color(0xFFE1E8EC),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(6.0), // Adjust the radius for the top-left corner
          bottomRight: Radius.circular(6.0), // Adjust the radius for the top-left corner
          bottomLeft: Radius.circular(6.0), // Adjust the radius for the top-left corner
          topRight: Radius.circular(6.0), // Adjust the radius for the top-left corner
        ),
      ),
      margin:const EdgeInsets.only(left:10, top: 10, right: 10, bottom: 0   ),
      child: InkWell(
        onTap: (){
          if(selectedItemIndex == index.toString()){
            collapsePageController.expandedIndex("-1");
          }else{
            collapsePageController.expandedIndex(index.toString());
          }

        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [

            //for title
            Row(
              children: [
                Expanded(child: Container(

                  margin:const EdgeInsets.only(left:0, top: 00, right: 0, bottom: 0  ),
                  padding:const EdgeInsets.only(left:0, top: 10, right: 0, bottom: 10  ),
                  // padding:const EdgeInsets.only(left:10, top: 10, right: 10, bottom: 10),
                  child: Row(
                    children: [
                      SizedBox(width: 10,),

                      Expanded(child: Text(
                        itemData.title.toString(),
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        maxLines: 2,
                        style: TextStyle(
                            color:Colors.black,
                            fontSize: 15,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold),
                      )),

                      SizedBox(width: 10,),

                      if(selectedItemIndex == index.toString())...{
                        Container(
                        //  margin: EdgeInsets.only(bottom: 10),
                         child: Icon(
                            Icons.minimize_outlined,

                            color: Colors.black,
                            size: 29.0,
                          ),
                        )

                      }
                      else...{
                        Container(

                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 29.0,
                          ),
                        )

                      },


                      const SizedBox(width: 10,)
                    ],
                  ),

                ),),

              ],
            ),

            if(selectedItemIndex==index.toString())...{

              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    // color:   Color(0xFFE1E8EC),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.25), // Shadow color
                        spreadRadius: 1, // Spread radius
                        blurRadius: 1, // Blur radius
                        offset: const Offset(0, 1), // Offset
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(6.0), // Adjust the radius for the top-left corner
                      bottomRight: Radius.circular(6.0), // Adjust the radius for the top-left corner
                    ),
                  ),
                  padding: const EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 20),

                  child: Text(
                    itemData.description.toString(),
                    textAlign: TextAlign.left,

                    style: const TextStyle(
                        color:Colors.black,
                        fontSize: 14,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              )

            }


          ],
        ),
      ),
    );
  }
}






enum EnglishOrBangla{english, bangla}



