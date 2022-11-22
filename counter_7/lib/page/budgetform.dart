import 'package:counter_7/models/budgetmodel.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/page/databudget.dart';
import 'package:counter_7/page/mywatchlist.dart';

import 'package:flutter/services.dart';

class AddBudgetPage extends StatefulWidget {
  const AddBudgetPage({super.key});

  @override
  State<AddBudgetPage> createState() => _AddBudgetPageState();
}

class _AddBudgetPageState extends State<AddBudgetPage> {
  final _formKey = GlobalKey<FormState>();
  final fieldText1 = TextEditingController();
  final fieldText2 = TextEditingController();

  String _judul = "";
  String _nominal = "";
  final List<String> _tipeBudget = ['Pengeluaran', 'Pemasukan'];
  String tipe = "Pengeluaran";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Budget'),
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
                Navigator.pop(
                  context,
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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: TextFormField(
                    controller: fieldText1,
                    decoration: InputDecoration(
                      hintText: "Contoh: Makan Siang",
                      labelText: "Judul",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat judul diketik
                    onChanged: (String? value) {
                      setState(() {
                        _judul = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _judul = value!;
                        fieldText1.clear();
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: fieldText2,
                    decoration: InputDecoration(
                      hintText: "Contoh: 13000",
                      labelText: "Nominal",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat judul diketik
                    onChanged: (String? value) {
                      setState(() {
                        _nominal = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _nominal = value!;
                        fieldText2.clear();
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nominal tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(labelText: 'Pilih Jenis'),
                    value: tipe,
                    items: _tipeBudget
                        .map((label) => DropdownMenuItem(
                              child: Text(label),
                              value: label,
                            ))
                        .toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        tipe = newValue!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        tipe = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // simpen data
              _formKey.currentState!.save();
              print(_judul.toString());
              print(_nominal.toString());
              print(tipe.toString());
              var budget = Budget(
                  _judul.toString(), _nominal.toString(), tipe.toString());
              dataBudget.add(budget);
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 15,
                    child: Container(
                      child: ListView(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        shrinkWrap: true,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Center(
                              child: Text("Data telah tersimpan."),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Kembali'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
          child: const Text(
            "Simpan",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
