import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sptify/view/shell_screen.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && (Platform.isMacOS || Platform.isLinux || Platform.isWindows)) {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      minimumSize: Size(600, 800),
      windowButtonVisibility: true,
      title: "Spotify",
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.maximize();
      await windowManager.show();
      await windowManager.focus();
    });
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Spotify UI',
      debugShowCheckedModeBanner: false,
      darkTheme: theme(),
      home: const Shell(),
    );
  }

  ThemeData theme() {
    return ThemeData(
      //useMaterial3: true,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
      scaffoldBackgroundColor: const Color(0xFF121212),
      primaryColor: Colors.black,
      colorScheme: ColorScheme.fromSwatch(
        accentColor: Colors.green,
        brightness: Brightness.dark,
      ),
      iconTheme: const IconThemeData().copyWith(color: Colors.white),
      fontFamily: 'Montserrat',
      textTheme: TextTheme(
        headlineLarge: const TextStyle(
          color: Colors.white,
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          fontSize: 12.0,
          color: Colors.grey[300],
          fontWeight: FontWeight.w600,
          letterSpacing: 2.0,
        ),
        bodyLarge: TextStyle(
          color: Colors.grey[300],
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.0,
        ),
        bodyMedium: TextStyle(
          color: Colors.grey[300],
          letterSpacing: 1.0,
        ),
      ),
    );
  }
}
