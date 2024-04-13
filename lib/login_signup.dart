import 'package:flutter/material.dart';
import 'package:personal_travel_guide/signIn.dart';
import 'register.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(flex:3,child: SizedBox()),
            Expanded(flex:5,child: Image.asset('images/login_image.jpeg')),
            Expanded(flex:1,child: SizedBox(height: 10,)),
            Expanded(flex:1,child: Container(height: 45,
                width: 200,
                child: TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>login_page()));
                }, child: Text('Sign in',style: TextStyle(color: Colors.black87),),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.purple),side: MaterialStateProperty.all(BorderSide(color: Colors.black87,width: 2))),
                  ))),
            Expanded(flex:1,child: SizedBox()),
            Expanded(flex:1,child: Container(height: 45,width: 200,child: TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>registration_page()));
            }, child: Text('Create an account',style: TextStyle(color: Colors.black87),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.purple),side: MaterialStateProperty.all(BorderSide(color: Colors.black87,width: 2))),))),
            Expanded(flex:2,child: SizedBox())
          ],
        ),
      ),
    ));
  }
}

