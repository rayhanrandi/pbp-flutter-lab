import 'package:flutter/material.dart';

import 'package:counter_7/main.dart';
import 'package:counter_7/page/budgetform.dart';
import 'package:counter_7/page/databudget.dart';
import 'package:counter_7/page/mywatchlist.dart';
import 'package:counter_7/models/mywatchlistmodel.dart';

class MyWatchListDetail extends StatelessWidget {
  // In the constructor, require a Todo.
  const MyWatchListDetail({super.key, required this.movie});

  // Declare a field that holds the Todo.
  final Movie movie;

  String watchStatus(Watched status) {
    if (status == Watched.EMPTY) {
      return "Yes";
    } else {
      return "No";
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DataBudgetPage()),
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              movie.fields.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      const TextSpan(
                          text: 'Release Date: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: movie.fields.releaseDate),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      const TextSpan(
                          text: 'Rating: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: "${movie.fields.rating}/10"),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      const TextSpan(
                          text: 'Watched: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: watchStatus(movie.fields.watched)),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      const TextSpan(
                          text: 'Review: \n',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: movie.fields.review),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
          ),
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
          child: const Text(
            "Kembali",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
