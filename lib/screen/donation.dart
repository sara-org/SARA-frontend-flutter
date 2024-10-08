import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sara_front/components/textfromfilde.dart';
import 'package:sara_front/cubits/User/cubit.dart';
import 'package:sara_front/cubits/User/state.dart';
import 'package:sara_front/screen/drawer.dart';
import 'package:sara_front/screen/layout.dart';

import '../components/colors.dart';
import '../components/defaultButton.dart';
import '../components/text.dart';
import '../components/textButton.dart';

class donation extends StatelessWidget {
  var amountcontroller=TextEditingController();
  var amountc_controller=TextEditingController();
  var formkay =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit,UserSates>(
      listener: (BuildContext context, UserSates state) {
        if (state is DonationSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Row(
              children: [
                text(text1: ' Donation successfully,'.tr(),),
                Spacer(), // Add a spacer to push the icon to the end
                Icon(Icons.check, color: Colors.green),
              ],
            ),
            behavior: SnackBarBehavior.floating,
            // showCloseIcon: true,
            // closeIconColor: Colors.black,
            backgroundColor: ColorApp.colorback,
          ));
          amountcontroller.clear();
        }

        if (state is DonationErrorState) {
         mesErorrDialog(context, state.mes);

          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //   content: Text(
          //     'Donation failed,',
          //     style: TextStyle(
          //       color: ColorApp.color2,
          //       fontFamily: 'Inter',
          //       fontSize: 15,
          //       fontWeight: FontWeight.w400,
          //     ),
          //   ),
          //   behavior: SnackBarBehavior.floating,
          //   showCloseIcon: true,
          //   closeIconColor: ColorApp.color2,
          //   backgroundColor: ColorApp.colorback,
          // ));
        }



      },
      builder: (BuildContext context, UserSates state) {
        return  Scaffold(
          appBar: AppBar(title: text(
            themestyle: Theme.of(context).textTheme.headline5,
            text1:"Donation".tr(),size: 22,
            color: ColorApp.color2,
          ),
            leading: IconButton(onPressed: () {
              Navigator.pop(
                context);
            }, icon: Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20),
              child: Icon(Icons.arrow_back_ios),
            ),),),
          body: Form(
            key: formkay,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 40.0,right: 40.0,bottom: 40.0),
                      child: text(text1:"You can make a difference in the lives of animals by donating to the center here. By doing so, "
                          "you will help support our work to uplift animals and improve their lives, "
                          "no matter how small the donation".tr(),size: 15,themestyle: Theme.of(context).textTheme.headline6,),
                    ),
                      
                      
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0,right: 18.0,bottom: 25.0),
                      child: textfromfilde(hint:'enter the amount '.tr(),
                        type: TextInputType.number,
                        controller:amountcontroller ,
                        color: Color.fromARGB(255, 219, 229, 244),
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return "please enter the amount".tr();
                          }
                          if (!RegExp(r'^\d+$').hasMatch(value)) {
                            return 'Invalid input. Please enter a valid number.'.tr();
                          }
                          return null;
                        },

                      ),
                    ),
                      
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Center(
                        child: ConditionalBuilder(
                          condition:state is! DonationLoadingState,
                          fallback: (context)=>Center(child: CircularProgressIndicator(),),
                          builder: (context)=>  defaultButton(
                            text: "Done".tr(),
                            w: 130,
                            h: 45,
                            r:10 ,
                            s: 20,
                            color:ColorApp.color2,
                            onTap: (){
                      
                              if (formkay.currentState!.validate())
                              {
                                  UserCubit.get(context).post_donation(balance: int.parse(amountcontroller.text));
                              }
                      
                            },
                      
                      
                            // Color.fromRGBO(255, 239, 193,1),
                          ),
                      
                        ),
                      ),
                    ),
                      
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }


  mesErorrDialog(BuildContext context,String mes ) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: '',
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Container();
      },
      transitionBuilder: (context, a1, a2, child) {
        return ScaleTransition(
          scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
          child: AlertDialog(
            backgroundColor: ColorApp.colorback,
            content: text( text1: '${mes}',),
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none),
            actions: [
              Center(
                child: textButton(
                    text: 'OK'.tr(),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>Layout()),);
                    }),
              ),

            ],
          ),
        );
      },
    );
  }
}
