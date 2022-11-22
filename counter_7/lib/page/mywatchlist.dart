import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:counter_7/main.dart';
import 'package:counter_7/page/budgetform.dart';
import 'package:counter_7/page/databudget.dart';
import 'package:counter_7/page/mywatchlistdetail.dart';
import 'package:counter_7/models/mywatchlistmodel.dart';

class MyWatchList extends StatefulWidget {
  const MyWatchList({Key? key}) : super(key: key);

  @override
  _MyWatchListState createState() => _MyWatchListState();
}

class _MyWatchListState extends State<MyWatchList> {
  Future<List<Movie>> fetchMovie() async {
    var url = Uri.parse(
        'https://pbp-assignments-mywatchlist.herokuapp.com/mywatchlist/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Movie.
    List<Movie> listMovie = [];
    for (var d in data) {
      if (d != null) {
        listMovie.add(Movie.fromJson(d));
      }
    }

    return listMovie;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Watch List'),
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
                  Navigator.pop(
                    context,
                  );
                },
              ),
            ],
          ),
        ),
        body: FutureBuilder(
            future: fetchMovie(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada watch list :(",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => InkWell(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(7.5),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black, blurRadius: 2.0)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${snapshot.data![index].fields.title}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            // Route ke detail film
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyWatchListDetail(
                                      movie: snapshot.data[index])),
                            );
                          }));
                }
              }
            }));
  }
}
