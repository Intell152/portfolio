import 'package:flutter/material.dart';
import 'package:portafolio/src/ui/widgets/full_resume_widget.dart';

import 'content_card_widget.dart';
import '../../models/cards_model.dart';

class ResumeWidget extends StatelessWidget {
  const ResumeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Experience ->',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Column(
          children: jobsList
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: CustomCard(content: e),
                ),
              )
              .toList(),
        ),
        const FullResume( ),
      ],
    );
  }
}
