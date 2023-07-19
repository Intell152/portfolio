import 'package:flutter/material.dart';

import '../../models/content_texts.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Profile ->',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                profile1,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                    color: Colors.white54),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                profile2,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                    color: Colors.white54),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                profile3,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                    color: Colors.white54),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
