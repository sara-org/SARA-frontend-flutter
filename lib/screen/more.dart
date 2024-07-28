import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sara_front/components/defaultButton.dart';
import 'package:sara_front/screen/feeding.dart';
import 'package:sara_front/screen/session.dart';
import 'package:sara_front/screen/vaccination.dart';
import '../components/colors.dart';
import '../components/text.dart';
import 'donation.dart';
import 'drawer.dart';

class more extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      // (title: Padding(
      //   padding: const EdgeInsets.only(left: 60.0,right: 60),
      //   child: text(text1: 'Task',color: ColorApp.color2,
      //     size: 25,),
      // ),backgroundColor:ColorApp.colorback,),
      backgroundColor: ColorApp.colorback,
      drawer: Drawer_Screen(),
      // appBar: AppBar(title: Center(child: text(text1: 'task',color: ColorApp.color2,
      //   size: 35,),heightFactor: 100,)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0,right: 15,top: 35,),
            child: text(text1: '',color: ColorApp.color2,
              size: 35,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0,right: 15,top: 150),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Card(
                //     elevation: 3.0,
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(20.0),
                //     ),
                //     surfaceTintColor: ColorApp.color2,
                //
                //     borderOnForeground: false,
                //     child: defaultButton(onTap: (){
                //
                //       Navigator.push(context, MaterialPageRoute(builder:(context)=> session()));},
                //       text: "Session",
                //       w:screenWidth.width,
                //       h: 50,s: 20,
                //       color: ColorApp.color3,textColor: ColorApp.color1,)),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap:(){ Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => session()),

                      );},
                      child: Card(
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          surfaceTintColor: ColorApp.color2,

                          borderOnForeground: false,
                          child:
                         Container(
                           width: 200,
                           height: 200,
                           decoration: BoxDecoration(
                               color: ColorApp.colorback,
                               borderRadius: BorderRadius.circular(24),),

                                        child:Column(
                                          children: [
                                            Container(
                                              width: 200,
                                              height: 170,
                                                decoration: BoxDecoration(
                                                    color: ColorApp.colorback,
                                                    // borderRadius: BorderRadius.circular(24),
                                                  image: DecorationImage(

                                                    image: AssetImage('assets/images/session.jpg',),
                                                    fit: BoxFit.cover),),child: SizedBox(),
                                            ),
                                            text(text1: 'session',size: 15,),
                                          ],
                                        )

                         )),
                    ),
                    SizedBox(width: 25,),
                    Card(
                        elevation: 3.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        surfaceTintColor: ColorApp.color2,

                        borderOnForeground: false,
                        child:
                        GestureDetector(
                          onTap:(){ Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => donation()),

                            //id:model.id,
                          );},
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: ColorApp.colorback,
                                  borderRadius: BorderRadius.circular(24),),

                                child:Column(
                                  children: [
                                    Container(
                                      width: 200,
                                      height: 170,
                                      decoration: BoxDecoration(
                                        color: ColorApp.colorback,
                                        borderRadius: BorderRadius.circular(24),
                                        image: DecorationImage(

                                            image: AssetImage('assets/images/donate.png',),
                                            fit: BoxFit.cover),),child: SizedBox(),
                                    ),
                                    text(text1: 'Donate'.tr(),size: 15,),
                                  ],
                                )

                            ),
                          ),
                        )),
                  ],
                )



              ],),
          ),
        ],
      ),

    );
  }
}
