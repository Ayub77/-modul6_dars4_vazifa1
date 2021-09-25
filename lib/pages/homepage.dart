import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_database/pages/asosiyoyna.dart';
import 'package:hive_database/pages/secondpage.dart';
class HomePage extends StatefulWidget {
  

  static final String id = "HomePage";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();


  void _islogin(){
      String name = userNameController.text.toString().trim();
      String password = userNameController.text.toString().trim();
  

      var box =Hive.box("ishonch");

      box.put("name",name);
      box.put("password",password);

      String name1 = box.get("name");
      String password1 = box.get("password");


      print(name1);
      print(password1);

  
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
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage("assets/images/ayubxon.jpg"),
                    fit: BoxFit.cover
                  )
                ),
              ),
              SizedBox(height: 15,),
              Text("Welcome Back!",style: TextStyle(color: Colors.white,fontSize: 26),),
              SizedBox(height:5,),
              Text("Sign in to continue",style: TextStyle(color: Colors.white,fontSize: 13),),
              SizedBox(height: MediaQuery.of(context).size.height/13),
              TextField(
                controller: userNameController,
                decoration: InputDecoration(
                  hintText: "User Name",
                  hintStyle: TextStyle(color: Colors.white60,fontSize: 14),
                  prefixIcon: Icon(Icons.person_outline,color: Colors.white60,size: 20,),
                  border: InputBorder.none
                ),
              ),
              Container(
                height: 1,
                color: Colors.white54,
              ),
              SizedBox(height: 20,),
               TextField(
                 controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.white60,fontSize: 14),
                  prefixIcon: Icon(Icons.vpn_key_outlined,color: Colors.white60,size: 20,),
                  border: InputBorder.none
                ),
              ),
              Container(
                height: 1,
                color: Colors.white54,
              ),
              SizedBox(height: 15,),
              Text("Forgot Password?",style: TextStyle(color: Colors.white60),),
               SizedBox(height: MediaQuery.of(context).size.height/11),
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
                      _islogin();
                      Navigator.pop(context);
                      Navigator.pushNamed(context, AsosiyOyna.id);

                },
                 child: Icon(Icons.arrow_forward,color: Colors.white70,size: 40,)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/11),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?",style: TextStyle(color: Colors.white30),),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.pushNamed(context, SecondPage.id);
                    },
                    child: Text("SIGN UP",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),))
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}