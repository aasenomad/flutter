import 'package:flutter/material.dart';
import 'package:maxis1/favorite-screen.dart';
import 'package:maxis1/dummy_data.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryTextTheme: TextTheme()
            .apply(bodyColor: Colors.white, displayColor: Colors.white),
        textTheme: TextTheme()
            .apply(bodyColor: Colors.white, displayColor: Colors.white),
      ),
      home: ChangeNotifierProvider(
        create: (_) => FavoriteProvider(),
        child: Favorite(),
      ),
    );
  }
}
