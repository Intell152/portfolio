import 'package:flutter/material.dart';

import '../../models/cards_model.dart';
import 'content_card_widget.dart';

class ProyectsWidget extends StatelessWidget {
  const ProyectsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Proyects ->',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Column(
          children: proyectsList
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: CustomCard(content: e),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
