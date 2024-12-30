import 'package:flutter/material.dart';
import 'package:plecement_projects/provider/pro_provider1/pro_provider1.dart';
import 'package:plecement_projects/views/screens/ProOneDay/ProOneDay.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: homePage(),
      ),
    );
  }
}
