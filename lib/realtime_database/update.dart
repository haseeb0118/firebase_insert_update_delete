import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class UpdateData extends StatefulWidget {

  @override
  _UpdateDataState createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {

  final databaseRef = FirebaseDatabase.instance.reference().child('Users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 5.0,
        backgroundColor: Colors.greenAccent,
        title: const Text('Update-data',
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
            itemBuilder: (BuildContext context,
                DataSnapshot snapshot,
                Animation<double> animation,
                int index) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.greenAccent,
                  child: Text(snapshot.value['age']),),
                subtitle: Text(snapshot.value['city']),
                title: Text('${snapshot.value['name']}'),
                trailing: IconButton(
                  onPressed: () {
                    updateItem(
                        snapshot.value['name'],
                        snapshot.value['age'],
                        snapshot.value['city'],
                        context, snapshot.key);
                  },
                  icon: Icon(Icons.edit),
                ),
              );
            }

        ),
      ),
    );
  }

  Future<void> updateItem(String name, String age, String city,
      BuildContext context, var key) {
    var nameController = TextEditingController(text: name);
    var ageController = TextEditingController(text: age);
    var cityController = TextEditingController(text: city);
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Are you Sure to Update item ?',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0)),
            content: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      labelText: 'Name',
                      border: UnderlineInputBorder(),
                      prefixIcon: Icon(Icons.person, color: Colors.greenAccent,)
                  ),
                ),
                const SizedBox(height: 10.0,),
                TextField(
                  controller: ageController,
                  decoration: const InputDecoration(
                      labelText: 'Age',
                      border: UnderlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.accessibility_new, color: Colors.greenAccent,)
                  ),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: cityController,
                  decoration: const InputDecoration(
                      labelText: 'City',
                      border: UnderlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.location_city, color: Colors.greenAccent,)
                  ),
                ),

              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  updateData(nameController.text, ageController.text,
                      cityController.text, key);
                  Navigator.of(context).pop();
                },
                child: const Text('Update',
                  style: TextStyle(
                      color: Colors.greenAccent
                  ),),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel',
                  style: TextStyle(
                      color: Colors.greenAccent
                  ),),
              ),
            ],
          );
        }
    );
  }

  void updateData(String name, String age, String city, var key) {
    Map<String, String> x = {
      'name': name,
      'age': age,
      'city': city,};
    databaseRef.child(key).update(x);
  }
}
