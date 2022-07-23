import 'package:flutter/material.dart';
import 'package:myproject/model/transaction.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //final formkey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  List<Transaction> transaction = [
    Transaction(id: 't1', title: 'Books', amount: 250, date: DateTime.now()),
    Transaction(id: 't2', title: 'Food', amount: 100, date: DateTime.now()),
    Transaction(id: 't3', title: 'Park', amount: 150, date: DateTime.now()),
  ];

  _addNewTransaction(String txtTitle, double txtAmout) {
    final newTx = Transaction(
        id: "yy",
        title: txtTitle,
        amount: txtAmout,
        date: DateTime.now());
    setState(() {
      transaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Expense'),
      ),
      body: Column(
        children: [
          Card(
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    //hintText: 'Title',
                    labelText: 'Title',
                  ),
                ),
                TextField(
                  controller: amountController,
                  decoration: InputDecoration(
                    labelText: 'Amount',
                  ),
                ),
                ElevatedButton(onPressed: () {
                  _addNewTransaction(
                      titleController.text,
                      double.parse(amountController.text));
                  print(titleController.text);
                  print(amountController.text);
                }, child: Text('Submit'))
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: transaction.length,
              itemBuilder: (BuildContext context, int index) {
                //return Text('${transaction[index].title}');
                return Card(
                  elevation: 5,
                  child: ListTile(
                    title: Text('${transaction[index].title}'),
                    subtitle: Text('${transaction[index].date}'),
                    trailing: Text('${transaction[index].amount}'),

                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


