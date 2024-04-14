import 'package:flutter/material.dart';
import 'package:personal_travel_guide/extraUI.dart';
import 'package:personal_travel_guide/login_signup.dart';

class newInitial extends StatefulWidget {
  const newInitial({super.key});

  @override
  State<newInitial> createState() => _newInitialState();
}

class _newInitialState extends State<newInitial> {
  bool is_loading=true;
  TextEditingController email=TextEditingController();
  TextEditingController pass=TextEditingController();
  TextEditingController name=TextEditingController();
  TextEditingController destination=TextEditingController();
  TextEditingController number=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      setState(() {
        is_loading=false;
      });
    });


  }
  @override
  Widget build(BuildContext context) {
    return is_loading?Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/family_image.jpg',),
            SizedBox(height: 20,),
            Text('TravelMate',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
            SizedBox(height: 10,),
            Text('Plan & save on travel',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),)
          ],
        ),
      ),
    ):SafeArea(
      child: Login()
    );
  }
}
// Scaffold(
// body: SingleChildScrollView(
// scrollDirection: Axis.vertical,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// SizedBox(height: 10,),
// Container(
//
// height: 300,
// width: double.infinity,
// decoration: BoxDecoration(borderRadius: BorderRadius.circular(35),color: Colors.lightGreen),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Image.asset('images/login_image.jpeg',height: 100,width: 100,),
// SizedBox(height: 5,),
// Text('Travelmate',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
// SizedBox(height: 5,),
// Text('Plan and manage your travel expenses easily!',style: TextStyle(fontSize: 10),)
// ],),
//
//
// ],
// ),
// ),
// SizedBox(height: 30,),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 15),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// myNewWidget(email, 'Email'),
// SizedBox(height: 15,),
// myNewWidget(pass, 'Password'),
// SizedBox(height: 15,),
// myNewWidget(name, 'Name'),
// SizedBox(height: 15,),
// myNewWidget(destination, 'Destination'),
// SizedBox(height: 15,),
// myNewWidget(number, 'Number of Travelers'),
// SizedBox(height: 15,),
// Container(decoration: BoxDecoration(
// color: Colors.lightGreen,
// borderRadius: BorderRadius.circular(25),
// boxShadow: [
// BoxShadow(
// color: Colors.grey.withOpacity(0.2),
// spreadRadius: 2,
// blurRadius: 4
// )
// ]
// ),child: Padding(padding: EdgeInsets.all(8),child: TextButton(
// onPressed: (){},
// child: Center(child: Text('Search')),
// ),
// ),),
// SizedBox(height: 15,)
//
//
// ],
// ),
// )
//
// ],
// ),
// ),
// ),