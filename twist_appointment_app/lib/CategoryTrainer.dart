import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Doctor_details_page.dart';

class CategoryTrainer extends StatefulWidget {
  const CategoryTrainer({Key? key}) : super(key: key);

  @override
  State<CategoryTrainer> createState() => _CategoryTrainerState();
}

class _CategoryTrainerState extends State<CategoryTrainer> {
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.purple,
        //centerTitle: true,
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        actions: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.notifications_rounded,
                color: Colors.white,
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: 5),
              child: Image.asset("image/girl.png"),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: ListView(
                children: [
                  demoTopRatedDr(
                    "image/woman.png",
                    "Çağla Öner",
                    "Heart surgen",
                    "4.1",
                    "",
                  ),
                  demoTopRatedDr(
                    "assets/dr_2.png",
                    "Zeliha",
                    "Bone Specialist",
                    "4.2",
                    "",
                  ),
                  demoTopRatedDr(
                    "assets/dr_3.png",
                    "Sibel",
                    "Eyes Specialist",
                    "4.4",
                    "",
                  ),
                  demoTopRatedDr("assets/dr_2.png", "Dr. Fred Mask",
                      "Heart surgen", "4.3", ""),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget demoTopRatedDr(String img, String name, String speciality,
      String rating, String distance) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DoctorDetailPage()));
      },
      child: Container(
        height: 90,
        // width: size.width,
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              height: 90,
              width: 50,
              child: Image.asset(img),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      name,
                      style: TextStyle(
                        color: Color(0xff363636),
                        fontSize: 17,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Text(
                          "namasdasdse",
                          style: TextStyle(
                            color: Color(0xffababab),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w300,
                          ),
                        ),

                        Container(
                          // Puan containeri
                          margin:
                              EdgeInsets.only(top: 3, left: size.width * 0.25),
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Puan: ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  rating,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
