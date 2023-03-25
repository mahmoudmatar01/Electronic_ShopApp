import 'package:electronic_shop/Controller/CartController.dart';
import 'package:electronic_shop/Models/Product.dart';
import 'package:electronic_shop/Views/Cart_Page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

 class ProductDet extends StatelessWidget{

   String ?imgPath;
   String ?ProductName;
   String ?Price;

   ProductDet({required this.imgPath,required this.Price,required this.ProductName});

  @override
  Widget build(BuildContext context) {

    Size size=MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios,
            size: 30,
            color: Colors.teal,),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)
                ),
                color: Colors.grey[300]
              ),
              child: Column(
                children: [
                        Container(
                          height: size.width*.75,
                          width: size.width*.75,
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                              image: AssetImage("${imgPath}"),
                              fit: BoxFit.fill,
                            )
                          ),
                          padding: const EdgeInsets.all(20),
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 20,
                        width: 15,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        height: 20,
                        width: 15,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 15,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[700],
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black45,
                              offset: Offset(0,10),
                              blurRadius: 10
                            )
                          ]
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                   Row(
                     children: [
                       const Text("Product Name : ",style: TextStyle(
                           fontSize: 22,
                           fontWeight: FontWeight.bold,
                           color: Colors.black54
                       ),),
                       Text("${ProductName}",style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54
                        ),),
                     ],
                   ),
                  const SizedBox(height: 7),
                  Row(
                    children: const [
                      Text("Brand  : ",style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54
                      ),),
                      Text("Apple",style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54
                      ),),
                    ],
                  ),
                  const SizedBox(height: 7,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Price : ",style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange[800]
                      ),),
                      Text("${Price}",style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange[800]
                      ),)
                    ],
                  ),
                      ],
                    ),
                  ),
            const SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: const Text("Description :- this Product is the most powerful Product",style: TextStyle(
                fontSize: 18,
                color: Colors.white
              ),),
            ),
            const SizedBox(height: 20,),

            Consumer<CartController>(builder: (context,model,child){
              return InkWell(
                onTap: (){
                  model.AddProductToCart(
                      new Product(
                          ImagePath:imgPath ,
                          count: 1,
                          Price: Price,
                          brand: "Apple",
                          Name: ProductName));
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Cart()));
                },
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  width: size.width*.7,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(25)
                  ),
                  child: const Text("Comfirm Order",style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w900
                  ),),
                ),
              );
            })
          ],
        )
      )
    );
  }
}