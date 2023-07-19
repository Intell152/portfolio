library space_scape_package;

import 'package:flame/flame.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'providers/player_provider.dart';
import 'screens/main_menu.dart';

class MyGame extends StatelessWidget {
  const MyGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    // Flame.device.fullScreen(); 
    Flame.device.setPortraitUpOnly();

    LicenseRegistry.addLicense(() async* {
      final license = await rootBundle.loadString('fonts/OFL Tourney.txt');
      yield LicenseEntryWithLineBreaks(['fonts'], license);
    });

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PlayerProvider>(
          create: (_) => PlayerProvider(),
        ),
      ],
      child: FutureBuilder<Widget>(
        future: myGame(),
        builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return snapshot.data ??
                Container(); // Utiliza el valor de snapshot.data como widget hijo
          } else {
            return const SizedBox(); // Muestra un indicador de carga mientras se carga el juego
          }
        },
      ),
    );
  }

  Future<MaterialApp> myGame() async {
    FlameAudio.bgm.initialize();
    // await FlameAudio.bgm.play('SpaceSong.ogg');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Tourney',
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const MainMenu(),
    );
  }
}
