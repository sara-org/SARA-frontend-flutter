import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/colors.dart';
import '../components/text.dart';
import '../cubits/User/cubit.dart';
import '../cubits/User/state.dart';

class adoption_user extends StatefulWidget {


  @override
  State<adoption_user> createState() => _adoption_userState();
}

class _adoption_userState extends State<adoption_user> {

  void initState() {
    super.initState();
    UserCubit.get(context).adoptionuser();

  }



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit,UserSates>(
      listener: ( context, state) {  },
      builder: (context, state) {

        return Scaffold(
          appBar: AppBar(title: text(text1:"Your adoptions",color: ColorApp.color2,
            size: 22,),
            leading: IconButton(onPressed: () {
              Navigator.pop(
                  context);
            }, icon: Icon(Icons.arrow_back_ios),),),
          body:
          (    UserCubit.get(context)
              .adoptionmodel!=null&& state is adoptionSuccessState)?
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:

              Column(
                children: [
                  Expanded(
                      child: GridView.count(
                        crossAxisCount: 1,
                        childAspectRatio: 1.5,
                        children: List.generate(
                          UserCubit.get(context)
                              .adoptionmodel!
                              .data
                              .length,
                              (index) => builditem(
                                  UserCubit.get(context)
                                  .adoptionmodel!
                                  .data[index],
                              context,
                              index),
                        ),
                      )),
                ],
              ),


          )
        :Center(child: CircularProgressIndicator())

        );
      },);
  }

  Widget builditem(dynamic model, context, index) {
    return Container(
      height: 400,
      width: 520,
      child: Card(
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26.0),
        ),
        // shadowColor:Colors.black,
        surfaceTintColor: ColorApp.color2,

        borderOnForeground: false,

        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            decoration: BoxDecoration(
                color: ColorApp.colorback,
                borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: [
                Padding(
                  padding:
                  const EdgeInsets.only(top: 8.0, left: 10, right: 10),
                  child: Container(
                    constraints: BoxConstraints(
                      minWidth: 400,
                      minHeight: 180,
                    ),
                    child: model.animal!.photo != null
                        ? Image(
                      height: 180,
                      width: 400,
                      fit: BoxFit.fill,
                      image: MemoryImage(base64Decode(model!.animal!.photo)),
                    )
                        : Container(),
                    decoration: BoxDecoration(
                      color: ColorApp.color3,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text(
                        text1: "Name animal  : ${model!.animal.name}",
                        size: 20,
                        fontWeight: FontWeight.w200,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      text(
                        text1: " the Type : ${model.animal.type}",
                        size: 16,
                        fontWeight: FontWeight.normal,
                      ),
                      text(
                        text1: " the Date : ${model.updatedAt.year}-${model.updatedAt.month}-${model.updatedAt.day}",
                        size: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}