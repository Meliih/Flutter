import 'package:flutter/material.dart';

class DbHelper{

  List<Trainer> Trainers (){

    Trainer trainer = Trainer(1,"image/woman.png","Çağla Öner","5.0","Pilates",1);
    Trainer trainer2 = Trainer(2,"image/girl.png","Zeliha ","5.0","Germe",3);
    Trainer trainer3 = Trainer(3,"image/woman.png","Kadriye","5.0","Jimnastik",2);
    List<Trainer> trainers = List<Trainer>.filled(3, trainer);
    trainers[0] =trainer;
    trainers[1]=trainer2;
    trainers[2]=trainer3;
    return trainers;
  }

  List<Category> Categories(){
    Category category = Category(1,"image/2320765.png", "Pilates", 4);
    Category category1 = Category(2,"image/gymnastics.png", "Jimnastik", 5);
    Category category2 = Category(3,"image/fitness.png" ,"Germe", 6);
    List<Category> categories = List<Category>.filled(3, category);
    categories[0]=category;
    categories[1]=category1;
    categories[2]=category2;
    return categories;
  }


}

class Category{
  late int id;
  late String img;
  late String name;
  late int trainerCount;

  Category(this.id, this.img, this.name, this.trainerCount);
}

class Trainer {
  late int id;
  late String img;
  late String name;
  late String rating;
  late String domain;
  late int category_id;

  Trainer(this.id, this.img, this.name, this.rating, this.domain,this.category_id);

}