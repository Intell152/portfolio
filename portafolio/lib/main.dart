import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portafolio/src/ui/views/game_view.dart';

import 'package:provider/provider.dart';
import 'package:portafolio/src/provider/scroll_provider.dart';
import 'src/ui/layout/home_layout.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/fonts/OFL.txt');
    final license2 = await rootBundle.loadString('assets/fonts/OFL Tourney.txt');
    yield LicenseEntryWithLineBreaks(['fonts'], license);
    yield LicenseEntryWithLineBreaks(['fonts'], license2);
  });
  runApp(
    ChangeNotifierProvider(
      create: (context) => ScrollProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    timeDilation = 1;
    return MaterialApp(
      title: 'Jesús Angel Sosa H.',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Agdasima',
        scaffoldBackgroundColor: const Color(0xFF1D1D1D),
      ),
      // home: const GameView(),
      // home: const GameContainer(),
      home: const Stack(children: [
        HomeLayout(),
        GameView()
      ]),
    ).animate().fadeIn(
          duration: 1500.ms,
        );
  }
}
