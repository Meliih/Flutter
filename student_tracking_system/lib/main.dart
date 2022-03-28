import 'package:flutter/material.dart';
import 'package:student_tracking_system/models/student.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  List<Student> students = [
    Student.withId(1, "Melih", "Kahraman", 95),
    Student.withId(2, "Mehmet Can", "Kahraman", 55),
    Student.withId(3, "Ömer", "Altuntaş", 25)
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Ögrenci Takip Sistemi"),
        ),
        body: buildBody());
  }

  buildBody() {}
}
