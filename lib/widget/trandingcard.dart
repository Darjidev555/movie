import 'package:flutter/material.dart';

class Trandingcard extends StatelessWidget {
  final String imageUrl;
  final String tag;
  final String time;
  final String title;
  final String author;
  final VoidCallback ontap;

  const Trandingcard(
      {super.key,
      required this.ontap,
      required this.imageUrl,
      required this.tag,
      required this.title,
      required this.author,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(5),
        height: 345,
        width: 280,
        decoration: BoxDecoration(
            color: Colors.white30, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Container(
              height: 200,
              width: 270,
              decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(20)),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tag,
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  time,
                  style: const TextStyle(color: Colors.orange),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    child: Text(
                  title,
                  style: const TextStyle(fontSize: 17, color: Colors.white),
                  maxLines: 2,
                ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                const CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.orange,
                ),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Text(
                    maxLines: 1,
                    author,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
