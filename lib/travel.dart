import 'package:flutter/material.dart';

class Travel extends StatefulWidget {
  const Travel({super.key});

  @override
  State<Travel> createState() => _TravelState();
}

class _TravelState extends State<Travel> {

  DateTime? _selectedDatePicked;
  DateTime? _selectedDateReturn;

  Future<void> _selectDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 1),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != _selectedDatePicked) {
      setState(() {
        _selectedDatePicked = pickedDate;
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
      setState(() {
        _selectedDateReturn = pickedDate;
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
      body: Column(
        children: [
          Expanded(flex:9,child: Image.asset('images/travel_image.png')),
          Expanded(flex:1,child: SizedBox()),
          Expanded(flex:5,child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(flex:4,child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text('Depart'),
                    Container(width:250,child: Card(child: ListTile(leading: IconButton(onPressed: _selectDate,icon: Icon(Icons.calendar_month),),title:
                    //Text(_selectedDatePicked?.toIso8601String() ?? 'NA'
                      Text('NA'
                    ),),))

                  ],)),
                  Expanded(flex:1,child: SizedBox(width: 10,)),
                  Expanded(flex:4,child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text('Return'),
                    Container(width:250,child: Card(child: ListTile(leading: IconButton(onPressed: _selectDate2,icon: Icon(Icons.calendar_month),),title: Text( 'NA'),),))

                  ],)),
                ],
              ),
            ),
          )),
          Expanded(flex:5,child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(flex:4,child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Person'),
                      Container(width:250,child: Card(child: ListTile(leading:Icon(Icons.remove),title: Text('1'),trailing: Icon(Icons.add),),))

                    ],)),
                  Expanded(flex:1,child: SizedBox(width: 10,)),
                  Expanded(flex:4,child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Transport'),
                      Container(width:250,child: Card(child: ListTile(leading: Icon(Icons.flight_takeoff,),title: Text('Flight'),),))

                    ],)),
                ],
              ),
            ),
          )),
          Expanded(flex:5,child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(flex:4,child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('City'),
                      Container(width:250,child: Card(child: ListTile(leading:Icon(Icons.location_on_outlined),title: Text('Bihar'),),))

                    ],)),
                  Expanded(flex:1,child: SizedBox(width: 10,)),
                  Expanded(flex:4,child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     // Text('Transport'),
                      SizedBox(height: 27,),
                      Container(width:250,child: Card(color:Colors.teal,child: TextButton(onPressed: (){},child: Text('Plan'),)))

                    ],)),
                ],
              ),
            ),
          ))
        ],
      ),
    ));
  }
}
