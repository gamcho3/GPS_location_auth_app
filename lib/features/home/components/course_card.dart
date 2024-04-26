import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('images/running.jpg'),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "초심자 코스",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.map,
                        size: 20,
                      ),
                      Text("5km"),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
