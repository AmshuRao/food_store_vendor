// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, empty_constructor_bodies, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:food_store/utils/constants/colors.dart';
import 'package:food_store/utils/constants/image_strings.dart';

    class HomeVendor extends StatelessWidget {
      const HomeVendor({super.key});

      @override
      Widget build(BuildContext context) {
        return  Scaffold(
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0,),
                  Center(child:Text("Vidyarthi Khaana",
                  style:TextStyle(
                    color: AppColors.white
                      ) ,
                    )
                  ),
                  SizedBox(height: 20.0,),
                  Center(child:Text("Let's Start working !!!",
                  style:TextStyle(
                    color: AppColors.textSecondary
                      ) ,
                    )
                  ),
                  SizedBox(height: 15.0,),
                  Image(image:AssetImage(AppImages.vegFriedMaggi),height: 300.0,),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0,horizontal: 5.0),
                    child: Column(
                      
                    ),
                  )
                  

                ],
              ),
            ),
          );
      }
    }