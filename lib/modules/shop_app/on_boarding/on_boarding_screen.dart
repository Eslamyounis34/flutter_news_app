import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          PageView.builder(
            itemBuilder: (context, index) => buildingBoardingItem(),
            itemCount: 3,
          )
        ],
      ),
    );
  }

  Widget buildingBoardingItem() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image(image: AssetImage('assets/images/store.png'))),
          SizedBox(
            height: 30,
          ),
          Text(
            "Screen Title",
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Screen Body",
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          )
        ],
      );
}
