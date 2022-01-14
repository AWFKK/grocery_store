import 'package:flutter/material.dart';
import 'package:n_store/Helper/RequestManager.dart';
import 'package:n_store/Screen/ForgotPasswprd/Forgotpassword.dart';
import 'package:n_store/Screen/SignUp/SignUp.dart';
import 'package:n_store/Screen/TabBarScreens/TabBar/TabBarScreen.dart';
import 'package:n_store/common_widgets/app_text.dart';
import 'package:n_store/styles/colors.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _emailController = TextEditingController();
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

              const AppText(
                text: "Oh hi,Sign in here",
                fontSize: 28,
                fontWeight: FontWeight.bold,
                //color: AppColors.NewColor,
              ),

              const SizedBox(height: 10,),


              SizedBox(
                width: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width/3,
                child: const AppText(
                  text: "Create an account so you can order your favorite food even faster",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                ),
              ),

              SizedBox(height: 30,),

              //User Name
              Container(
                height: 45,
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  color: AppColors.textInPutBG,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: _emailController,
                  style: const TextStyle(
                      fontSize: 18.0,
                      height: 1.0,
                      fontWeight: FontWeight.w400
                  ),
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email",
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
                      fontWeight: FontWeight.w400,color: AppColors.themeColor
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
                        color: AppColors.themeColor,
                      ),
                    ),
                  ),
                ),
              ),

              //Reset Your Password Forgot your Password?
              Container(
                padding: EdgeInsets.all(8.0),
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPassword()),
                    );
                  },
                  child: AppText(
                    text: "Forgot Password?",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.right,
                    color: AppColors.textColor,
                  ),
                ),
              ),

              SizedBox(height: 20,),

              //Login Button
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TabBarScreen()),
                  );
                  //_login();
                },
                child: Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.themeColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
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

              SizedBox(height: 40,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    text: "Dont't have an account? ",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.justify,
                    color: AppColors.textColor,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                    child: AppText(
                      text: "Sign Up",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.justify,
                      color: AppColors.themeColor,
                    ),
                  ),
                ],
              )


            ],
          ),
        ),
      ),
    );
  }

  //Login
  _login() async {

    var param = {
      "email": "abdulwahabfaiz@gmail.com",
      "password": "123456",
    };

    var manager = Requestmanager();
    var data = await manager.login(param);
    print("User data: ===== >>>>>>${data!.message}");
    if(data.error == true){
      print("Success");
    }else{
      print("False");
    }

  }

}
