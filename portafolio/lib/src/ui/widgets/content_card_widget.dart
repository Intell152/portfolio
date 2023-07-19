import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

import 'package:portafolio/src/models/cards_model.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomCard extends StatefulWidget {
  late final CardContent content;
  // ignore: prefer_const_constructors_in_immutables
  CustomCard({Key? key, required this.content}) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late double _elevation;
  late Color? _color;

  @override
  void initState() {
    // widget.list = ['assets/icons/flutter.svg', 'assets/icons/nodejs.svg'];
    _elevation = 0.0;
    _color = Colors.transparent;
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    ); //..repeat(reverse: false);
    _animationController.stop();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.content.image == ''
          ? SystemMouseCursors.basic
          : SystemMouseCursors.click,
      onEnter: (event) => setState(() {
        _color = Colors.white10.withOpacity(0.04);
        _animationController.forward();
        _animationController.repeat();
      }),
      onExit: (event) => setState(() {
        _color = Colors.transparent;
        _animationController.reset();
      }),
      child: GestureDetector(
        onTap: () {
          _launchURL(widget.content.url);
        },
        child: Card(
          elevation: _elevation,
          color: _color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ignore: unnecessary_null_comparison
                widget.content.image == ''
                    ? Text(
                        widget.content.date,
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.white38,
                        ),
                      )
                    : Image.asset(
                        widget.content.image,
                        alignment: Alignment.topLeft,
                        height: 150,
                      ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.content.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.content.subtitle,
                          style: const TextStyle(
                              color: Colors.white38,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(
                            widget.content.body,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Colors.white60,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                          color: Colors.white12,
                          indent: 10,
                          endIndent: 10,
                        ),
                        widget.content.skills != []
                            ? getSkills(widget.content.skills)
                            : const SizedBox(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getSkills(List<String> skills) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: skills
          .map(
            (e) => AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                final double angle = _animationController.value * 2.0 * math.pi;
                final transform =
                    Matrix4.rotationY(angle); //rotationY o X indica el eje
                return Flexible(
                  child: Transform(
                    transform: transform,
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      e,
                      height: 50,
                    ),
                  ),
                );
              },
            ),
          )
          .toList(),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not open URL: $url';
    }
  }
}
