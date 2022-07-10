import 'package:app_todo/home.dart';
import 'package:app_todo/segunda_tela.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Lista de Tarefas',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => const Home(),
          '/ItemPage': (context) => const Item(),
        },
         initialRoute: '/',
    ); 
  }
}
