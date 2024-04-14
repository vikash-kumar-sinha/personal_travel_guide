import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'plan.dart';

class Travel extends StatefulWidget {
  const Travel({super.key});

  @override
  State<Travel> createState() => _TravelState();
}

class _TravelState extends State<Travel> {

  String? _selectedDatePicked="NA";
  String? _selectedDateReturn="NA";
  int personNumber=1;
  String dropdownValue = 'Flight';
  Icon iconToShow=Icon(Icons.flight_takeoff);
  TextEditingController cityController=TextEditingController();


  Future<void> _selectDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 1),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != _selectedDatePicked) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      setState(() {
        _selectedDatePicked = formattedDate;
      });
    }
  }
  Future<void> _selectDate2() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 1),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != _selectedDateReturn) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      setState(() {

        _selectedDateReturn = formattedDate;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [Text('current location'),
          IconButton(onPressed: (){}, icon: Icon(Icons.location_on_outlined,size: 20,)),
          
        ],
      ),
      body: ListView(
        children: [
          Container(height:300,width:double.infinity,child: Image.asset('images/travel_image.png')),
          SizedBox(height: 10,),
          Container(height: 120,width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(flex:2,child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text('Depart'),
                    Container(width:300,child: Card(child: ListTile(contentPadding: EdgeInsets.symmetric(horizontal: 5),titleAlignment: ListTileTitleAlignment.center,leading: IconButton(onPressed: _selectDate,icon: Icon(Icons.calendar_month),),title:
                    //Text(_selectedDatePicked?.toIso8601String() ?? 'NA'
                      Text('$_selectedDatePicked',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),
                    ),),))

                  ],)),
                  //Expanded(flex:1,child: SizedBox(width: 10,)),
                  Expanded(flex:2,child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text('Return'),
                    Container(width:300,child: Card(child: ListTile(contentPadding:EdgeInsets.symmetric(horizontal: 5),leading: IconButton(onPressed: _selectDate2,icon: Icon(Icons.calendar_month),),title: Text( '$_selectedDateReturn',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),),))

                  ],)),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(height: 120,width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(flex:2,child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Person'),
                      Container(width:300,child: Card(child: ListTile(contentPadding:EdgeInsets.symmetric(horizontal: 7),leading:IconButton(onPressed: (){
                        if(personNumber<=1)
                          personNumber=2;
                        setState(() {
                          personNumber--;
                        });
                      },icon:Icon(Icons.remove)),title: Text('$personNumber'),trailing: IconButton(onPressed: (){
                        setState(() {
                          personNumber++;
                        });
                      },icon: Icon(Icons.add)),),))

                    ],)),
                 // Expanded(flex:1,child: SizedBox(width: 10,)),
                  Expanded(flex:2,child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex:1,child: Text('Transport')),
                      Expanded(flex: 3,
                        child: Container(width:300,child: Card(child: ListTile(leading: iconToShow,title: Text('Flight'),trailing: DropdownButton<String>(
                          value: dropdownValue,
                          icon: Icon(Icons.arrow_drop_down),
                          //iconSize: 24,
                          //elevation: 16,
                          style: TextStyle(color: Colors.deepPurple),
                          // underline: Container(
                          //   height: 2,
                          //   color: Colors.deepPurpleAccent,
                          // ),
                          onChanged: (String? newValue) {
                            late Icon changedIcon;
                            if(newValue=='Train'){
                              changedIcon=Icon(Icons.train);
                            }else if(newValue=='Bus'){
                              changedIcon=Icon(Icons.directions_bus);
                            }else{
                              changedIcon=Icon(Icons.flight_takeoff);
                            }
                            setState(() {
                              dropdownValue = newValue!;
                              iconToShow=changedIcon;
                            });
                          },
                          items: <String>['Flight', 'Train', 'Bus']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),),)),
                      )

                    ],)),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(height: 120,width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(flex:4,child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('City'),
                      Container(width:300,child: Card(child: ListTile(leading:Icon(Icons.location_on_outlined),title: Container(height: 40,
                        child: TextField(controller: cityController,style:TextStyle(fontSize: 15),decoration: InputDecoration(
                          hintText: 'City',
                          border: InputBorder.none

                        ),),
                      ),),))

                    ],)),
                 // Expanded(flex:1,child: SizedBox(width: 10,)),
                  Expanded(flex:4,child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     // Text('Transport'),
                      SizedBox(height: 27,),
                      Container(width:300,child: Card(color:Colors.teal,child: TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>myPlan(
               adults: personNumber.toString(),checkinDate: _selectedDatePicked.toString(),checkoutDate: _selectedDateReturn.toString(),placeInput: cityController.text,
                      )));},child: Text('Plan'),)))

                    ],)),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,)
        ],
      ),
    ));
  }
}
