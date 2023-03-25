import 'package:electronic_shop/Controller/RegisterController.dart';
import 'package:electronic_shop/Views/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Widget/My_Button.dart';

class RegisterPage extends StatefulWidget{
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SafeArea(
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
                        },
                        icon:const Icon(Icons.arrow_back_ios,color: Colors.black54,size: 40,)),
                  ),
                  const SizedBox(height: 30,),
                  Container(
                    margin: const EdgeInsets.all(20),
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                                "images/logo.webp"
                            )
                        )
                    ),
                  ),TextFormField(
                      decoration:  InputDecoration(
                        hintText: "UserName",
                        prefixIcon: const Icon(Icons.person),
                        label: const Text("UserName"),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black54,
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                    ),
                  const SizedBox(height: 10,),
                  Consumer<RegisterController>(builder: (context,model,child){
                    return  TextFormField(
                        onChanged: (val){
                          model.Email=val;
                        },
                        decoration:  InputDecoration(
                          hintText: "Email",
                          prefixIcon: const Icon(Icons.person),
                          label: const Text("Email"),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black54,
                            ),
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                    );
                  }),
                  const SizedBox(height: 10,),
                  Consumer<RegisterController>(builder: (context,model,child){
                    return  TextFormField(
                        onChanged: (val){
                          model.Password=val;
                        },
                        obscureText: model.obcuretext,
                        decoration:  InputDecoration(
                          hintText: "Password",
                          prefixIcon: const Icon(Icons.key),
                          suffixIcon:  IconButton(
                            onPressed: (){
                              setState(() {
                                model.obcuretext=!model.obcuretext;
                              });
                            },
                              icon:model.obcuretext?Icon(Icons.visibility_off):Icon(Icons.visibility)),
                          label: const Text("Password"),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black54,
                            ),
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                    );
                  }),
                  const SizedBox(height: 10,),
                 Consumer<RegisterController>(builder: (context,model,child){
                   return  Material(
                       child:MyButton(text: "Register",OnPress: ()async{
                         await model.RegisterMethod(model.Email!,model.Password!);
                         },)
                   );
                 })
                ],
              ),
            ],
          ),
        )
    );
  }
}