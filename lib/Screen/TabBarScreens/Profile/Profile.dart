import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:n_store/common_widgets/app_text.dart';
import 'package:n_store/styles/colors.dart';



class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:  Text("Profile", style:TextStyle(color: AppColors.darkGrey)),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/cart_icon.svg",
              // By default our  icon color is white
              color: AppColors.themeColor,
            ),
            onPressed: () {
              print('Cart Tab Bar');
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        alignment: Alignment.center,
        child: Stack(
          children: [
            Column(
              children: [

                SizedBox(height: 20,),

                //Image
                Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: AppColors.textInPutBG,
                    image: DecorationImage(
                      image: NetworkImage('https://i.pinimg.com/originals/77/7b/72/777b72645db3b611d7310a32a3cc895c.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all( Radius.circular(75.0)),
                    border: Border.all(
                      color: AppColors.themeColor,
                      width: 4.0,
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                //Name
                AppText(
                  text: "Abdul Wahab Faiz",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),

                SizedBox(
                  height: 10,
                ),

                Divider(
                    thickness: 2,
                    color: Colors.black38
                ),

                //Setting
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                  child: Row(
                    children: [
                      Icon(Icons.settings, color: AppColors.NewprimaryColor, size: 20),

                      SizedBox(width: 20,),

                      AppText(
                        text: "Settings",
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios, color: AppColors.NewprimaryColor, size: 13),
                    ],
                  ),
                ),

                Divider(
                    thickness: 1,
                    color: Colors.black38
                ),

                //Language
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                  child: Row(
                    children: [
                      Icon(Icons.language, color: AppColors.NewprimaryColor, size: 20),

                      SizedBox(width: 20,),

                      AppText(
                        text: "Languages",
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios, color: AppColors.NewprimaryColor, size: 13),
                    ],
                  ),
                ),

                Divider(
                    thickness: 1,
                    color: Colors.black38
                ),

                //Help And Support
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                  child: Row(
                    children: [
                      Icon(Icons.help_outline, color: AppColors.NewprimaryColor, size: 20),

                      SizedBox(width: 20,),

                      AppText(
                        text: "Help & Support",
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios, color: AppColors.NewprimaryColor, size: 13),
                    ],
                  ),
                ),

                Divider(
                    thickness: 1,
                    color: Colors.black38
                ),

                //FAQ
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                  child: Row(
                    children: [
                      Icon(Icons.message, color: AppColors.NewprimaryColor, size: 20),

                      SizedBox(width: 20,),

                      AppText(
                        text: "FAQ",
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios, color: AppColors.NewprimaryColor, size: 13),
                    ],
                  ),
                ),

                Divider(
                    thickness: 1,
                    color: Colors.black38
                ),

                //Log Out
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                  child: Row(
                    children: [
                      Icon(Icons.logout, color: AppColors.NewprimaryColor, size: 20),

                      SizedBox(width: 20,),

                      AppText(
                        text: "Log Out",
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios, color: AppColors.NewprimaryColor, size: 13),
                    ],
                  ),
                ),

                Divider(
                    thickness: 1,
                    color: Colors.black38
                ),

              ],
            ),
            Positioned(
              right: 0,
              child: Icon(Icons.edit, color: AppColors.NewprimaryColor, size: 20),
            )
          ],
        )
      ),
    );
  }
}
