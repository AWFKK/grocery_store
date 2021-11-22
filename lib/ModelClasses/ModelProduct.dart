
import 'package:flutter/material.dart';

class Product {
  final String?  title, description;
  final List<String>? image;
  final int? price, size, id;
  final Color color;
  Product({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
    required this.color,
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "Organic Bananas",
      price: 234,
      size: 12,
      description: "7pcs, Priceg",
      image: ["assets/images/grocery_images/banana.png"],
      color: Color(0xFF3D82AE)),
  Product(
      id: 2,
      title: "Red Apple",
      price: 234,
      size: 8,
      description: "1kg, Priceg",
      image: ["assets/images/grocery_images/apple.png"],
      color: Color(0xFFD3A984)),
  Product(
      id: 3,
      title: "Bell Pepper Red",
      price: 234,
      size: 10,
      description: "1kg, Priceg",
      image: ["assets/images/grocery_images/pepper.png",
        "assets/images/red.jpg"],
      color: Color(0xFF989493)),
  Product(
      id: 4,
      title: "Ginger",
      price: 234,
      size: 11,
      description: "250gm, Priceg",
      image: ["assets/images/grocery_images/ginger.png"],
      color: Color(0xFFE6B398)),
  Product(
      id: 5,
      title: "beef",
      price: 234,
      size: 12,
      description: "1kg, Priceg",
      image: ["assets/images/grocery_images/beef.png"],
      color: Color(0xFFFB7883)),
    Product(
    id: 6,
    title: "Chicken",
    price: 234,
    size: 12,
    description: "1kg, Priceg",
    image: ["assets/images/grocery_images/chicken.png"],
    color: Color(0xFFAEAEAE),
  ),

  Product(
    id: 7,
    title: "PS4 Controller",
    price: 234,
    size: 12,
    description: "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …",
    image: [
      "assets/images/ps4_console_white_1.png",
      "assets/images/ps4_console_white_2.png",
      "assets/images/ps4_console_white_3.png",
      "assets/images/ps4_console_white_4.png",
    ],
    color: Color(0xFFAEAEAE),
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
