import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _HomeState();
  List tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(centerTitle: true, title: const Text('Lista de Tarefas')),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final resposta = await Navigator.of(context).pushNamed('/ItemPage');
            resposta;
            setState(() {
              if (resposta != null) {
                tasks.add(resposta);
              }
            });
          },
          child: const Icon(Icons.add),
        ),
        body: Card(
          child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    '${index + 1} - ${tasks[index]}',
                    style: const TextStyle(fontSize: 25),
                  ),
                );
              }),
        ));
  }
}
