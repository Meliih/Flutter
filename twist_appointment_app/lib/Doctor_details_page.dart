import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'DbHelper.dart';
import 'package:intl/intl.dart';

class DoctorDetailPage extends StatefulWidget {
  final Trainer trainer;
  const DoctorDetailPage({
    Key? key,
    required this.trainer,
  }) : super(key: key);

  @override
  _DoctorDetailState createState() => _DoctorDetailState();
}

class _DoctorDetailState extends State<DoctorDetailPage> {
  DateTime time = DateTime.now();

  var selectedDay;
  var selectedHour;

  List<String> months = [
    "Ocak",
    "Şubat",
    "Mart",
    "Nisan",
    "Mayıs",
    "Haziran",
    "Temmuz",
    "Ağustos",
    "Eylül",
    "Ekim",
    "Kasım",
    "Aralık"
  ];

  List<String> turkishDays = List<String>.filled(10, "");

  List<String> clocksWeekDays = [];
  List<String> clocksWeekend = List<String>.filled(0, "");

  final dictionary = {
    "Monday": "Pazartesi",
    "Tuesday": "Salı",
    "Wednesday": "Çarşamba",
    "Thursday": "Perşembe",
    "Friday": "Cuma",
    "Saturday": "Cumartesi",
    "Sunday": "Pazar",
  };

  @override
  Widget build(BuildContext context) {
    return initWidget(context, widget.trainer);
  }

  Widget initWidget(BuildContext context, Trainer trainer) {
    List<DateTime> days = possibleAppointment();
    weekDayHours();

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.purple,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.notifications_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Container(
                margin: EdgeInsets.only(left: 30, bottom: 30),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Image.asset(
                        trainer.img,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            child: Text(
                              trainer.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              trainer.domain,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15),
                            child: Text(
                              'Puan: ' + trainer.rating,
                              style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 15,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 30),
              child: Text(
                months[time.month - 1] + " " + time.year.toString(),
                style: TextStyle(
                  color: Color(0xff363636),
                  fontSize: 25,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 20, right: 20),
              height: 90,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: days.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary:
                            selectedDay == index ? Colors.purple : Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedDay = index;
                        });
                        print(selectedDay);
                      },
                      child: demoDates(turkishDays[index],
                          days[index].day.toString(), false, index),
                    );
                  }),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 30),
              child: Text(
                'Saatler',
                style: TextStyle(
                  color: Color(0xff363636),
                  fontSize: 25,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20,left: 20),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(

                    maxCrossAxisExtent: 200,
                    childAspectRatio: 2.7,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: clocksWeekDays.length,
                itemBuilder: (BuildContext context, index) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary:
                          selectedHour == index ? Colors.purple : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        selectedHour = index;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: doctorTimingsData(clocksWeekDays[index], false, index),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.0),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  );
                },
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 50,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xff107163),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x17000000),
                    offset: Offset(0, 15),
                    blurRadius: 15,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Text(
                'Randevu Al',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget demoDates(String day, String date, bool isSelected, int index) {
    return isSelected
        ? Container(
            width: 100,
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              color: Color(0xffFFFFFF00),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    day,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.all(7),
                  child: Text(
                    date,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )
        : Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                width: 80,
                margin: EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        day,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(7),
                      child: Text(
                        date,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }

  Widget doctorTimingsData(String time, bool isSelected,int index) {
    return isSelected
        ? Container(
            margin: EdgeInsets.only(left: 20, top: 10),
            decoration: BoxDecoration(
              color: Color(0xff107163),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 2),
                  child: Icon(
                    Icons.access_time,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 2),
                  child: Text(
                    '08:30 AM',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ],
            ),
          )
        : Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Container(
                margin: EdgeInsets.only(left: 20, top: 10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.0),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 2),
                      child: Icon(
                        Icons.access_time,
                        color: Colors.black,
                        size: 18,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 2),
                      child: Text(
                        time,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        );
  }

  List<DateTime> possibleAppointment() {
    List<DateTime> days = List<DateTime>.filled(10, DateTime(20, 1, 1));

    for (int i = 0; i < days.length; i++) {
      days[i] = DateTime(time.year, time.month, time.day + i);
      var t;
      switch (days[i].weekday) {
        case 1:
          t = "Pazartesi";
          break;
        case 2:
          t = "Salı";
          break;
        case 3:
          t = "Çarşamba";
          break;
        case 4:
          t = "Perşembe";
          break;
        case 5:
          t = "Cuma";
          break;
        case 6:
          t = "Cumartesi";
          break;
        case 7:
          t = "Pazar";
          break;
      }
      turkishDays[i] = t;
    }
    return days;
  }

  List<String>? weekDayHours() {
    DateTime tempDate = new DateFormat("HH:mm").parse("10:00");
    int i = 0;
    clocksWeekDays.clear();
    while (i < 13) {

      clocksWeekDays.add(
          DateFormat("HH:mm").format(DateTime(0, 0, 0, tempDate.hour, i * 60)));
      i++;
    }

  }

  List<String>? weekendHours() {
    for (int i = 10; i < 16; i++) {}
  }
}
