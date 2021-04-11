import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  var items = [
    'dfgdgfrg',
    'dfdgdfgrg',
    'tythyty',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 25),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 100),
            SizedBox(height: 30),
            Text(
              'Your name',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Edit profile',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (ctx, index) {
                  return Text(
                    items[index],
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
