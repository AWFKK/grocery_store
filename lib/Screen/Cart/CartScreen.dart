import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:n_store/Helper/constants.dart';
import 'package:n_store/ModelClasses/ModelCart.dart';
import 'package:n_store/common_widgets/app_button.dart';
import 'package:n_store/styles/colors.dart';



class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            icon: Icon(
              Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
              color: AppColors.darkGrey,
            ),
            onPressed: () async {
              Navigator.of(context).pop();
            }),
        title: Column(
          children: [
            Text(
              "Your Cart",
              style: TextStyle(color: AppColors.themeColor),
            ),
            Text(
              "${demoCarts.length} items",
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
      body: Body(),
      bottomNavigationBar: checkOutCart(),
    );
  }

  //Main Body
  Widget Body(){
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        itemCount: demoCarts.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(demoCarts[index].product.id.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                demoCarts.removeAt(index);
              });
            },
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: AppColors.textInPutBG,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Spacer(),
                  SvgPicture.asset("assets/icons/Trash.svg"),
                ],
              ),
            ),
            child: cartItem(demoCarts[index]),
          ),
        ),
      ),
    );
  }


  //Cart Items Widget
  cartItem(Cart demoCart){
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.textInPutBG,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(demoCart.product.image![0]),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              demoCart.product.title.toString(),
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\$${demoCart.product.price}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: AppColors.themeColor),
                children: [
                  TextSpan(
                      text: " x${demoCart.numOfItem}",
                      style: TextStyle(color: Colors.grey)
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }


  //Cart Checkout Button And Cuppon
  checkOutCart(){
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 30,
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg", color: AppColors.themeColor,),
                ),
                Spacer(),
                InkWell(
                  onTap: (){
                    print("ADD Dialkog Box For voucher");
                  },
                    child: Text("Add voucher code", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),)),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kTextColor,
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total:\n",style: TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                        text: "\$337.15",
                        style: TextStyle(fontSize: 16, color: AppColors.themeColor, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: AppButton(
                    label: "Check Out",
                    roundness: 10,
                    fontWeight: FontWeight.bold,
                    onPressed: (){
                      print("Check Out");
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


}
