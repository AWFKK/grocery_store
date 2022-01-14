import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:n_store/common_widgets/app_text.dart';
import 'package:n_store/styles/colors.dart';



class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _setOrderList(),
      ),
    );
  }

  _setOrderList() {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return new InkWell(
            onTap: () async {
              print(index);
            },
            child:Column(
              children: [

                SizedBox(height: 5,),

                new Container(
                  // height: 150,
                    padding: new EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: new BoxDecoration(
                      color: AppColors.textInPutBG,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[

                        new Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          child: new Image.asset('assets/images/order.png'),
                        ),

                        SizedBox(
                          width: 5,
                        ),

                        //Order Id And Address And Other Details
                        new Expanded(
                          child: Container(
                            padding: new EdgeInsets.only(
                                left: 10, right: 10, top: 5, bottom: 5),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[


                                //Order Id
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    AppText(
                                      text: "Order ID # ${index}",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.themeColor,
                                    ),
                                    new Container(
                                      height: 26,
                                      decoration: BoxDecoration(
                                          color: AppColors.themeColor,
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.NewprimaryColor.withOpacity(0.1),
                                            spreadRadius: 2,
                                            blurRadius: 3,
                                            offset: Offset(0, 1), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: new Padding(
                                          padding: EdgeInsets.only(left: 10, right: 10),
                                            child:  AppText(
                                              text: "Delivered",
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w800,
                                              color: AppColors.NewprimaryColor,
                                            ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                Divider(
                                  color: Colors.black38
                                ),

                                // Name
                                Row(
                                  children: [
                                    AppText(
                                      text: "Name : ",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.themeColor,
                                    ),

                                    Expanded(
                                      child: AppText(
                                        text: "Abdul Wahab Faiz",
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w800,
                                        color: AppColors.themeColor,
                                      ),
                                    )
                                  ],
                                ),

                                SizedBox(height: 5,),

                                new Row(
                                  children: <Widget>[
                                    AppText(
                                      text: "Phone : ",
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.themeColor,
                                    ),

                                    AppText(
                                      text: "+923313641933",
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.themeColor,
                                    ),
                                  ],
                                ),

                                //Delivery On
                                Row(
                                  children: <Widget>[
                                    AppText(
                                      text: "Delivery on : ",
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.themeColor,
                                    ),
                                    AppText(
                                      text: "15/02/2022 ",
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.themeColor,
                                    ),
                                  ],
                                ),

                                Divider(
                                  color: Colors.black38,
                                ),

                               Row(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: <Widget>[
                                   //Complete Address
                                   AppText(
                                     text: "Complete Address : ",
                                     fontSize: 12.0,
                                     fontWeight: FontWeight.w500,
                                   ),

                                   Expanded(
                                     child: AppText(
                                       text: "Laraib Garden, Gulshan Iqbal, Karachi  ",
                                       fontSize: 12.0,
                                       fontWeight: FontWeight.w500,
                                     ),
                                   ),
                                 ],
                               )


                              ],
                            ),
                          ),
                        ),

                        Icon(Icons.arrow_forward_ios, color: AppColors.NewprimaryColor, size: 13),

                      ],
                    )
                ),

                SizedBox(height: 5,),
              ],
            ),


          );
        });
  }
}
