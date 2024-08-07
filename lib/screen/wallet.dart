import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sara_front/components/text.dart';
import 'package:sara_front/components/textfromfilde.dart';
import 'package:sara_front/cubits/User/cubit.dart';
import 'package:sara_front/cubits/User/state.dart';

import '../components/colors.dart';

class Wallet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit,UserSates>(
      listener: (BuildContext context, UserSates state) {  },
      builder: (BuildContext context, UserSates state) {

        if(UserCubit.get(context).walletmodel !=null){
          return  Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top:8,right: 18),
            child: text(
            text1: 'Account Balance',
            color: ColorApp.color2,
            size: 22,
                    ),
          ),

          backgroundColor: ColorApp.colorback,
          leading: IconButton(onPressed: () {
          Navigator.pop(context);
          
        }, icon: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Icon(Icons.arrow_back_ios),
        ),),),
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center, // Add this line

              children: [
                text(text1: "You have the following amount in your account :"),
                // Container(
                //   child: textfromfilde(hint: UserCubit.get(context).walletmodel?.data.wallet.toString(),readonly: true,color: Colors.white,color1: Colors.black,),
                //
                // ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Card(
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    // shadowColor:Colors.black,
                    surfaceTintColor: ColorApp.color2,

                    borderOnForeground: false,
                    child: Container(
                      width: 400,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                      color: ColorApp.color
                      ),
                      child:Center(child: text(text1: UserCubit.get(context).walletmodel!.data.wallet.toString(),)),

                    ),
                  ),
                )

              ],),
          ),
        ),


      );}
        return
          Scaffold(
            appBar: AppBar(
              title: Padding(
                padding: const EdgeInsets.only(right: 18),
                child: text(
                  text1: 'Account Balance',
                  color: ColorApp.color2,
                  size: 22,
                ),
              ),

              backgroundColor: ColorApp.colorback, leading: IconButton(onPressed: () {
              Navigator.pop(context);

            }, icon: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Icon(Icons.arrow_back_ios),
            ),),),        body: Center(
        child: CircularProgressIndicator(),
        ),
          );
        },
    );
  }
}
