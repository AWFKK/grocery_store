import 'package:flutter/material.dart';
import 'package:n_store/Screen/Login/Login.dart';
import 'package:n_store/common_widgets/app_text.dart';
import 'package:n_store/styles/colors.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _userNameController = TextEditingController();
  final _emailController    = TextEditingController();
  final _phoneController    = TextEditingController();
  final _passwordController = TextEditingController();


  //Password Eye Value
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

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
                text: "Sign Up",
                fontSize: 28,
                fontWeight: FontWeight.bold,
                //color: AppColors.NewColor,
              ),

              SizedBox(height: 10,),


              Container(
                width: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width/3,
                child: AppText(
                  text: "Create an account so you can order your favorite food even faster",
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
                  controller: _userNameController,
                  style: TextStyle(
                      fontSize: 18.0,
                      height: 1.0,
                      fontWeight: FontWeight.w400
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Faiz",
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

              //Email
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

              //Phone
              new Container(
                height: 45,
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  color: AppColors.textInPutBG,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: _phoneController,
                  style: TextStyle(
                      fontSize: 18.0,
                      height: 1.0,
                      fontWeight: FontWeight.w400
                  ),
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "+923313641933",
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

              //Password
              Container(
                height: 45,
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  color: AppColors.textInPutBG,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  style: TextStyle(
                      fontSize: 18.0,
                      height: 1.0,
                      fontWeight: FontWeight.w400,color: AppColors.NewColor
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Password",
                    hintStyle: TextStyle(
                        fontSize: 16.0,
                        height: 1.0,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w400
                    ),

                    suffixIcon: InkWell(
                      onTap: _toggle,
                      child: Icon(
                        _obscureText
                            ? Icons.visibility_off
                            : Icons.remove_red_eye,
                        size: 25.0,
                        color: AppColors.NewColor,
                      ),
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
                      text: "Continue",
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.justify,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 50,),

              //Trems And Condition Text
              Center(
                child: AppText(
                  text: "By signing up, you're agree to our",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  //Terms
                  InkWell(
                    onTap: (){
                      print("Terms of User");
                    },
                    child: AppText(
                      text: "Terms of User",
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.justify,
                      color: AppColors.textColor,
                    ),
                  ),

                  AppText(
                    text: " and ",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                    color: AppColors.textColor,
                  ),

                  //Privacy Policy
                  InkWell(
                    onTap: (){
                      print("Privacy Policy");
                    },
                    child: AppText(
                      text: "Privacy Policy",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.justify,
                      color: AppColors.textColor,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    text: "Already have an account? ",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.justify,
                    color: AppColors.textColor,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: AppText(
                      text: "Sign In",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.justify,
                      color: AppColors.NewColor,
                    ),
                  ),
                ],
              ),



            ],
          ),
        ),
      ),
    );
  }
}
