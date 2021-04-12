import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 50,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        return Navigator.of(context).pop();
                      }),
                  IconButton(
                      icon:
                          Icon(Icons.info_outline_rounded, color: Colors.white),
                      onPressed: () {
                        print('info');
                      })
                ],
              ),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: 60,
              //   child: Padding(
              //     padding: const EdgeInsets.all(15.0),
              //     child: TextField(
              //       decoration: InputDecoration(labelText: 'Name'),
              //     ),
              //   ),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(20),
              //     color: Colors.grey.withOpacity(0.3),
              //   ),
              // ),
            ],
          ),
        ));
  }
}
