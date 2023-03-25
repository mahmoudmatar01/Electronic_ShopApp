import 'package:electronic_shop/Views/Product_Details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Controller/HomePageConreoller.dart';

class MyCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
        builder: (context,model,child){
          return ListView.builder(
              itemCount: model.ProductList.length,
              itemBuilder: (context,index){
                return
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 200,
                        width: double.infinity,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                                height: 180,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0,25),
                                          blurRadius: 25
                                      )
                                    ]
                                )),
                            // Positioned(
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 200,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(30),
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              "${model.ProductList[index].ImagePath}"))),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${model.ProductList[index].Name}",
                                        style: const TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        "${model.ProductList[index].brand}",
                                        style: const TextStyle(
                                            color: Colors.black87,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        "${model.ProductList[index].Price}",
                                        style: const TextStyle(
                                            color: Colors.black87),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(builder: (context)=>
                                                  ProductDet(imgPath: "${model.ProductList[index].ImagePath}",
                                                      Price: "${model.ProductList[index].Price}",
                                                      ProductName: "${model.ProductList[index].Name}")));
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal: 35),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  35),
                                              color: Colors.orange),
                                          child: const Text(
                                            "اضف الى العربة",
                                            textDirection:
                                            TextDirection.rtl,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight:
                                                FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )],
                        ),
                      ),
                    ],
                  ) ;
              });
        });
  }
}