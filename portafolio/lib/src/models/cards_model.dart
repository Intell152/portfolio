import 'content_texts.dart';

class CardContent {
  final String title;
  final String subtitle;
  final String date;
  final String body;
  final String image;
  final String url;
  final List<String> skills;

  CardContent({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.body,
    required this.image,
    required this. url,
    required this.skills,
  });
}

List<CardContent> jobsList = [
  CardContent(
    title: 'CICFA - ABAP Consultant',
    subtitle: 'SAP ABAP Developer y VBDeveloper',
    date: 'Sept-2016 - August-2017',
    body: job1,
    image: '',
    url: '',
    skills: [
      'assets/icons/php.svg',
      'assets/icons/vb.svg',
      'assets/icons/sap.svg',
    ],
  ),
  CardContent(
    title: 'CAPSYS – Systems analyst Senior',
    subtitle: 'Mobile Developer, WEB Developer, ABAP and WF Consultant',
    date: 'August-2017 – May-2021',
    body: job2,
    image: '',
    url: '',
    skills: [
      'assets/icons/flutter.svg',
      'assets/icons/html-5.svg',
      'assets/icons/css.svg',
      'assets/icons/js.svg',
      'assets/icons/sap.svg',
    ],
  ),
  CardContent(
    title: 'LIVERPOOL - Full Systems analyst',
    subtitle: 'Flutter Developer, ABAP and WF Consultant.',
    date: 'May-2021 - February-2023',
    body: job3,
    image: '',
    url: '',
    skills: [
      'assets/icons/flutter.svg',
      'assets/icons/nodejs.svg',
      'assets/icons/html-5.svg',
      'assets/icons/css.svg',
      'assets/icons/js.svg',
      'assets/icons/sap.svg',
    ],
  ),
];

List<CardContent> proyectsList = [
  CardContent(
    title: 'Space Scape',
    subtitle: 'Flutter Flame Game',
    date: '',
    body: proyect1,
    image: 'assets/images/Space_Scape.jpg',
    url: 'https://github.com/Intell152/spaceScape_Intell',
    skills: [
      'assets/icons/flutter.svg',
      'assets/icons/flame.svg',
    ],
  ),
  CardContent(
    title: 'My Portfolio',
    subtitle: 'Flutter Web page',
    date: '',
    body: proyect2,
    image: 'assets/images/portafolio.jpg',
    url: 'https://github.com/Intell152/portfolio',
    skills: [
      'assets/icons/flutter.svg',
    ],
  ),
  CardContent(
    title: 'My Portfolio - BackEnd',
    subtitle: 'Nodejs server',
    date: '',
    body: proyect3,
    image: 'assets/images/portafolio.jpg',
    url: 'https://github.com/Intell152/portfolio_backend',
    skills: [
      'assets/icons/nodejs.svg',
    ],
  ),
];
