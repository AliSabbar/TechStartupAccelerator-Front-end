import 'package:flutter/material.dart';
import 'package:housen/providers/dark_theme_provider.dart';
import 'package:housen/providers/home_provider.dart';
import 'package:housen/screens/HomeScreen/home_screen.dart';
import 'package:housen/screens/splashScreen/splash_screen.dart';
import 'package:housen/style/colors.dart';
import 'package:housen/style/themes.dart';
import 'package:provider/provider.dart';

import 'network/local/shared_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedHelper.init();
  bool isDark = SharedHelper.getData(key: 'isDark') ?? false;
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => HomeProvider()),
    ChangeNotifierProvider(
        create: (context) => DarkModeProvider()..changeTheme(isPref: isDark)),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Housen',
      themeMode: context.watch<DarkModeProvider>().isDark
          ? ThemeMode.dark
          : ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkTheme,
      routes: {
        'home':(context) => HomeScreen(),
      },
      home: const SplashScreen(),
    );
  }
}
