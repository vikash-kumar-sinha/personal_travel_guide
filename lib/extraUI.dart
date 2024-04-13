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
          backgroundColor: Colors.white,
          radius: 30,
          backgroundImage: AssetImage('$img'),
        ),
      ),
      Expanded(flex:1,child: SizedBox(height: 5,)),
      Expanded(flex:2,child: Text('$title',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),))
    ],
  );
}

Widget popularWidget(String img,String place,String country){
  return Container(height: 500,
    child: Stack(
      children: [
        Image.asset('$img',width: 100,height: 600,),
        Positioned(
            top:100,
            left:20,
            child: Column(children: [
          Text('$place'),
          SizedBox(height: 10,),
          Text('$country')
        ],))
      ],
    ),
  );
}
Widget myNewWidget(TextEditingController controller,String hintText){
  return Container(decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 2,
        blurRadius: 4
      )
    ]
  ),child: Padding(padding: EdgeInsets.all(8),child: TextField(
    controller: controller,
    decoration: InputDecoration(
      hintText: hintText,
      border: InputBorder.none
    ),
  ),),);

}

Widget myImageContainer(String img,String place,String state,Color color){
  return Container(
    height: 1050,
    width: 250,
    child: Stack(
      children: [
        Image.asset('$img'),
        Positioned(
          top: 110,
          left: 20,
          child: Column(children: [
            Text('$place',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 25,color:color),),
            Text('$state',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: color),)
          ],),
        )
      ],
    ),
  );
}