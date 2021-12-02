
import 'package:firebase_database_insert_data/realtime_database/delete.dart';

import 'package:firebase_database_insert_data/realtime_database/insert_data.dart';
import 'package:firebase_database_insert_data/realtime_database/update.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.greenAccent,
     centerTitle: true,
     title: const Text('Firebase-Task',
     style: TextStyle(
       fontWeight: FontWeight.bold,
       fontSize: 20.0,
       color: Colors.black87,
     letterSpacing: 5.0,
     ),),
     ),
     body: SafeArea(
       child: Center(
         child: Padding(
           padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 100.0),
           child: Column(
             children: [
               const Text('Insert-Delete-Update',
               style: TextStyle(
                 color: Colors.black87,
                 fontSize: 25.0,
                 fontWeight: FontWeight.bold
               ),),
               const SizedBox(height: 100.0),
               allButton('Insert', RealTimeDatabase()),
               const SizedBox(height: 20.0),
               allButton('Delete', DeleteData()),
               const SizedBox(height: 20.0),
               allButton('Update', UpdateData()),

             ],
           ),
         ),
       ),
     ),
   );
  }
  Widget allButton(String text,var pageName){
    return  InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => pageName
        ));
      },
      child: Container(
        height: 60.0,
        width: MediaQuery.of(context).size.width-40,
        decoration: BoxDecoration(
            color: Colors.greenAccent,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  blurRadius: 3.0,
                  spreadRadius: 3.0,
                  color: Colors.grey.withOpacity(0.2)
              )
            ]
        ),
        child:  Center(
          child: Text(text,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 5.0,
            ),),
        ),
      ),
    );
  }
}

