import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:n_store/Helper/constants.dart';
import 'package:n_store/ModelClasses/ModelProduct.dart';
import 'package:n_store/common_widgets/app_button.dart';
import 'package:n_store/styles/colors.dart';


class ProductDetail extends StatefulWidget {
  final Product product;

  const ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {

  int selectedImage = 0;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
              color: AppColors.productBG,
            ),
            onPressed: () async {
              Navigator.of(context).pop();
            }),
        title:  Text("${widget.product.title}", style:TextStyle(color: AppColors.darkGrey),textAlign: TextAlign.center,),

      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            //Product Main Image
            // And Other Images
            Column(
              children: [
                SizedBox(
                  width: 250,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Hero(
                      tag: widget.product.id.toString(),
                      child: Image.asset(widget.product.image![selectedImage]),
                    ),
                  ),
                ),
                // SizedBox(height: getProportionateScreenWidth(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(widget.product.image!.length,
                            (index) => buildSmallProductPreview(index)),
                  ],
                )
              ],
            ),

            Column(children: [
              //Name And Detail
              productNameNDetail(),

              //Counter And Reating
              counterAndReating(),

              addToCart(),
            ],)
          ],
        ),
      ),
    );
  }

  //Change Images
  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: AppColors.themeColor.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: Image.asset(widget.product.image![index]),
      ),
    );
  }

  //Product Name And Detail
  Widget productNameNDetail(){
    return Container(
      margin: EdgeInsets.only(top: 20, right: 5, left: 5),
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
            Radius.circular(20)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
            EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              widget.product.title.toString(),
              style: Theme.of(context).textTheme.headline6,
            ),
          ),

          //Liked Or DisLiked
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.all(15),
              width: 65,
              decoration: BoxDecoration(
                color:
                true ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: SvgPicture.asset(
                "assets/icons/Heart Icon_2.svg",
                color:
                true ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
                height: 15,
              ),
            ),
          ),

          //Description Text
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 65,
            ),
            child: Text(
              widget.product.description.toString(),
              maxLines: 3,
            ),
          ),

          //See More Detail
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Text(
                    "See More Detail",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: AppColors.themeColor),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: kPrimaryColor,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }


  //Select Reating
  // And
  // Increment and Decriment
  Widget counterAndReating() {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Row(
        children: [

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                const Text(
                  "4.8",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 5),
                SvgPicture.asset("assets/icons/Star Icon.svg"),
              ],
            ),
          ),

          Spacer(),
          InkWell(
            onTap: (){
              if(counter > 1)
              setState(() {
                counter--;
              });
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 6),
                    blurRadius: 10,
                    color: Color(0xFFB0B0B0).withOpacity(0.2),
                  ),
                ],
              ),
              child: Icon(Icons.remove,color: AppColors.themeColor,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(counter.toString(),style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
          ),
          InkWell(
            onTap: (){
              setState(() {
                counter++;
              });
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 6),
                    blurRadius: 10,
                    color: Color(0xFFB0B0B0).withOpacity(0.2),
                  ),
                ],
              ),
              child: Icon(Icons.add,color: AppColors.themeColor),
            ),
          ),
        ],
      ),
    );
  }


  //Add To Cart Button
  Widget addToCart(){
    return Container(
      margin: EdgeInsets.only(bottom:20),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: AppButton(
          label: "Add To Cart",
          fontWeight: FontWeight.w600,
          padding: EdgeInsets.symmetric(vertical: 25),
          onPressed: () {
            print('Add To Cart');
          },
        ),
      ),
    );
  }

}
