import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:personal_travel_guide/extraUI.dart';
import 'package:personal_travel_guide/travel.dart';
import 'extraUI.dart';
import 'search.dart';
import 'travel.dart';

class home_page extends StatefulWidget {
  const home_page({super.key,required this.currentUserEmail});
  final String? currentUserEmail;
  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  String? username;
  bool is_loading=true;
  String em=String.fromCharCode(0x1F44B);

 getUser()async{
final FirebaseAuth auth=FirebaseAuth.instance;
final User? user=auth.currentUser;
final String? currentUserId=user?.email.toString();

await FirebaseFirestore.instance.collection("Users").doc(currentUserId).get().then((snapshot) {
if(snapshot.exists){
setState(() {
String uName=snapshot.data()?['name'];
String trimname=uName.trim();
List<String> words=trimname.split(" ");
username=words[0][0].toUpperCase()+words[0].substring(1);
is_loading=false;
});
}else{
is_loading=false;
return UiHelper.customAlertBox(context,"Data not found");
}
});
 }
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }



  @override
  Widget build(BuildContext context) {
    return is_loading?const Scaffold(body: Center(child: CircularProgressIndicator(),),):Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          CircleAvatar(
            backgroundColor: Colors.purple,
            radius: 25,
            backgroundImage: AssetImage('images/default_user_image.jpg'),
          ),SizedBox(width: 10,)
        ],
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5,),
            Text("$em Hi!, $username"),
            Text("Where would you like to go? ",style: TextStyle(fontSize: 16),),
          ],
          
        ),
      ),
      body: Column(
        children: [
          Expanded(flex:1,child: SizedBox()),
          Expanded(flex:2,child: SearchScreen()),
          Expanded(flex:1,child: SizedBox(height: 10,)),
          Expanded(flex:6,child: Container(child: Row(
            children: [
              Expanded(flex:1,child: SizedBox()),
              Expanded(flex:3,child: Column(
                children: [
                  Expanded(flex: 2,
                    child: TextButton(
                      onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>Travel()));},
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        backgroundImage: AssetImage('images/Travel_icon.jpeg'),
                      ),
                    ),
                  ),
                  Expanded(flex:1,child: SizedBox(height: 5,)),
                  Expanded(flex:2,child: Text('Travel',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),))
                ],
              )),
              Expanded(flex:1,child: SizedBox(width: 5,)),
              Expanded(flex:3,child: rowWidget('images/hotel_icon.jpeg', 'Hotels')),
              Expanded(flex:1,child: SizedBox(width: 5,)),
              Expanded(flex:3,child: rowWidget('images/flight_icon.jpeg', 'Flights')),
              Expanded(flex:1,child: SizedBox(width: 5,)),
              Expanded(flex:3,child: rowWidget('images/rent_car.jpeg', 'Car Rental')),
              Expanded(flex:1,child: SizedBox(width: 5,)),
            ],
          ),)),
          Expanded(flex:2,child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                  Text('Popular',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                  Text('see all >>',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.blue),)
                ],
              ),
            ),
          )),
          Flexible(flex:10,child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                myImageContainer('images/banaras.jpeg', 'Banaras', 'Utter Pradesh',Colors.orangeAccent),
                SizedBox(width: 5,),
                myImageContainer('images/stupa_dim.jpg', 'Bihar', 'India',Colors.green),
                SizedBox(width: 5,),
                myImageContainer('images/banaras.jpeg', 'Banaras', 'Utter Pradesh',Colors.orangeAccent),
                SizedBox(width: 5,),
                myImageContainer('images/stupa_dim.jpg', 'Bihar', 'India',Colors.green),

                SizedBox(width: 5,),
                myImageContainer('images/banaras.jpeg', 'Banaras', 'Utter Pradesh',Colors.orangeAccent),

                SizedBox(width: 5,),

              ],
            ),
          )),
         // Expanded(flex:1,child: SizedBox())


        ],
      ),
    );
  }
}


// class SearchScreen extends StatefulWidget {
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//   String _searchText = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Padding(
//           padding: EdgeInsets.all(8.0),
//           child: TextField(
//             decoration: InputDecoration(
//               hintText: 'Search...',
//               prefixIcon: Icon(Icons.search),
//             ),
//             onChanged: (value) {
//               setState(() {
//                 _searchText = value;
//               });
//             },
//           ),
//         ),
//         Expanded(
//           child: ListView.builder(
//             itemCount: 50, // Example item count
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text('Item $index'),
//                 // Example of filtering items based on search text
//                 // You can replace this condition with your actual filtering logic
//                 // For example, matching item names with search text
//                 // Here, it's just a simple example
//                 onTap: () {
//                   print('Tapped on Item $index');
//                 },
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }


