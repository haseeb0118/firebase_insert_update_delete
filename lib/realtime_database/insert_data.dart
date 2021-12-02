import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RealTimeDatabase extends StatefulWidget {
  const RealTimeDatabase({Key? key}) : super(key: key);

  @override
  _RealTimeDatabaseState createState() => _RealTimeDatabaseState();
}

class _RealTimeDatabaseState extends State<RealTimeDatabase> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final cityController = TextEditingController();

  final databaseRef = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        elevation: 5.0,
        centerTitle: true,
        title: const Text('Insert Data',
        style: TextStyle(
          letterSpacing: 5.0,
          fontSize: 20.0,
          color: Colors.black87
        ),),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 30.0),
              child: Column(
                children:  [
                  const Text('Insert Data',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),),
                  const SizedBox(height: 30.0,),
                  Container(
                    padding: EdgeInsets.only(left: 20.0,top:5.0),
                    height: 60.0,
                    width: MediaQuery.of(context).size.width-30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3.0,
                              spreadRadius: 3.0,
                              color: Colors.grey.withOpacity(0.2)
                          )
                        ]
                    ),
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                          labelText: 'Name',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.person,color: Colors.greenAccent,)
                      ),
                    ),
                  ),
                  const SizedBox(height: 25.0,),
                  Container(
                    padding: EdgeInsets.only(left: 20.0,top:5.0),
                    height: 60.0,
                    width: MediaQuery.of(context).size.width-30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3.0,
                              spreadRadius: 3.0,
                              color: Colors.grey.withOpacity(0.2)
                          )
                        ]
                    ),
                    child: TextField(
                      controller: ageController,
                      decoration: const InputDecoration(
                          labelText: 'Age',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.accessibility_new,color: Colors.greenAccent,)
                      ),
                    ),
                  ),
                  const SizedBox(height: 25.0,),
                  Container(
                    padding: EdgeInsets.only(left: 20.0,top:5.0),
                    height: 60.0,
                    width: MediaQuery.of(context).size.width-30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3.0,
                              spreadRadius: 3.0,
                              color: Colors.grey.withOpacity(0.2)
                          )
                        ]
                    ),
                    child: TextField(
                      controller: cityController,
                      decoration: const InputDecoration(
                          labelText: 'City',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.location_city,color: Colors.greenAccent,)
                      ),
                    ),
                  ),

                  const SizedBox(height: 50.0),

                  InkWell(
                    onTap: (){
                      if(nameController.text.isNotEmpty
                      && ageController.text.isNotEmpty
                      && cityController.text.isNotEmpty ){
                      insertData(nameController.text, ageController.text,
                      cityController.text);
                      }

                    },
                    child: Container(
                      height: 60.0,
                      width: MediaQuery.of(context).size.width-30.0,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3.0,
                              spreadRadius: 3.0,
                              color: Colors.grey.withOpacity(0.2),
                            )
                          ]
                      ),
                      child: const Center(
                        child: Text('Add',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void insertData(String name,String age,String city){

    databaseRef.child('Users').push().set({
      'name' : name,
      'age' : age,
      'city' : city,
    });
    nameController.clear();
    ageController.clear();
    cityController.clear();
  }
}
