import 'package:flutter/material.dart';
import 'package:flutter_provider_state_management/home_screen.dart';
import 'package:flutter_provider_state_management/provider/auth_provider.dart';
import 'package:flutter_provider_state_management/provider/count_provider.dart';
import 'package:flutter_provider_state_management/provider/example_one_provider.dart';
import 'package:flutter_provider_state_management/provider/favorite_provider.dart';
import 'package:flutter_provider_state_management/provider/theme_changer_provider.dart';
import 'package:flutter_provider_state_management/provider/theme_changer_provider.dart';
import 'package:flutter_provider_state_management/provider/theme_changer_provider.dart';
import 'package:flutter_provider_state_management/screen/count_example.dart';
import 'package:flutter_provider_state_management/screen/dark_theme.dart';
import 'package:flutter_provider_state_management/screen/example_one.dart';
import 'package:flutter_provider_state_management/screen/favorite/favorite_screen.dart';
import 'package:flutter_provider_state_management/screen/favorite/login.dart';
import 'package:flutter_provider_state_management/screen/favorite/value_notify_listner.dart';
import 'package:flutter_provider_state_management/stateful_widget_screen.dart';
import 'package:flutter_provider_state_management/why_provider_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> CountProvider()),
        ChangeNotifierProvider(create: (_)=> ExampleOneProvider()),
        ChangeNotifierProvider(create: (_)=> FavoriteItemsProvider()),
        ChangeNotifierProvider(create: (_)=> ThemeChanger()),
        ChangeNotifierProvider(create: (_)=> AuthProvider()),
      ],
      child: Builder(builder: (BuildContext context){
        final themeChanger = Provider.of<ThemeChanger>(context);
        return MaterialApp(
          title: 'Flutter Demo',
          themeMode:Provider.of<ThemeChanger>(context).themeMode,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.red,
          ),
          darkTheme:ThemeData(
           brightness: Brightness.dark,
            primarySwatch: Colors.pink,
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.teal,
            )
          ) ,
          home: LoginScreen(),
        ) ;
      }),
    );

  }
}
