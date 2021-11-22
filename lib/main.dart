import 'package:flutter/material.dart';

String? value;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Table table;

  Widget initialize() {
    table = Table(
      defaultColumnWidth: const FlexColumnWidth(1),
      border: TableBorder.all(
          color: Colors.black, style: BorderStyle.solid, width: 2),
      children: [
        TableRow(children: [
          Column(children: const [
            Text('Matière', style: TextStyle(fontSize: 20.0))
          ]),
          Column(
              children: const [Text('Note', style: TextStyle(fontSize: 20.0))]),
        ]),
        TableRow(children: [
          Column(children: const [
            Text('Bloc 1', style: TextStyle(fontSize: 20.0))
          ]),
          Column(children: [
            TextFormField(
              textAlign: TextAlign.center,
              decoration: const InputDecoration(hintText: 'Enter note'),
              onSaved: (String? value) {
                print(value);
              },
            )
          ]),
        ]),
        TableRow(children: [
          Column(children: const [
            Text('Bloc 3', style: TextStyle(fontSize: 20.0))
          ]),
          Column(children: [
            TextFormField(
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: 'Enter note',
              ),
            )
          ]),
        ]),
        TableRow(children: [
          Column(children: const [
            Text('Anglais', style: TextStyle(fontSize: 20.0))
          ]),
          Column(children: [
            TextFormField(
              textAlign: TextAlign.center,
              decoration: const InputDecoration(hintText: 'Enter note'),
            )
          ]),
        ]),
        TableRow(children: [
          Column(children: const [
            Text('M.CERF', style: TextStyle(fontSize: 20.0))
          ]),
          Column(children: [
            TextFormField(
              textAlign: TextAlign.center,
              decoration: const InputDecoration(hintText: 'Enter note'),
            )
          ]),
        ]),
        TableRow(children: [
          Column(
              children: const [Text('ECO', style: TextStyle(fontSize: 20.0))]),
          Column(children: [
            TextFormField(
              textAlign: TextAlign.center,
              decoration: const InputDecoration(hintText: 'Enter note'),
            )
          ]),
        ])
      ],
    );
    return table;
  }

  void _calculate() {
    setState(() {
      Column col;
      TextFormField text;
      var index = 0;
      for (var tableRow in table.children) {
        if (index > 0) {
          col = tableRow.children![1] as Column;
          text = col.children[0] as TextFormField;
          print(text.toStringDeep());
        }
        index++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: [
              Container(margin: EdgeInsets.all(20), child: initialize()),
              Text("\n\n $value"),
              FloatingActionButton(
                onPressed: _calculate,
                child: const Text("Calculer"),
              )
            ],
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
