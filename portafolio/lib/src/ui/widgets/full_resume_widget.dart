import 'package:flutter/material.dart';

import 'package:universal_html/html.dart' as html;

class FullResume extends StatefulWidget {
  const FullResume({Key? key}) : super(key: key);

  @override
  State<FullResume> createState() => _FullResumeState();
}

class _FullResumeState extends State<FullResume> {
  late bool _selected;

  @override
  void initState() {
    _selected = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => setState(() {
        _selected = true;
      }),
      onExit: (event) => setState(() {
        _selected = false;
      }),
      child: GestureDetector(
        onTap: () {
          _openPDF('assets/docs/CV Jesús Ángel Sosa Hernández - 2023.pdf');
        },
        child: Text(
          'View Full Resume ->',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: _selected == true ? Colors.white : Colors.white70,
            fontStyle: FontStyle.italic
          ),
        ),
      ),
    );
  }

  void _openPDF(String pdfPath) {
    final anchor = html.AnchorElement(
      href: pdfPath,
    )..target = '_blank';

    anchor.click();
  }
}
