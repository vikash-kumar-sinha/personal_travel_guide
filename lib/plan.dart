import 'dart:convert';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';





class myPlan extends StatefulWidget {
   myPlan({super.key,required this.adults,required this.checkinDate,required this.checkoutDate,required this.placeInput});
  String placeInput;
  String checkinDate;
  String checkoutDate;
  String adults;
  @override
  State<myPlan> createState() => _myPlanState();
}

class _myPlanState extends State <myPlan> {
  // TextEditingController placeInput = TextEditingController();
  // TextEditingController checkinDate = TextEditingController();
  // TextEditingController checkoutDate = TextEditingController();
  // TextEditingController adults = TextEditingController();

  var hotelsList = [];
  Map<String, dynamic>? parsedResponse;
  _getDetails() async {
    const apiKey ='YOUR_RAPID_API_KEY';
    const url = 'https://airbnb13.p.rapidapi.com/search-location';
    Map<String, String> queryParams = {
      'location': widget.placeInput,
      'checkin': widget.checkinDate,
      'checkout': widget.checkoutDate,
      'adults': widget.adults,
    };

    Map<String, String> headers = {
      'X-RapidAPI-Key': '7c40c542f0msh0b4844ea9e86f96p1f7176jsnbb4fc9c143b0',
      'X-RapidAPI-Host': 'airbnb-search.p.rapidapi.com'
    };

    try {
      var response = await http.get(
        Uri.parse(url).replace(queryParameters: queryParams),
        headers: headers,
      );
      parsedResponse = jsonDecode(response.body);
      setState(() {
        hotelsList = parsedResponse?['results'];
        print(hotelsList);
      });

    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('My Plan'),
          centerTitle: true,
        ),
        body:SingleChildScrollView(

          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              // Row(
              //   children: [
              //     Expanded(
              //       child: TextField(
              //         controller: placeInput,
              //         decoration: InputDecoration(
              //             enabledBorder: OutlineInputBorder(
              //                 borderSide: BorderSide(
              //                   color: Colors.green,
              //                 ),
              //                 borderRadius: BorderRadius.circular(20)),
              //             labelText: "Destination"),
              //       ),
              //     ),
              //     SizedBox(width: 10),
              //     Expanded(child: TextField(
              //       controller: checkinDate, // editing controller of this TextField
              //       decoration: InputDecoration(
              //           enabledBorder: OutlineInputBorder(
              //               borderSide: BorderSide(
              //                 color: Colors.green,
              //               ),
              //               borderRadius: BorderRadius.circular(20)),
              //
              //           labelText: "Checkin Date" // label text of field
              //       ),
              //       readOnly: true, // set it true, so that user will not able to edit text
              //       onTap: () async {
              //         DateTime? pickedDate = await showDatePicker(
              //             context: context, initialDate: DateTime.now(),
              //             firstDate: DateTime(2000), // DateTime.now() - not to allow to choose before today.
              //             lastDate: DateTime(2101)
              //         );
              //
              //         if(pickedDate != null ){
              //           String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
              //
              //           setState(() {
              //             checkinDate.text = formattedDate; // set output date to TextField value.
              //           });
              //         }else{
              //           print("Date is not selected");
              //         }
              //       },
              //     )),
              //     SizedBox(width: 10),
              //     Expanded(child: TextField(
              //       controller: checkoutDate, // editing controller of this TextField
              //       decoration: InputDecoration(
              //           enabledBorder: OutlineInputBorder(
              //               borderSide: BorderSide(
              //                 color: Colors.green,
              //               ),
              //               borderRadius: BorderRadius.circular(20)),
              //           // icon of text field
              //           labelText: "Checkout Date" // label text of field
              //       ),
              //       readOnly: true, // set it true, so that user will not able to edit text
              //       onTap: () async {
              //         DateTime? pickedDate = await showDatePicker(
              //             context: context, initialDate: DateTime.now(),
              //             firstDate: DateTime(2000), // DateTime.now() - not to allow to choose before today.
              //             lastDate: DateTime(2101)
              //         );
              //
              //         if(pickedDate != null ){
              //           String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
              //
              //           setState(() {
              //             checkoutDate.text = formattedDate; // set output date to TextField value.
              //           });
              //         }else{
              //           print("Date is not selected");
              //         }
              //       },
              //     )),
              //     SizedBox(width: 10),
              //     Expanded(
              //       child: TextField(
              //         controller: adults,
              //         decoration: InputDecoration(
              //             labelText: "Enter adults",
              //             enabledBorder: OutlineInputBorder(
              //                 borderSide: BorderSide(
              //                   color: Colors.green,
              //                 ),
              //                 borderRadius: BorderRadius.circular(20))),
              //       ),
              //     ),
              //     SizedBox(width: 10),
              //     ElevatedButton(
              //       onPressed: _getDetails,
              //       child: Text("Search"),
              //     ),
              //   ],
              // ),
              SizedBox(height: 50),
              hotelsList.length>1 ? Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                    itemCount: hotelsList.length,

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0
                    ),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index){
                      return Card(


                          child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Image.network(


                                  hotelsList[index]['images'][0],height: 100.0),
                              SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(hotelsList[index]['name'],style: TextStyle(fontWeight: FontWeight.bold),),
                              )
                              ,
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("???? "+hotelsList[index]['beds'].toString()),
                                  SizedBox(width: 10),
                                  Text("???? "+hotelsList[index]['bathrooms'].toString() ),
                                ],
                              ),
                              SizedBox(height: 20,),
                              RatingBarIndicator(
                                rating: hotelsList[index]['rating'].toDouble(),
                                itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 16.0,
                                unratedColor: Colors.amber.withAlpha(50),
                                direction: Axis.horizontal,
                              ),
                            ],
                          )
                      );
                    }),
              ) :Padding(
                padding: const EdgeInsets.all(100.0),
                child: Center(child: Text("????Get Hotels List on your finger Tips!",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)),
              )
            ],
          ),
        )
    );
  }
}
