import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "Todo_App",
      home: TodoApp(),
      debugShowCheckedModeBanner: false,
    ));

class TodoApp extends StatefulWidget {
  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  String value = '';
  var listTodo = [''];
  addTodo(String item) {
    setState(() {
      listTodo.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TODO TASK"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            addTodo(value);
          },
        ),
        body: ListView.builder(
            itemCount: listTodo.length,
            itemBuilder: (context, index) {
              return index == 0
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Add Item"
                        ),
                        onChanged: (val) {
                          setState(() {
                            value = val;
                          });
                        },
                      ),
                    )
                  : ListTile(
                      leading: Icon(Icons.work),
                      title: Text(
                        '${listTodo[index]}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    );
            }));
  }
}
