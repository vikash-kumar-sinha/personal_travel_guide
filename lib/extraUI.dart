import 'package:flutter/material.dart';

class UiHelper{
  static customAlertBox(BuildContext context,String text){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(title:Text(text,style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          fontFamily: 'solway',
          color: Colors.blue
      ),),actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child:  Text('Ok',style: aboutTextStyle,))
      ],);
    });
  }
}
TextStyle aboutTextStyle=TextStyle(
  fontFamily: 'salsa',
  fontSize: 15,
  fontWeight: FontWeight.bold,
  color: Colors.black87,

  shadows: [
    Shadow(
      offset: Offset(5.0, 5.0),
      blurRadius: 5.0,
      color: Colors.white.withOpacity(0.5),
    ),
  ],

);

Widget rowWidget(String img,String title){
  return Column(
    children: [
      Expanded(flex: 2,
        child: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('$img'),
        ),
      ),
      Expanded(flex:1,child: SizedBox(height: 5,)),
      Expanded(flex:2,child: Text('$title',style: TextStyle(fontSize: 11),))
    ],
  );
}

Widget popularWidget(String img,String place,String country){
  return Stack(
    children: [
      Image.asset('$img',width: 100,height: 300,),
      Positioned(
          top:100,
          left:20,
          child: Column(children: [
        Text('$place'),
        SizedBox(height: 10,),
        Text('$country')
      ],))
    ],
  );
}