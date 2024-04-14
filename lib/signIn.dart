import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'register.dart';
import 'extraUI.dart';
import 'home.dart';

class login_page extends StatefulWidget {
  static const String id='login_page';
  const login_page({super.key});

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool _passObcure=true;
  bool _isLoading=true;
  login(String email,String password)async{
    if(email=="" && password=="") {
      UiHelper.customAlertBox(context, "Please enter required crediantials");
    } else
    {
      UserCredential? userCrediantial;
      try{
        userCrediantial=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) {
          emailController.clear();
          passwordController.clear();
          Navigator.push(context, MaterialPageRoute(builder: (context)=>home_page(currentUserEmail: email)));
          return null;
        });
      } on FirebaseAuthException catch(ex){
        return UiHelper.customAlertBox(context, ex.code.toString());
      }
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 1),(){
      setState(() {
        _isLoading=false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return _isLoading?const Scaffold(
      body: Center(
        //child: SpinKitWaveSpinner(color: Colors.blue,size: 150,waveColor: Colors.blue,),
        child: CircularProgressIndicator(),
      ),
    ):Scaffold(
      backgroundColor: Colors.blue[300],
      body: SafeArea(
        child: Expanded(
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Expanded(flex:4,child: SizedBox()),
              Expanded(flex: 7,child: Image.asset('images/SAFARNAMA1.png',height: 200.0,width: 200.0,)),

              const Expanded(flex: 3,
                child: Text('Welcome back',textAlign: TextAlign.center,style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25,
                    //fontFamily: 'heading'
                ),),
              ),
              Gap(20),
              Expanded(flex: 3,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: emailController,
                    style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,//fontFamily: 'salsa'
                    ),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: 'E-mail',
                        hintStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,//fontFamily: 'salsa'
                        ),
                        prefixIcon: const Icon(Icons.email,color: Colors.purple,),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 3.0
                          ),


                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Colors.black
                            )
                        )
                    ),
                  ),
                ),
              ),
              //SizedBox(height: 10,),
              Gap(20),
              Expanded(flex: 3,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(

                    controller: passwordController,
                    obscureText: _passObcure,
                    style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,fontFamily: 'salsa'
                    ),

                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(_passObcure?Icons.visibility_off:Icons.visibility),onPressed: (){
                          setState(() {
                            _passObcure=!_passObcure;
                          });
                        },
                        ),
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            fontFamily: 'salsa'
                        ),
                        prefixIcon: const Icon(Icons.lock,color: Colors.purple,),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 3.0
                          ),


                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Colors.black
                            )
                        )
                    ),
                  ),
                ),
              ),
              // Expanded(flex:2,child: Row(mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     const SizedBox(width: 10,),
              //     TextButton(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>const ForgotPassword()));}, child: const Text('Forgot Password?',style: TextStyle(fontSize: 13,color: Colors.red,fontFamily: 'solway'),))
              //
              //   ],)),
              SizedBox(height: 20,),
              Expanded(flex: 2,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: 200,
                  height: 45,
                  child: TextButton(onPressed: (){
                    login(emailController.text.toString(), passwordController.text.toString());
                    },
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.purple),
                        side: MaterialStateProperty.all(BorderSide(color: Colors.black87,width: 2))

                      ), child: const Text('Login',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,//fontFamily: 'heading'
                        ),)),
                ),
              ),
              //SizedBox(height: 10,),
              Expanded(flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(),
                    const Text('Don\'t have account?',style: TextStyle(
                        fontSize: 12,//fontFamily: 'solway'
                    ),),

                    TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const registration_page()));}, child: const Text('Create a new account',style: TextStyle(
                        fontSize: 12,color: Colors.purple//fontFamily: 'solway'
                    ),))
                  ],),
              ),
              // Expanded(flex:2,child: SizedBox())
            ],
          ),
        ),
      ),
    );
  }
}
