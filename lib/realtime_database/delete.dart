import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class DeleteData extends StatefulWidget {
  const DeleteData({Key? key}) : super(key: key);

  @override
  _DeleteDataState createState() => _DeleteDataState();
}

class _DeleteDataState extends State<DeleteData> {
  final databaseRef = FirebaseDatabase.instance.reference().child('Users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 5.0,
        backgroundColor: Colors.greenAccent,
        title: const Text('Delete-Data',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.black87,
            letterSpacing: 5.0,
          ),),
      ),
      body: SafeArea(
        child: FirebaseAnimatedList(
            query: databaseRef,
            itemBuilder: (
                BuildContext context,
                DataSnapshot snapshot,
                Animation<double> animation,
                int index) {
              return  ListTile(
                leading: CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.greenAccent,
                  child: Text(snapshot.value['age']),),
                subtitle: Text(snapshot.value['city']),
                title: Text('${snapshot.value['name']}'),
                trailing: IconButton(
                  onPressed: (){
                    var key = snapshot.key;
                    deleteRecord(key);
                  },
                  icon: Icon(Icons.delete),

                ),


              );

            }

        ),
      ),
    );
  }
  deleteRecord(var key) async {
    await databaseRef.child(key).remove();
  }
}
