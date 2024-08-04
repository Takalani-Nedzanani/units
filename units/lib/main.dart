
import 'package:flutter/material.dart';
import 'package:nedzananitakalani_220002027/models/units_data.dart';
import 'package:nedzananitakalani_220002027/routes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //it will return the pages which have information of json data
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UnitsData(),
        ),
      ],
      builder: (context, child) {
        return const MaterialApp(
          initialRoute: RouteManager.homePage,
          onGenerateRoute: RouteManager.generateRoute,
        );
      },
    );
  }
}
