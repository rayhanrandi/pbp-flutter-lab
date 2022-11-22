import 'dart:collection';

import 'package:counter_7/page/mywatchlist.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/page/budgetform.dart';
import 'package:counter_7/models/budgetmodel.dart';

List dataBudget = <Budget>[];

class DataBudgetPage extends StatefulWidget {
  const DataBudgetPage({super.key});

  @override
  State<DataBudgetPage> createState() => _DataBudgetPageState();
}

class _DataBudgetPageState extends State<DataBudgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Budget'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            // Menambahkan clickable menu
            ListTile(
              title: const Text('counter_7'),
              onTap: () {
                // Route menu ke halaman utama
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Tambah Budget'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddBudgetPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Data Budget'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pop(
                  context,
                );
              },
            ),
            ListTile(
              title: const Text('My Watch List'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyWatchList()),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
          padding: const EdgeInsets.all(8),
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              for (Budget i in dataBudget) i.show()
              // Column(
              //   children: <Widget>[
              //     Text(i.judul),
              //     Row(
              //       children: [
              //         Text(i.nominal!),
              //         Text(i.tipe!),
              //       ],
              //     )
              //   ],
              // ),
            ],
          )),
    );
  }
}
// https://stackoverflow.com/questions/56947046/flutter-for-loop-to-generate-list-of-widgets
