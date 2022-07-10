import 'package:flutter/material.dart';

class Item extends StatefulWidget {
  const Item({Key? key}) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  final _formKey = GlobalKey<FormState>();
  final itemController = TextEditingController();

  final List<String> tasks = [];
  String palavra = '';

  @override
  Widget build(BuildContext context) {
    void _voltar() {
      Navigator.pop(context, palavra);
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Formulário'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Nova tarefa',
                      hintStyle: TextStyle(fontSize: 17)),
                  controller: itemController,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Digite um novo item para salvar';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        palavra = itemController.text;
                        itemController.clear();
                        _voltar();
                        setState(() {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Salvo')));
                        });
                      }
                    },
                    child: const Text('Salvar')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
