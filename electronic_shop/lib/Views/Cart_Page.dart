import 'package:electronic_shop/Controller/CartController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget{
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Page",style: TextStyle(
          fontSize: 20,
          color: Colors.black87,
          fontWeight: FontWeight.bold
        ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.arrow_back_ios,size: 30,color: Colors.black87,),
          ),
        ),
      ),
      body: SafeArea(
        child: Consumer<CartController>(builder: (context,model,child){
          return ListView.builder(
              itemCount: model.CartLength,
              itemBuilder: (context ,index){
                return Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border:Border.all(
                              color: Colors.black54,
                              width: 1
                          ),
                        ),
                        width: double.infinity,
                        height: 200,
                        child: Row(
                            children: [
                              Container(
                                width: 150,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("${model.CartProduct[index].ImagePath}")
                                    )
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("${model.CartProduct[index].Name}",style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold
                                        ),),
                                        const SizedBox(height: 5,),
                                        Text("${model.CartProduct[index].brand}",style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold
                                        ),),
                                        const SizedBox(height: 5,),
                                        Container(
                                            child: const Text("this product is the most Powerful Product in list",)),
                                        Text("${model.CartProduct[index].Price} ",style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.red
                                        ),),
                                        const Spacer(),
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.black54,
                                              ),
                                              borderRadius: BorderRadius.circular(25)
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              IconButton(onPressed: (){
                                                setState(() {
                                                  if(model.CartProduct[index].count!>1){
                                                  model.CartProduct[index].count=model.CartProduct[index].count!-1;}
                                                });
                                              }, icon: const Icon(Icons.remove)),
                                              Text("${model.CartProduct[index].count}"),
                                              IconButton(onPressed: (){
                                                setState(() {
                                                  model.CartProduct[index].count=model.CartProduct[index].count!+1;
                                                });
                                              }, icon: const Icon(Icons.add)),
                                            ],),)],),))])),
                    Container(
                      width: double.infinity,
                      height: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: Colors.black54,
                              width: 1
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: (){},
                              child:Row(
                                children: const [
                                  Icon(Icons.heart_broken,color: Colors.grey,),
                                  Text("Add To Favirote",style: TextStyle(
                                      color: Colors.black87
                                  ),)],)),
                          TextButton(
                              onPressed: (){
                                model.RemoveProduct(model.CartProduct[index]);
                              },
                              child:Row(
                                children: const [
                                  Icon(Icons.restore_from_trash,color: Colors.grey,),
                                  Text("Remove",style: TextStyle(
                                      color: Colors.black87
                                  ),)
                                ],
                              ) )
                        ],
                      ),
                    ),
                  ],
                );
              });
        })
      ),
    );
  }
}