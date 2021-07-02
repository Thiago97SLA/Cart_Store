import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/View/Home/Home.Dart';
import 'src/Bloc/Providersstate.Dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Providersstate(),
        ),
      ],
      child: MaterialApp(
        title: 'Prueba_TUL',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Home(),
      ),
    );
  }
}
