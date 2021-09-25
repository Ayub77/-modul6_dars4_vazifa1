import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_database/pages/homepage.dart';

import 'asosiyoyna.dart';
class SecondPage extends StatefulWidget {
  const SecondPage({ Key? key }) : super(key: key);
      static final String id = "SecondPage";
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();


  void  _isLogin(){

      String name = nameController.text.toString().trim();
      String email = emailController.text.toString().trim();
      String phone = phoneController.text.toString().trim();
      String password = passwordController.text.toString().trim();


      var box = Hive.box("ishonch");

      box.put("name", name);
      box.put("email", email);
      box.put("phone", phone);
      box.put("password", password);


     String name1 = box.get("name");
     String email1 = box.get("email");


     print(name1);
     print(email1);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
         width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(25),
        color: Colors.blueGrey[900],
        child: SingleChildScrollView(
          child: Column(
            children: [
               SizedBox(height: MediaQuery.of(context).size.height/15),
               Text("Create",style: TextStyle(color: Colors.white70,fontSize: 26),),
               Text("Account",style: TextStyle(color: Colors.white70,fontSize: 26),),

           SizedBox(height: MediaQuery.of(context).size.height/15),

           TextField(
             controller: nameController,
             decoration: InputDecoration(
               hintText: "User Name",
               hintStyle: TextStyle(color: Colors.grey,fontSize: 14),
               prefixIcon: Icon(Icons.person_outline,color: Colors.grey,size: 20,),
               border: InputBorder.none
             ),
           ),
           Container(
             color: Colors.white60,
             height: 1,
           ),
           SizedBox(height: 18,),
           TextField(
             controller: emailController,
             decoration: InputDecoration(
               hintText: "E-Mail",
               hintStyle: TextStyle(color: Colors.grey,fontSize: 14),
               prefixIcon: Icon(Icons.email,color: Colors.grey,size: 20,),
               border: InputBorder.none
             ),
           ),
           Container(
             color: Colors.white60,
             height: 1,
           ),
           SizedBox(height: 18,),
           TextField(
             controller: phoneController,
             decoration: InputDecoration(
               hintText: "Phone Number",
               hintStyle: TextStyle(color: Colors.grey,fontSize: 14),
               prefixIcon: Icon(Icons.phone_iphone,color: Colors.grey,size: 20,),
               border: InputBorder.none
             ),
           ),
           Container(
             color: Colors.white60,
             height: 1,
           ),
           SizedBox(height: 18,),
           TextField(
             controller: passwordController,
             decoration: InputDecoration(
               hintText: "Password",
               hintStyle: TextStyle(color: Colors.grey,fontSize: 14),
               prefixIcon: Icon(Icons.vpn_key_outlined,color: Colors.grey,size: 20,),
               border: InputBorder.none
             ),
           ),
           Container(
             color: Colors.white60,
             height: 1,
           ),
            SizedBox(height: MediaQuery.of(context).size.height/12),
            Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.withOpacity(.9),
                      Colors.blue.withOpacity(.8),
                      Colors.blue.withOpacity(.8),
                      Colors.white.withOpacity(.5),
                    ]
                  ),
                  borderRadius: BorderRadius.circular(35)
                ),
                child: FlatButton(onPressed: (){

                      _isLogin(); 
                       Navigator.pop(context);
                      Navigator.pushNamed(context, AsosiyOyna.id);

                },
                 child: Icon(Icons.arrow_forward,color: Colors.white70,size: 40,)),
              ),
               SizedBox(height: MediaQuery.of(context).size.height/15),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",style: TextStyle(color: Colors.white30,),),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.pushNamed(context, HomePage.id);
                    },
                    child: Text("SIGN IN",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,),))
                ],
              )
            ],
          ),
        )
        ),
    );
  }
}