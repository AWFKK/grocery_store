import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class BannerTop extends StatefulWidget {
  @override
  _BannerTopState createState() => _BannerTopState();
}

class _BannerTopState extends State<BannerTop> {

  final List<String> images = [
    'https://graphicsfamily.com/wp-content/uploads/2020/08/Online-Shopping-AD-Banner-Design-in-Photoshop-1180x664.jpg',
    'https://img.freepik.com/free-vector/sale-banner-template-design_74379-121.jpg?size=626&ext=jpg',
    'https://static.vecteezy.com/system/resources/thumbnails/000/692/266/small/sale-promotion-banner-template.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDo4N9XpE3gdt_wn3bWPZRdcdY5LelAt132olfrwQP4knZ-3h_8R1pBoVGj_AJtTrmXwU&usqp=CAU',
    'https://image.freepik.com/free-psd/fast-food-concept-banner-template_23-2148777966.jpg',
    'https://assets.materialup.com/uploads/3d93aeff-2058-4e83-bb26-92a2fae5ba2d/preview.jpg',
    'https://cdn.dribbble.com/users/1520130/screenshots/11008333/media/29cb675171cadd88e289ed9872e47b1c.jpg?compress=1&resize=400x300',
  ];


  @override
  Widget build(BuildContext context) {

    return CarouselSlider.builder(
      options: CarouselOptions(
        disableCenter: false,
        //For Banner with full width
        viewportFraction: 1,
        autoPlay: true,
      ),
      itemCount: images.length,
      itemBuilder: (context, index, ini)
      {
        return Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(images[index], fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${index} image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }
}
