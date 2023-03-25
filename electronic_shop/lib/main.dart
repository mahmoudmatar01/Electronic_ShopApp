import 'package:electronic_shop/Controller/CartController.dart';
import 'package:electronic_shop/Controller/HomePageConreoller.dart';
import 'package:electronic_shop/Controller/LoginController.dart';
import 'package:electronic_shop/Controller/RegisterController.dart';
import 'package:electronic_shop/Views/Cart_Page.dart';
import 'package:electronic_shop/Views/HomePage.dart';
import 'package:electronic_shop/Views/LoginPage.dart';
import 'package:electronic_shop/Views/RegisterPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>HomeController()),
        ChangeNotifierProvider(create: (context)=>CartController()),
        ChangeNotifierProvider(create: (context)=>LoginControl()),
        ChangeNotifierProvider(create: (context)=>RegisterController())
      ],
      child:GetMaterialApp(
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(name: "/", page: ()=>LoginPage()),
          GetPage(name: "/Register", page: ()=>RegisterPage()),
          GetPage(name: "/HomePage", page: ()=>HomePage()),
          GetPage(name: "/Cart", page: ()=>Cart()),
        ],
        initialRoute: "/",
      ) ,
    );
  }
}

