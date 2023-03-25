import 'package:electronic_shop/Controller/LoginController.dart';
import 'package:electronic_shop/Views/RegisterPage.dart';
import 'package:electronic_shop/Widget/My_Button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(height: 80,),
                Container(
                  margin: EdgeInsets.all(20),
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
                ),
                Consumer<LoginControl>(builder: (context,model,child){
                  return  TextFormField(
                      onChanged: (val){
                            model.Email=val;
                      },
                      decoration:  InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(Icons.person),
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
                SizedBox(height: 10,),
                Consumer<LoginControl>(builder: (context,model,child){
                  return  TextFormField(
                      onChanged: (val){
                        model.PassWord=val;
                      },
                      obscureText: model.obscuretext,
                      decoration:  InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.key),
                        suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              model.obscuretext=!model.obscuretext;
                            });
                          },
                            icon:model.obscuretext?Icon(Icons.visibility_off):Icon(Icons.visibility)),
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
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text("If you haven't an Acoount "),
                      TextButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegisterPage()));
                      }, child: Text("Press here",style: TextStyle(
                        color: Colors.green
                      ),))
                    ],
                  ),
                ),
                Consumer<LoginControl>(builder: (context,model,child){
                  return Material(
                      child:MyButton(text: "Login",OnPress: () async{
                       await model.LoginMethod(model.Email!, model.PassWord!);
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