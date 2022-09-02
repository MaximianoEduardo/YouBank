import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youbank/common/thememanager.dart';
import 'package:youbank/screens/home.dart';
import 'package:youbank/screens/login.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => ThemeNotifier(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, _) => MaterialApp(
        initialRoute: 'Login',
        onGenerateRoute: ((settings) {
          if (settings.name == 'Login') {
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const Login();
              },
            );
          }

          if (settings.name == 'Home') {
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const Home();
              },
            );
          }

          return null;
        }),
        theme: theme.getTheme(),
        home: const Login(),
      ),
    );
  }
}
