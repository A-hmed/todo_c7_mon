import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todo_c7_mon/ui/screens/home/home.dart';
import 'package:todo_c7_mon/utils/my_theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales:const [
        Locale('en'),
        Locale('ar'),
      ],
      locale: Locale("en"),
      routes: {
       Home.routeName: (_) => Home()
      },
      initialRoute: Home.routeName,
    );
  }
}
