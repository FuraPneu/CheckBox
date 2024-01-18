// ignore_for_file: unnecessary_new, library_private_types_in_public_api, non_constant_identifier_names, unused_element, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/item.dart';

void main() => runApp(const App());


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 246, 1, 181)),
        useMaterial3: true,
      ),
      home : HomePage(),
    );
  }
}

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  var items = new List<Item>.empty();

  HomePage({super.key}) {
    items = [];
    items.add(Item(title: "Banana", done: false));
    items.add(Item(title: "Feijão", done: true));
    items.add(Item(title: "Açúcar", done: false));
  }
    
  @override   
  _HomePageState createState() => _HomePageState();
}
  
class _HomePageState extends State<HomePage> {   
  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Demo App by Ellen"),
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, int index){
          final item = widget.items[index];
          return CheckboxListTile(
            title: Text(item.title),
            key: Key(item.title),
            value: item.done,
            onChanged: (value){
               setState(() {
                item.done = value!;

              });
            }
          );
        },
      ),
    );
  }
}