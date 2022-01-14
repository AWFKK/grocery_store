// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:n_store/Helper/constants.dart';
import 'package:n_store/ModelClasses/ModelCategory.dart';
import 'package:n_store/ModelClasses/ModelProduct.dart';
import 'package:n_store/Screen/ProductDetail/ProductDetail.dart';
import 'package:n_store/styles/colors.dart';


class Products extends StatefulWidget {
  final String? categoryName;


  const Products({Key? key, this.categoryName}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {


  List<CategoryItem> category = [
    CategoryItem(
      name: "Fresh Fruits & Vegetables",
      imagePath: "assets/images/categories_images/fruit.png",
    ),
    CategoryItem(
      name: "Cooking Oil",
      imagePath: "assets/images/categories_images/oil.png",
    ),
    CategoryItem(
      name: "Meat & Fish",
      imagePath: "assets/images/categories_images/meat.png",
    ),
    CategoryItem(
      name: "Bakery & Snacks",
      imagePath: "assets/images/categories_images/bakery.png",
    ),
    CategoryItem(
      name: "Dairy & Eggs",
      imagePath: "assets/images/categories_images/dairy.png",
    ),
    CategoryItem(
      name: "Beverages",
      imagePath: "assets/images/categories_images/beverages.png",
    ),
  ];
  // By default our first item will be selected
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
              color: AppColors.darkGrey,
            ),
            onPressed: () async {
              Navigator.of(context).pop();
            }),
        title: const Text('Products', style:TextStyle(color: AppColors.darkGrey),),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/search_icon.svg",
              // By default our  icon color is white
              color: AppColors.themeColor,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/cart_icon.svg",
              // By default our  icon color is white
              color: AppColors.themeColor,
            ),
            onPressed: () {
              print('Cart Products');
            },
          ),
          const SizedBox(width: kDefaultPaddin / 2)
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          //Category Heading
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: Text(
              widget.categoryName.toString(),
              style: Theme.of(context)
                  .textTheme
                  .headline5?.copyWith(fontWeight: FontWeight.bold, color: AppColors.themeColor,),
            ),
          ),

          //Horizontal Sub Category List
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
            child: SizedBox(
              height: 25,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: category.length,
                itemBuilder: (context, index) => buildCategory(index),
              ),
            ),
          ),

          //Product GridList
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: GridView.builder(
                  itemCount: products.length,
                  physics: BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: kDefaultPaddin,
                    crossAxisSpacing: kDefaultPaddin,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProductDetail(
                              product: products[index],
                          )),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(kDefaultPaddin),
                              decoration: BoxDecoration(
                                color: AppColors.textInPutBG,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: Offset(0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Hero(
                                tag: "${products[index].id}",
                                child: Image.asset(products[index].image![0].toString()),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
                            child: Text(
                              // products is out demo list
                              products[index].title.toString(),
                              style: TextStyle(color: kTextLightColor, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            "\$${products[index].price}",
                            style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.themeColor,),
                          )
                        ],
                      ),
                    );
                  }

              ),
            ),
          ),
        ],
      ),
    );
  }

  //SubCategories List
  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              category[index].name.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? kTextColor : kTextLightColor,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: kDefaultPaddin / 4), //top padding 5
              height: 2,
              width: 30,
              color: selectedIndex == index ? AppColors.themeColor : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
