import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/const/theme.dart';
import 'package:flutter_application_1/features/home/components/course_card.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElementTitle(
          title: "위치가 가장 가까운 코스",
        ),
        SizedBox(
          height: 200,
          child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: MAIN_SCREEN_PADDING),
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CourseCard();
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 20,
                );
              },
              itemCount: 5),
        ),
        Divider(
          height: 40,
        ),
        ElementTitle(title: "오늘의 코스"),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MAIN_SCREEN_PADDING),
          child: Stack(
            children: [
              Container(
                height: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(
                        "images/running2.jpg",
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              Positioned(
                left: 10,
                top: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "대구 도심에서 펼쳐지는",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    Text("극한의 체력코스",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white))
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ElementTitle extends StatelessWidget {
  const ElementTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 15, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
