import 'package:basic_widget/student_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Student.dart';

class StudentAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StudentAdd();
  }
}

class _StudentAdd extends State with StudentValidationMixin {
  var student = Student.witoutInfo();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni ögrenci ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Ögrenci adı",
        hintText: "Melih",
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return validateFirstName(value);
      },
      onSaved: (String? value){
        student.firstName = value!;
      },
    );
  }

  buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Ögrenci soyadı",
        hintText: "Kahraman",
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
       return validateLastName(value);
      },
      onSaved: (String? value){
        student.lastName = value!;
      },
    );
  }

  buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Aldığı not",
        hintText: "85",
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return validateGrade(value);
      },
      onSaved: (String? value){
        student.grade = int.parse(value!);
      },
    );
  }

  buildSubmitButton() {
    return RaisedButton(
        child: Text("Kaydet"),
        onPressed: (){
          if (formKey.currentState!.validate()){
            formKey.currentState?.save();
            saveStudent();
          }
        },
    );
  }

  void saveStudent() {
    print(student.firstName);
    print(student.lastName);
    print(student.grade);
  }
}
