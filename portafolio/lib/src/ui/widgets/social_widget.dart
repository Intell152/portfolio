import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialWidget extends StatefulWidget {
  const SocialWidget({Key? key}) : super(key: key);

  @override
  State<SocialWidget> createState() => _SocialWidgetState();
}

class _SocialWidgetState extends State<SocialWidget> {
  late Color color1;
  late Color color2;

  @override
  void initState() {
    color1 = Colors.white54;
    color2 = Colors.white54;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (event) => setState(() {
            color1 = Colors.white;
          }),
          onExit: (event) => setState(() {
            color1 = Colors.white54;
          }),
          child: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/github.svg',
              // ignore: deprecated_member_use
              color: color1,
            ),
            tooltip: 'GitHub',
            iconSize: 40,
            onPressed: () => _launchURL('https://github.com/Intell152'),
          ),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (event) => setState(() {
            color2 = Colors.white;
          }),
          onExit: (event) => setState(() {
            color2 = Colors.white54;
          }),
          child: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/linkedin.svg',
              // ignore: deprecated_member_use
              color: color2,
              semanticsLabel: 'Label',
            ),
            tooltip: 'LinkedIn',
            iconSize: 40,
            onPressed: () => _launchURL('https://www.linkedin.com/in/jesus-sosa-b5075ab9'),
          ),
        ),
      ],
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
