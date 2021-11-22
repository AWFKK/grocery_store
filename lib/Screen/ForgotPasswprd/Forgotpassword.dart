import 'dart:io';

import 'package:flutter/material.dart';
import 'package:n_store/common_widgets/app_text.dart';
import 'package:n_store/styles/colors.dart';



class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: MediaQuery.of(context).size.height/5,),

              AppText(
                text: "Reset password",
                fontSize: 28,
                fontWeight: FontWeight.bold,
                //color: AppColors.NewColor,
              ),

              SizedBox(height: 10,),


              Container(
                width: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width/3,
                child: AppText(
                  text: "Enter the email associated with your account and we'll send an email with instructions to reset your password",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                ),
              ),

              SizedBox(height: 30,),

              //User Name
              new Container(
                height: 45,
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  color: AppColors.textInPutBG,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: _emailController,
                  style: TextStyle(
                      fontSize: 18.0,
                      height: 1.0,
                      fontWeight: FontWeight.w400
                  ),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "faiz@gmail.com",
                    hintStyle: TextStyle(
                        fontSize: 16.0,
                        height: 1.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),

              //Login Button
              InkWell(
                onTap: (){

                },
                child: Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.NewColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: AppText(
                      text: "Send Email",
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.justify,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height/3,),

              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: CircleAvatar(
                    radius: 21.0,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
                      color: AppColors.darkGrey,
                      size: 25,
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
