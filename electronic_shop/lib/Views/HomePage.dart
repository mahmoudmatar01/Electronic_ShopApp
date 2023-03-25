import 'package:electronic_shop/Controller/CartController.dart';
import 'package:electronic_shop/Views/Cart_Page.dart';
import 'package:electronic_shop/Widget/My_Card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../Controller/HomePageConreoller.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
             Row(
                children: [
                  Consumer<HomeController>(builder: (context,model,child){
                    return Row(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context)=>Cart()));
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            child: Stack(
                              children: [
                                const Icon(Icons.shopping_cart,color:Colors.white,size: 40,),
                                Positioned(
                                  left: 12,
                                    top: 4,
                                    child:Consumer<CartController>(builder: (context,model2,child){
                                      return Text(
                                        model2.CartLength==0?"":"${model2.CartLength}",
                                        style: const TextStyle(
                                            color: Colors.orange,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold
                                        ),);
                                    })
                                )
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: (){
                              model.changeTheme();
                            },
                            icon: Icon(Icons.nightlight,
                              size: 30,
                              color:Get.isDarkMode?Colors.blueAccent:Colors.white,))
                      ],
                    );
                  }),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(15),
                      alignment: Alignment.topRight,
                      child: const Text("مرحبا بكم بمتجر الالكترونيات ",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                        color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                      ),
                    ),
                  ),
                ],
              ),
        const SizedBox(height: 30,),
        Expanded(
          child: Stack(
                children: [
                  Container(
                    margin:const EdgeInsets.only(top: 80),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)
                      )
                    )),
                  MyCard()
                ]))],
        ),
      ),
    );
  }
}