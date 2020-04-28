import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _AddPage();
  }
}
 DateTime selectedDate = DateTime.now();
 TimeOfDay selectedtime = TimeOfDay.now();
class _AddPage extends State<AddPage> {
  String sname = "";
  String sid = "";
  String sage = "";
  String scontact = "";
  String ssubject = "";

  final nameController = new TextEditingController();
  final idController = new TextEditingController();

  final ageController = new TextEditingController();
  final contactController = new TextEditingController();

  final subjectController = new TextEditingController();

  void addStudent(
      String sname, String sid, String sage, String scontact, String ssubject) async {
         FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;
    Firestore.instance.collection(uid).add({
      "Task Name": sname,
      "Task Priority": sid,
      "Deadline": sage,
      "contact": scontact,
      "Task Description": ssubject
    });
  }
Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2020, 4),
        lastDate: DateTime(2101));
    
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
Future<Null> selectedTime24Hour(BuildContext context) async {
    final TimeOfDay p = await showTimePicker(
      context: context, 
      initialTime: TimeOfDay.now());
    
    if (p != null && p!= selectedtime)
      setState(() {
        selectedtime = p;
      });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.pink,
        title: Text("Add New Task Information"),
      ),
      body: new ListView(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: nameController,
              onChanged: (String str) {
                sname = str.toString();
              },
              decoration: InputDecoration(
                  hintText: 'Task Name', border: OutlineInputBorder()),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: idController,
              onChanged: (String str) {
                sid = str.toString();
              },
              decoration: InputDecoration(
                  hintText: 'Task Priority', border: OutlineInputBorder()),
            ),
          ),
          SizedBox(
            height: 30,
          ),
       
          Padding(
            padding: const EdgeInsets.all(12.0),
            child :Column(
              children: <Widget>[
                
            Text("${selectedDate.toLocal()}".split(' ')[0]),
            SizedBox(height: 20.0,),
            RaisedButton(
              onPressed: () { _selectDate(context);
              sage = ("${selectedDate}".split(' ')[0]).toString();

              },

              child: Text('Select date'),)
              
              ]
              
            )
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child :Column(
              children: <Widget>[
                
            Text(selectedtime.format(context)),
            SizedBox(height: 20.0,),
            RaisedButton(
              onPressed: () { selectedTime24Hour(context);
              scontact = ("${selectedtime.format(context)}".split(' ')[0]).toString();

              },

              child: Text('Select time'),)
              
              ]
              
            )
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: subjectController,
              onChanged: (String str) {
                ssubject = str.toString();
              },
              decoration: InputDecoration(
                  hintText: 'Description', border: OutlineInputBorder()),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(60.0),
            child: new FlatButton(
              child: Text(
                "Add to List",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.pink,
              onPressed: () {
                setState(() {});

                addStudent(sname, sid, sage, scontact, ssubject);
              },
            ),
          )
        ],
      ),
    );
  }
}
