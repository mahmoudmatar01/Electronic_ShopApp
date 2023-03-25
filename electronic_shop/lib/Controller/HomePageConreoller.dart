import 'package:electronic_shop/Models/Product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends ChangeNotifier{



  List<Product>ProductList=[

    Product(
        ImagePath: "images/img2.jpg",
        Price: "890 LE",
        brand: "Matar",
        Name: "Black Airpods"),
    Product(
        ImagePath: "images/img1.jpg",
        Price: "720 LE",
        brand: "Matar",
        Name: "Airpods"),
    Product(
        ImagePath: "images/img3.jpg",
        Price: "930 LE",
        brand: "Elkwauity",
        Name: "Headphone"),
    Product(
        ImagePath: "images/img4.webp",
        Price: "1200 LE",
        brand: "Matar",
        Name: "HeadPhone"),
    Product(
        ImagePath: "images/img5.jpeg",
        Price: "9700 LE",
        brand: "Apple",
        Name: "Apple Watch"),
    Product(
        ImagePath: "images/img6.jpeg",
        Price: "21000 LE",
        brand: "Apple",
        Name: "Iphone 13"),
    Product(
        ImagePath: "images/img8.jpeg",
        Price: "890 LE",
        brand: "Apple",
        Name: "IPad 2020"),
  ];



  changeTheme(){
    if(Get.isDarkMode){
      Get.changeTheme(ThemeData.light());
    }
    else{
      Get.changeTheme(ThemeData.dark());
    }
    notifyListeners();
  }


  get  ProductsLength =>ProductList.length;

}