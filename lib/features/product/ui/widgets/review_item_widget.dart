import 'package:flutter/material.dart';

class ReviewItemWidget extends StatelessWidget {
  const ReviewItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      elevation: 1,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.person_outline,
                  color: Colors.grey,
                ),
                SizedBox(width: 4),
                Text(
                  'Rabbil Hasan',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )
                )
              ],
            ),
            SizedBox(height: 8),
            Text(
              '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.''',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
