// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:n_store/Helper/constants.dart';
import 'package:n_store/ModelClasses/ModelCategory.dart';
import 'package:n_store/Screen/ProductList/Product.dart';
import 'package:n_store/Screen/TabBarScreens/Dashboard/TopBanner.dart';
import 'package:n_store/common_widgets/app_text.dart';
import 'package:n_store/styles/colors.dart';


class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  final Color color = Colors.blue;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start ,
            children: [
              BannerTop(),

              const Padding(
                padding: EdgeInsets.all(8.0),
                child: AppText(
                  text: "All Categories",
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),

              //Categories Grid List
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  childAspectRatio: 0.90,
                  //Making Grid Scrollable
                  physics: ScrollPhysics(),
                  children: List.generate(category.length, (index) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Products(
                            categoryName : category[index].name,
                          )),
                        );
                      },
                      //Grid Item
                      child: Container(
                        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                width : MediaQuery.of(context).size.width,
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

                                child: Image.asset(category[index].imagePath.toString()),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
                              child: Text(
                                // products is out demo list
                                category[index].name.toString(),
                                style: TextStyle(color: AppColors.themeColor, fontWeight: FontWeight.bold),
                              ),
                            ),

                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
