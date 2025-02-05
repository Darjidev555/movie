import 'package:flutter/material.dart';

class Newstile extends StatelessWidget {
  final String imageUrl;
  final String author;
  final String title;
  final String time;
  final VoidCallback ontap;

  const Newstile(
      {super.key,
        required this.ontap,
        required this.title,
        required this.author,
        required this.time,
        required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.all(10),
        height: 125,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white30,
        ),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueAccent),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.orange,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Flexible(
                        child: Text(
                          maxLines: 1,
                          "$author",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "$title",
                    maxLines: 2,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    maxLines: 1,
                    "$time",
                    style: TextStyle(color: Colors.orange),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
